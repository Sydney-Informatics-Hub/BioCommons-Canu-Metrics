#! /usr/bin/perl

#------------------------------------------------------------------
# gadi_usage_report_canu/1.0
# Platform: NCI Gadi HPC
#
# Usage:
# In your canu working directory:
# perl usage_biocommons_canu.pl
#
# Description:
# Support script for usage_biocommons_canu.pl
# Automatically collate metrics for biocommons canu run
# Canu pipeline: https://canu.readthedocs.io/en/latest/pipeline.html
# This method:
#       * Search for steps performed in canu-scripts (management scripts) - which seem to break up the top-level steps of the canu workflow into batches by jobwrapper.sh
#       * For each top-level step (canu-step), (either or all of correction, trimming, assembly - called unitigging, not all of which are always performed)
#       * For each top-level step, there are second-level steps (from BLR and test, seems there are the same number and same steps always being performed but best not to assume this)
#       * For each second-level step, there are third-level steps (*.sh, *.pl scripts which are actually doing the compute
#
# Author: Tracy Chew
# tracy.chew@sydney.edu.au
#
# Date last modified: 13/10/2019
#
# If you use this script towards a publication, please acknowledge the
# Sydney Informatics Hub (or co-authorship, where appropriate).
#
# Suggested acknowledgement:
# The authors acknowledge the scientific and technical assistance
# <or e.g. bioinformatics assistance of <PERSON>> of Sydney Informatics
# Hub and resources and services from the National Computational
# Infrastructure (NCI), which is supported by the Australian Government
# with access facilitated by the University of Sydney.
#------------------------------------------------------------------

use strict;
use warnings;

use File::Basename;

#Global variables
my (@top_level_steps, $num_sh, $num_pbs, $num_gadi_usage, @gadi_usage_files, $gadi_usage_files, @gadi_pbs_scripts, $gadi_pbs_scripts, $du, $inode);
my ($queue, $job_cpus, $job_mem, $job_walltime, $job_proj, $job_name, $job_jobfs, $task_cpu, $task_mem, $task_sh);
my (@path, $counttaskhash, $shell_path, $script);
my $perl_usage="./gadi_usage_report_canu.pl";
my %usagehash = ();
my %pbshash = ();

# Find all shell scripts and pbs scripts 
my $pwd=`echo \$PWD`;
$du=`du -sh \$PWD | cut -f 1`;
$inode=`du --inode -s \$PWD | cut -f 1`;
chomp($pwd, $du, $inode);
print "Working directory: $pwd\n";
($num_sh, $num_pbs)=count(".");
print "Total number of shell scripts: $num_sh\n";
print "Total number of pbs scripts: $num_pbs\n";
print "Total disk usage after processing: $du\n";
print "Total inode usage after processing: $inode\n";

# Seach for top-level tasks performed by searching canu-scripts directory
# If count > 1, the step was performed
my $correction = `grep -i "BEGIN CORRECTION" ./canu-scripts/*out | wc -l`;
my $trimming = `grep -i "BEGIN TRIMMING" ./canu-scripts/*out | wc -l`;
my $unitigging = `grep -i "BEGIN ASSEMBLY" ./canu-scripts/*out | wc -l`;
chomp($correction, $trimming, $unitigging);

# Setup is separate
push(@top_level_steps, 'setup' );
if($correction){
	push(@top_level_steps, 'correction');
}
if($trimming){
	push(@top_level_steps, 'trimming');
}
if($unitigging){
	push(@top_level_steps, 'unitigging');
}

# Count sh and pbs scripts for each level, ensuring this matches total scripts found
print "----------------------------------------------------------------\n";
print "Canu steps performed:\n";
print "----------------------------------------------------------------\n";

