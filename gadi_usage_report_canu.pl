#!/usr/bin/env perl

#------------------------------------------------------------------
# gadi_usage_report_canu/1.0 
# Platform: NCI Gadi HPC
#
# Description: 
# Support script for usage_biocommons_canu.pl
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

use warnings;
use strict;
use POSIX; 
use File::Basename;

my $dir=`pwd`;
chomp $dir; 
my @logs;

my $prefix = ''; 
if ($ARGV[0]) {
	#$prefix=$ARGV[0]; 
	#chomp $prefix;
	@logs=@ARGV;
}
else {
	print "\n######\nWARNING: no log prefix specified. Will report on all log files in $dir.\n######\n\n";
	@logs=split(' ', `ls $dir\/$prefix*.o*`); 
}

my $report={};

print "#JobName\tCPUs_requested\tCPUs_used\tMem_requested\tMem_used\tCPUtime\tCPUtime_mins\tWalltime_req\tWalltime_used\tWalltime_mins\tJobFS_req\tJobFS_used\tEfficiency\tService_units(CPU_hours)\n";

foreach my $file (@logs) { 
	my @name_fields = split('\/', $file);
	#my ($name, $id) = split('\.', $name_fields[-1]);  
	#my ($name, $id) = $name_fields[-1] =~ /(.*)\.(o)$/;
	my $name=basename($file);
	my @walltime = split(' ', `grep "Walltime" $file`); 
	my $walltime_req = $walltime[2];
	my $walltime_used = $walltime[5];
	my ($wall_hours, $wall_mins, $wall_secs) = split('\:', $walltime_used); 
	my $walltime_mins = sprintf("%.2f",(($wall_hours*60) + $wall_mins + ($wall_secs/60)));
	my @cpus = split(' ', `grep "NCPUs" $file`); 
	my $cpus_req = $cpus[2];
	my $cpus_used = $cpus[5];	
	my @mem = split(' ', `tail -n 12 $file | grep "Memory"`);	
	my $mem_req = $mem[2];
	my $mem_used = $mem[5];	
	chomp (my $cputime = `grep "CPU Time Used" $file | awk '{print \$4}'`);
	my ($cpu_hours, $cpu_mins, $cpu_secs, $cputime_mins) = 0;
	my @jobFS = split(' ', `grep "JobFS" $file`);
	my $jobFS_req = $jobFS[2];
	my $jobFS_used = $jobFS[5];		
	my $e = 0; 
	if ($cpus_used!~m/unknown/) {  #not sure if this 'unknown' report ever happens on Gadi like it does on Artemis...
		$cpus_used = ceil($cpus_used); 
		($cpu_hours, $cpu_mins, $cpu_secs) = split('\:', $cputime); 
		$cputime_mins = sprintf("%.2f",(($cpu_hours*60) + $cpu_mins + ($cpu_secs/60)));
		$e = sprintf("%.2f",($cputime_mins/$walltime_mins/$cpus_used));
	} 
	chomp (my $SUs = `grep "Service Units" $file | awk '{print \$3}'`); 
	print "$name\t$cpus_req\t$cpus_used\t$mem_req\t$mem_used\t$cputime\t$cputime_mins\t$walltime_req\t$walltime_used\t$walltime_mins\t$jobFS_req\t$jobFS_used\t$e\t$SUs\n";
}