# Set up scripts are a bit different, don't use subroutines to collect metrics
foreach my $top_level (@top_level_steps){		
	print "----------------------------------------------------------------\n";
	print "$top_level\n";
	my $second_level;	

	if($top_level!~/setup/){
		my @second_levels=find_second_levels("$top_level");

		print "\n\tSecond level steps:\n";
		foreach $second_level (@second_levels){
			print "\t$second_level\n";
			($num_sh, $num_pbs, $num_gadi_usage, $gadi_usage_files, $gadi_pbs_scripts)=count("$top_level/$second_level");
			print "\t\tNumber of shell scripts: $num_sh\n";
		      	print "\t\tNumber of pbs scripts: $num_pbs\n";
        		print "\t\tNumber of gadi usage logs found: $num_gadi_usage\n";
			if(scalar(@$gadi_usage_files)){
				print "\t\tGadi usage file: @$gadi_usage_files\n";
				#@{ $usagehash{$top_level}{$second_level} } = @$gadi_usage_files;
			}
			else{
				print "\t\tGadi usage file: 0\n";
			}
			if(scalar(@$gadi_pbs_scripts)){
				 print "\t\tGadi pbs scripts: @$gadi_pbs_scripts\n";
				 #@{ $pbshash{$top_level}{$second_level} } = @$gadi_pbs_scripts;
			}
			else{
				print "\t\tGadi pbs scripts: 0\n";
			}
			@{ $usagehash{$top_level}{$second_level} } = @$gadi_usage_files;
			@{ $pbshash{$top_level}{$second_level} } = @$gadi_pbs_scripts;
		}
	}
	# setup has no second levels
	else{
		($num_sh, $num_pbs, $num_gadi_usage, $gadi_usage_files, $gadi_pbs_scripts)=count("$top_level");
                print "\tNumber of shell scripts: $num_sh\n";
                print "\tNumber of pbs scripts: $num_pbs\n";
                print "\tNumber of gadi usage logs found: $num_gadi_usage\n";
                print "\tGadi usage file: @$gadi_usage_files\n";
                print "\tGadi PBS scripts: @$gadi_pbs_scripts\n";
		if(@gadi_usage_files){
			$second_level='setup';
			@{ $usagehash{$top_level}{$second_level} } = @gadi_usage_files;
		}
		if(@gadi_pbs_scripts){
			@{ $pbshash{$top_level}{$second_level} } = @gadi_pbs_scripts;
		}
	}
}

print "----------------------------------------------------------------\n";
print "Compute resources used\n";
print "----------------------------------------------------------------\n";

# Get job and per task resources. These can be found in jobwrapper pbs scripts
# Job info: NCPUs, MEM, JobFS requested. Also collect disk and inode used.
# Task info: task name (usually some shell script), number of tasks, CPUs/task, MEM/task*
# 	*Memory needs to be obtained from the actual task shell script "memory=N"
# 	(which may or may not be there). Will not check that shell script 
# 	sets threads to threads defined by ppr in parent job
# Note: disk and inode are final, not what was used during processing

# Print setup usage first. Thankfully everything else is in alphabetical order
print "# Set up\n";
my $usage = `perl $perl_usage @{ $usagehash{setup}{setup} }`;
print "$usage\n";

for my $top_level (sort keys(%usagehash)) {
	if($top_level!~'setup'){
		for my $second_level (sort keys(%{ $usagehash{$top_level} })) {
			$du = `du -sh $top_level/$second_level| cut -f 1`;
			$inode = `du --inode -s $top_level/$second_level | cut -f 1`;
			chomp($du, $inode);
			print "# $top_level/$second_level\n";
			print "## Disk: $du\t iNode: $inode\n";
			if(scalar(@{ $usagehash{$top_level}{$second_level} })){
				print "@{ $usagehash{$top_level}{$second_level} }\n";
				$usage=`perl $perl_usage @{ $usagehash{$top_level}{$second_level} }`;
				print "$usage\n";
			}
		}
	}
}

print "----------------------------------------------------------------\n";

for my $top_level (sort keys(%pbshash)) {
	if($top_level!~'setup'){
		for my $second_level (sort keys(%{ $pbshash{$top_level} })) {
			print "# $top_level/$second_level\n";
			my $test = scalar(@{ $pbshash{$top_level}{$second_level} });
			#print "Num scripts: $test\t@{ $pbshash{$top_level}{$second_level} }\n";
			if(scalar(@{ $pbshash{$top_level}{$second_level} })){
				print "## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem\n";
				my(@pbs_info)=collect_pbs_info($top_level, $second_level, @{ $pbshash{$top_level}{$second_level} });
				#my(@usage_info)=collect_usage_info($top_level, $second_level, @{ $usagehash{$top_level}{$second_level} });
				$"="\n";
				print "@pbs_info\n";
			}
			# No pbs jobs run for top_level, second_level 
			else{
				print "## None\n";	
			}
		}
		
	}
}

## SUBROUTINES --------------------------------------------------------------------------------
sub count {
	my $step = $_[0];
	if($step!~/setup/){
	        $num_sh=`find $step -name "*.sh" | wc -l`;
        	$num_pbs=`find $step -name "*.pbs" | wc -l`;		
		# Collect paths to file containing usage	
		@gadi_usage_files=`find $step -type f -regex '.*o[0-9]*\$' | xargs -n 40 -P 40 grep -l "Resource Usage"`;
		$num_gadi_usage=scalar @gadi_usage_files;
		# Collect paths to pbs scripts
		@gadi_pbs_scripts=`find $step -name "*.pbs"`;
	}
	else{
		$num_sh=`find . canu-scripts -maxdepth 1 -name "*.sh" |  wc -l`;
		$num_pbs=`find . -maxdepth 1 -name "*.pbs" |  wc -l`;
		# canu.out is symbolic link to last canu-script.out file, so it's not counted
		$num_gadi_usage=`grep "Resource Usage" canu-scripts/* Logs/* | wc -l`;
		#@gadi_usage_files=`grep -l  "Resource Usage" canu-scripts/* Logs/*`;
		@gadi_pbs_scripts=`find . -maxdepth 1 -name "*.pbs"`;
	}
	#if( scalar(@gadi_usage_files) == 0 ){
	#	push(@gadi_usage_files, 'None');
	#}
	#if( scalar(@gadi_pbs_scripts) == 0 ){
	#	push(@gadi_pbs_scripts, 'None');
	#}	
	chomp($num_sh, $num_pbs, $num_gadi_usage, @gadi_usage_files, @gadi_pbs_scripts);
	return($num_sh, $num_pbs, $num_gadi_usage, \@gadi_usage_files, \@gadi_pbs_scripts);
}
sub find_second_levels {
	my $step = $_[0];
	if($step!~/setup/){
		my @second_levels = `find $step\/* -maxdepth 0 -type d | cut -d '/' -f 2`;
		chomp(@second_levels);
		return(@second_levels);
	}
}
sub collect_pbs_info {
	# PBS job scripts for second level 
	my $top_level=$_[0];
	my $second_level=$_[1];
	my @pbs_scripts=@_[2 .. $#_];
	my (@pbs_info, $pbs_script, $numtaskhash, $queuehash);

	foreach my $pbs (@pbs_scripts){
		if($pbs){
			#print "Checking $pbs\n";
			if($pbs !~ m/.+(\/)/g ){
				$top_level='setup';
				$second_level='setup';
				$pbs_script=basename($pbs);
			}
			else{
				($top_level, $second_level, @path)=split('/',$pbs);
				$pbs_script=basename($pbs);
			}
			
			# Collect PBS job requests
			$queue=`perl -lne 'print \$3 if /^#PBS(\\s)?-q(\\s)?(.+?)\$/' $pbs`;
			$job_cpus=`perl -lne 'print \$4 if /^#PBS(\\s)?-l(\\s)?(.+?,)?ncpus=(.+?)(,.*)?\$/' $pbs`;
			$job_mem=`perl -lne 'print \$4 if /^#PBS(\\s)?-l(\\s)?(.+?,)?mem=(.+?)(,.*)?\$/' $pbs`;
			$job_walltime=`perl -lne 'print \$4 if /^#PBS(\\s)?-l(\\s)?(.+?,)?walltime=(.+?)(,.*)?\$/' $pbs`;
			unless ($job_walltime){	$job_walltime="default";	}
			$job_jobfs=`perl -lne 'print \$4 if /^#PBS(\\s)?-l(\\s)?(.+?,)?jobfs=(.+?)(,.*)?\$/' $pbs`;
			unless ($job_jobfs){	$job_jobfs="default";	}
			$job_proj=`perl -lne 'print \$3 if /^#PBS(\\s)?-P(\\s)?(.+?)\$/' $pbs`;
			$job_name=`perl -lne 'print \$3 if /^#PBS(\\s)?-N(\\s)?(.+?)\$/' $pbs`;
			
			#$queuehash->{$top_level}->{$second_level}->{$pbs_script}->{queue}=$queue;
				
			# Collect task info
			# Check for mpirun command, if present, parallel tasks were run.
			my $runs_parallel=`grep "mpirun -map-by" $pbs`;
			if ($runs_parallel){
				$task_cpu=`perl -lne 'print \$1 if /^mpirun -map-by ppr:(\\d+):node:PE=(\\d+)/' $pbs`;
				$task_mem=`perl -lne 'print \$2 if /^mpirun -map-by ppr:(\\d+):node:PE=(\\d+)/' $pbs`;
				open(PBS,$pbs)||die "Could not open $pbs: $!\n";
				while(<PBS>){
					chomp($_);
					if($_=~/(\s)?(.\S*\.sh)(\s)?/){
						$shell_path=$2;
						$script=basename($shell_path);
						$counttaskhash->{$top_level}->{$second_level}->{$pbs_script}->{$script}++;
					}
					else{
						$script="task was not a shell script";
					}
				}
				close PBS;
				
			}
			# If not present, single task was performed (num_tasks should be 1)
			else{
				$task_cpu=$job_cpus;
				$task_mem=$job_mem;
				open(PBS,$pbs)||die "Could not open $pbs: $!\n";
				while(<PBS>){
					chomp($_);
					if($_=~/(\s)?(.\S*\.sh)(\s)?/){
						$shell_path=$2;
						$script=basename($shell_path);
						$counttaskhash->{$top_level}->{$second_level}->{$pbs_script}->{$script}++;
					}
					else{
						$script="task was not a shell script";
					}
				}
				close PBS;
			}
			
			chomp($queue, $job_cpus, $job_mem, $job_walltime, $job_proj, $job_name, $job_jobfs, $task_cpu, $task_mem);
			unless ($task_mem =~ /g|G/){	$task_mem .= 'G'	}
			$job_mem=uc $job_mem;
			$task_mem=uc $task_mem;
		}
		foreach my $top_level (sort keys %{ $counttaskhash }){
			foreach my $second_level (sort keys %{ $counttaskhash->{$top_level} }){
				# Retrieve per task info
				if($pbs_script){
					foreach my $script (sort keys %{ $counttaskhash->{$top_level}->{$second_level}->{$pbs_script} }){
						my $num_tasks=$counttaskhash->{$top_level}->{$second_level}->{$pbs_script}->{$script};
						push(@pbs_info, "$pbs_script\t$script\t$queue\t$job_cpus\t$job_mem\t$job_walltime\t$job_proj\t$job_name\t$job_jobfs\t$num_tasks\t$task_cpu\t$task_mem");
					}
				}
				else{
					push(@pbs_info, "No PBS jobs");
				}		
			}
		}
	}	
	return(@pbs_info);
}

