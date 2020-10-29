# BioCommons-Canu-Metrics
Collect compute usage metrics from NCI Gadi BioCommons Canu Workflow

# Usage

1. Change to your Canu working directory (where you ran the PBS script)
2. Clone this repo by:
`git clone https://github.com/Sydney-Informatics-Hub/BioCommons-Canu-Metrics.git`
3. Run the script by:
`perl usage_biocommons_canu.pl`

The metrics will be printed to screen. 

# Benchmark metrics

The metrics below were kindly shared by the Plant Breeding Institute Research Group at the University of Sydney. 

* Species: Barley leaf rust
* Technology: PacBio
* BioCommons Canu version: 2.0

```
Working directory: /scratch/gadi_project_code/path_to_canu_run
Total number of shell scripts: 67
Total number of pbs scripts: 44
Total disk usage after processing: 55G
Total inode usage after processing: 1523
----------------------------------------------------------------
Canu steps performed:
----------------------------------------------------------------
----------------------------------------------------------------
setup
	Number of shell scripts: 24
	Number of pbs scripts: 24
	Number of gadi usage logs found: 24
	Gadi usage file: canu-scripts/canu.01.out canu-scripts/canu.02.out canu-scripts/canu.03.out canu-scripts/canu.04.out canu-scripts/canu.05.out canu-scripts/canu.06.out canu-scripts/canu.07.out canu-scripts/canu.08.out canu-scripts/canu.09.out canu-scripts/canu.10.out canu-scripts/canu.11.out canu-scripts/canu.12.out canu-scripts/canu.13.out canu-scripts/canu.14.out canu-scripts/canu.15.out canu-scripts/canu.16.out canu-scripts/canu.17.out canu-scripts/canu.18.out canu-scripts/canu.19.out canu-scripts/canu.20.out canu-scripts/canu.21.out canu-scripts/canu.22.out canu-scripts/canu.23.out Logs/canu.o
	Gadi PBS scripts: ./jobwrapper_1595490101.pbs ./jobwrapper_1595470823.pbs ./jobwrapper_1595478841.pbs ./jobwrapper_1595462897.pbs ./jobwrapper_1595534153.pbs ./jobwrapper_1595508115.pbs ./jobwrapper_1595462993.pbs ./jobwrapper_1595485830.pbs ./jobwrapper_1595490478.pbs ./jobwrapper_1595485731.pbs ./jobwrapper_1595460657.pbs ./jobwrapper_1595537262.pbs ./jobwrapper_1595463952.pbs ./jobwrapper_1595507639.pbs ./jobwrapper_1595461294.pbs ./jobwrapper_1595508807.pbs ./jobwrapper_1595479139.pbs ./jobwrapper_1595490408.pbs ./jobwrapper_1595479237.pbs ./jobwrapper_1595507770.pbs ./jobwrapper_1595462288.pbs ./jobwrapper_1595535074.pbs ./biocommons_canu.pbs ./jobwrapper_1595461244.pbs
----------------------------------------------------------------
correction

	Second level steps:
	0-mercounts
		Number of shell scripts: 5
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: correction/0-mercounts/meryl_BLR.o8904252 correction/0-mercounts/meryl_BLR.o8903651
		Gadi pbs scripts: correction/0-mercounts/jobwrapper_1595460656.pbs correction/0-mercounts/jobwrapper_1595461244.pbs
	1-overlapper
		Number of shell scripts: 4
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: correction/1-overlapper/cormhap_BLR.o8904978 correction/1-overlapper/cormhap_BLR.o8904260
		Gadi pbs scripts: correction/1-overlapper/jobwrapper_1595462287.pbs correction/1-overlapper/jobwrapper_1595461294.pbs
	2-correction
		Number of shell scripts: 6
		Number of pbs scripts: 3
		Number of gadi usage logs found: 5
		Gadi usage file: correction/2-correction/cor_BLR.o8905525 correction/2-correction/cor_BLR.o8912734 correction/2-correction/cor_BLR.o8912722 correction/2-correction/cor_BLR.o8912730 correction/2-correction/cor_BLR.o8912726
		Gadi pbs scripts: correction/2-correction/jobwrapper_1595470823.pbs correction/2-correction/jobwrapper_1595470822.pbs correction/2-correction/jobwrapper_1595463952.pbs
	BLR.corStore
		Number of shell scripts: 0
		Number of pbs scripts: 0
		Number of gadi usage logs found: 0
		Gadi usage file: 0
		Gadi pbs scripts: 0
----------------------------------------------------------------
trimming

	Second level steps:
	0-mercounts
		Number of shell scripts: 5
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: trimming/0-mercounts/meryl_BLR.o8918133 trimming/0-mercounts/meryl_BLR.o8918356
		Gadi pbs scripts: trimming/0-mercounts/jobwrapper_1595478841.pbs trimming/0-mercounts/jobwrapper_1595479136.pbs
	1-overlapper
		Number of shell scripts: 2
		Number of pbs scripts: 1
		Number of gadi usage logs found: 1
		Gadi usage file: trimming/1-overlapper/obtovl_BLR.o8918424
		Gadi pbs scripts: trimming/1-overlapper/jobwrapper_1595479234.pbs
	3-overlapbasedtrimming
		Number of shell scripts: 0
		Number of pbs scripts: 0
		Number of gadi usage logs found: 0
		Gadi usage file: 0
		Gadi pbs scripts: 0
----------------------------------------------------------------
unitigging

	Second level steps:
	0-mercounts
		Number of shell scripts: 5
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: unitigging/0-mercounts/meryl_BLR.o8928366 unitigging/0-mercounts/meryl_BLR.o8928113
		Gadi pbs scripts: unitigging/0-mercounts/jobwrapper_1595490100.pbs unitigging/0-mercounts/jobwrapper_1595490408.pbs
	1-overlapper
		Number of shell scripts: 2
		Number of pbs scripts: 1
		Number of gadi usage logs found: 1
		Gadi usage file: unitigging/1-overlapper/utgovl_BLR.o8928424
		Gadi pbs scripts: unitigging/1-overlapper/jobwrapper_1595490477.pbs
	3-overlapErrorAdjustment
		Number of shell scripts: 4
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: unitigging/3-overlapErrorAdjustment/oea_BLR.o8939744 unitigging/3-overlapErrorAdjustment/red_BLR.o8939584
		Gadi pbs scripts: unitigging/3-overlapErrorAdjustment/jobwrapper_1595508115.pbs unitigging/3-overlapErrorAdjustment/jobwrapper_1595508807.pbs
	4-unitigger
		Number of shell scripts: 4
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: unitigging/4-unitigger/gfa_BLR.o8948513 unitigging/4-unitigger/bat_BLR.o8948198
		Gadi pbs scripts: unitigging/4-unitigger/jobwrapper_1595534153.pbs unitigging/4-unitigger/jobwrapper_1595537262.pbs
	5-consensus
		Number of shell scripts: 2
		Number of pbs scripts: 1
		Number of gadi usage logs found: 1
		Gadi usage file: unitigging/5-consensus/cns_BLR.o8948285
		Gadi pbs scripts: unitigging/5-consensus/jobwrapper_1595535074.pbs
	BLR.ctgStore
		Number of shell scripts: 0
		Number of pbs scripts: 0
		Number of gadi usage logs found: 0
		Gadi usage file: 0
		Gadi pbs scripts: 0
	BLR.ovlStore
		Number of shell scripts: 4
		Number of pbs scripts: 2
		Number of gadi usage logs found: 2
		Gadi usage file: unitigging/BLR.ovlStore/ovB_BLR.o8939446 unitigging/BLR.ovlStore/ovS_BLR.o8939484
		Gadi pbs scripts: unitigging/BLR.ovlStore/jobwrapper_1595507639.pbs unitigging/BLR.ovlStore/jobwrapper_1595507770.pbs
	BLR.utgStore
		Number of shell scripts: 0
		Number of pbs scripts: 0
		Number of gadi usage logs found: 0
		Gadi usage file: 0
		Gadi pbs scripts: 0
----------------------------------------------------------------
Compute resources used
----------------------------------------------------------------
# Set up
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
canu.01.out	1	1	4.0GB	72.05MB	00:00:01	0.02	48:00:00	00:00:03	0.05	100.0MB	0B	0.40	0.00
canu.02.out	1	1	4.0GB	431.1MB	00:00:02	0.03	48:00:00	00:00:05	0.08	100.0MB	0B	0.38	0.00
canu.03.out	1	1	4.0GB	88.61MB	00:00:03	0.05	48:00:00	00:00:10	0.17	100.0MB	0B	0.29	0.01
canu.04.out	1	1	4.0GB	981.06MB	00:00:02	0.03	48:00:00	00:00:05	0.08	100.0MB	0B	0.38	0.00
canu.05.out	1	1	4.0GB	31.61MB	00:00:01	0.02	48:00:00	00:00:03	0.05	100.0MB	0B	0.40	0.00
canu.06.out	1	1	4.0GB	4.0GB	00:07:01	7.02	48:00:00	00:07:28	7.47	100.0MB	0B	0.94	0.25
canu.07.out	1	1	4.0GB	70.34MB	00:00:02	0.03	48:00:00	00:00:07	0.12	100.0MB	0B	0.25	0.00
canu.08.out	1	1	5.0GB	5.0GB	00:06:06	6.10	48:00:00	00:06:40	6.67	500.0MB	0B	0.91	0.33
canu.09.out	1	1	4.0GB	84.68MB	00:00:03	0.05	48:00:00	00:00:10	0.17	100.0MB	0B	0.29	0.01
canu.10.out	1	1	4.0GB	304.58MB	00:00:04	0.07	48:00:00	00:00:19	0.32	100.0MB	0B	0.22	0.01
canu.11.out	1	1	4.0GB	1.14GB	00:00:03	0.05	48:00:00	00:00:50	0.83	100.0MB	0B	0.06	0.03
canu.12.out	1	1	4.0GB	81.55MB	00:00:02	0.03	48:00:00	00:00:04	0.07	100.0MB	0B	0.43	0.00
canu.13.out	1	1	4.0GB	4.0GB	01:02:16	62.27	48:00:00	01:03:00	63.00	100.0MB	0B	0.99	2.10
canu.14.out	1	1	4.0GB	73.22MB	00:00:02	0.03	48:00:00	00:00:07	0.12	100.0MB	0B	0.25	0.00
canu.15.out	1	1	4.0GB	277.84MB	00:00:02	0.03	48:00:00	00:00:10	0.17	100.0MB	0B	0.18	0.01
canu.16.out	1	1	4.0GB	1.09GB	00:00:03	0.05	48:00:00	00:00:15	0.25	100.0MB	0B	0.20	0.01
canu.17.out	1	1	4.0GB	32.45MB	00:00:01	0.02	48:00:00	00:00:02	0.03	100.0MB	0B	0.67	0.00
canu.18.out	1	1	4.0GB	4.0GB	00:01:49	1.82	48:00:00	00:01:54	1.90	100.0MB	0B	0.96	0.06
canu.19.out	1	1	4.0GB	1.72GB	00:00:11	0.18	48:00:00	00:00:13	0.22	100.0MB	0B	0.82	0.01
canu.20.out	1	1	4.0GB	2.4GB	00:00:04	0.07	48:00:00	00:00:07	0.12	100.0MB	0B	0.58	0.00
canu.21.out	1	1	4.0GB	4.0GB	00:02:39	2.65	48:00:00	00:02:52	2.87	100.0MB	0B	0.92	0.10
canu.22.out	1	1	4.0GB	3.54GB	00:00:53	0.88	48:00:00	00:01:03	1.05	100.0MB	0B	0.84	0.04
canu.23.out	1	1	4.0GB	2.45GB	00:01:17	1.28	48:00:00	00:01:20	1.33	100.0MB	0B	0.96	0.04
canu.o	48	48	192.0GB	39.54GB	00:03:29	3.48	48:00:00	00:03:32	3.53	100.0MB	0B	0.02	5.65

# correction/0-mercounts
## Disk: 11M	 iNode: 35
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
meryl_BLR.o8904252	8	8	24.0GB	21.63GB	00:04:12	4.20	10:00:00	00:00:37	0.62	100.0MB	0B	0.85	0.16
meryl_BLR.o8903651	8	8	16.0GB	16.0GB	00:11:48	11.80	10:00:00	00:09:34	9.57	100.0MB	0B	0.15	2.55

# correction/1-overlapper
## Disk: 2.1M	 iNode: 179
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
cormhap_BLR.o8904978	480	480	1.88TB	596.61GB	50:39:42	3039.70	24:00:00	00:09:53	9.88	3.75TB	4.48GB	0.64	158.13
cormhap_BLR.o8904260	480	480	1.88TB	225.38GB	92:56:31	5576.52	24:00:00	00:16:14	16.23	3.75TB	8.16MB	0.72	259.73

# correction/2-correction
## Disk: 121M	 iNode: 119
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
cor_BLR.o8905525	240	240	960.0GB	181.19GB	140:33:30	8433.50	24:00:00	01:54:00	114.00	1.88TB	8.16MB	0.31	912.00
cor_BLR.o8912734	48	48	1.45TB	47.27GB	35:40:27	2140.45	24:00:00	01:48:56	108.93	1.36TB	4.49GB	0.41	261.44
cor_BLR.o8912722	48	48	1.45TB	62.0GB	56:04:24	3364.40	24:00:00	02:06:30	126.50	1.36TB	4.49GB	0.55	303.60
cor_BLR.o8912730	16	16	496.0GB	26.45GB	18:11:12	1091.20	24:00:00	01:47:36	107.60	464.0GB	4.49GB	0.63	86.08
cor_BLR.o8912726	8	8	248.0GB	16.39GB	08:19:14	499.23	24:00:00	01:29:57	89.95	232.0GB	4.49GB	0.69	35.98

# correction/BLR.corStore
## Disk: 2.6G	 iNode: 3
# trimming/0-mercounts
## Disk: 18M	 iNode: 39
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
meryl_BLR.o8918133	32	32	128.0GB	65.56GB	00:29:44	29.73	24:00:00	00:04:16	4.27	256.0GB	8.12MB	0.22	4.55
meryl_BLR.o8918356	8	8	24.0GB	12.35GB	00:05:31	5.52	10:00:00	00:00:58	0.97	100.0MB	0B	0.71	0.26

# trimming/1-overlapper
## Disk: 2.9M	 iNode: 156
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
obtovl_BLR.o8918424	480	480	1.88TB	410.7GB	652:46:49	39166.82	24:00:00	01:47:10	107.17	3.75TB	8.16MB	0.76	1714.67

# trimming/3-overlapbasedtrimming
## Disk: 116M	 iNode: 34
# unitigging/0-mercounts
## Disk: 16M	 iNode: 39
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
meryl_BLR.o8928366	8	8	24.0GB	11.09GB	00:05:23	5.38	10:00:00	00:00:47	0.78	100.0MB	0B	0.86	0.21
meryl_BLR.o8928113	32	32	128.0GB	60.15GB	00:29:19	29.32	24:00:00	00:04:55	4.92	256.0GB	8.12MB	0.19	5.24

# unitigging/1-overlapper
## Disk: 2.6M	 iNode: 147
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
utgovl_BLR.o8928424	480	480	1.88TB	374.95GB	1617:56:40	97076.67	24:00:00	04:45:16	285.27	3.75TB	8.16MB	0.71	4564.27

# unitigging/3-overlapErrorAdjustment
## Disk: 2.0G	 iNode: 209
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
oea_BLR.o8939744	41	41	1.24TB	56.58GB	25:43:14	1543.23	24:00:00	00:47:46	47.77	1.16TB	8.15MB	0.79	97.92
red_BLR.o8939584	480	480	1.88TB	713.02GB	48:08:57	2888.95	24:00:00	00:10:48	10.80	3.75TB	8.16MB	0.56	172.80

# unitigging/4-unitigger
## Disk: 3.3G	 iNode: 67
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
gfa_BLR.o8948513	8	8	16.0GB	2.76GB	00:27:29	27.48	10:00:00	00:03:52	3.87	100.0MB	0B	0.89	1.03
bat_BLR.o8948198	8	8	64.0GB	25.27GB	00:26:21	26.35	10:00:00	00:12:03	12.05	500.0MB	0B	0.27	4.82

# unitigging/5-consensus
## Disk: 700K	 iNode: 84
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
cns_BLR.o8948285	480	480	1.88TB	124.79GB	14:46:31	886.52	24:00:00	00:35:08	35.13	3.75TB	8.16MB	0.05	562.13

# unitigging/BLR.ctgStore
## Disk: 7.3G	 iNode: 36
# unitigging/BLR.ovlStore
## Disk: 13G	 iNode: 35
#JobName	CPUs_requested	CPUs_used	Mem_requested	Mem_used	CPUtime	CPUtime_mins	Walltime_req	Walltime_used	Walltime_mins	JobFS_req	JobFS_used	Efficiency	Service_units(CPU_hours)
ovB_BLR.o8939446	2	2	8.0GB	8.0GB	00:01:48	1.80	24:00:00	00:01:15	1.25	16.0GB	8.04MB	0.72	0.08
ovS_BLR.o8939484	2	2	62.0GB	34.59GB	00:03:07	3.12	24:00:00	00:02:52	2.87	58.0GB	8.04MB	0.54	0.29

# unitigging/BLR.utgStore
## Disk: 7.2G	 iNode: 58
----------------------------------------------------------------
# correction/0-mercounts
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595460656.pbs	meryl-count.sh	normal	8	16G	default	er01	meryl_BLR	default	1	8	16G
jobwrapper_1595461244.pbs	meryl-process.sh	normal	8	24G	default	er01	meryl_BLR	default	1	8	24G
# correction/1-overlapper
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595462287.pbs	mhap.sh	normal	480	1920G	24:00:00	er01	cormhap_BLR	3840G	116	3	16G
jobwrapper_1595461294.pbs	precompute.sh	normal	480	1920G	24:00:00	er01	cormhap_BLR	3840G	46	3	16G
# correction/2-correction
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595470823.pbs	correctReads.sh	hugemem	48	1488G	24:00:00	er01	cor_BLR	1392G	12	12	4G
jobwrapper_1595470822.pbs	correctReads.sh	hugemem	8	248G	24:00:00	er01	cor_BLR	232G	2	2	4G
jobwrapper_1595463952.pbs	correctReads.sh	normal	240	960G	24:00:00	er01	cor_BLR	1920G	63	12	4G
# correction/BLR.corStore
## None
# trimming/0-mercounts
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595478841.pbs	meryl-count.sh	normal	32	128G	24:00:00	er01	meryl_BLR	256G	4	4	8G
jobwrapper_1595479136.pbs	meryl-process.sh	normal	8	24G	default	er01	meryl_BLR	default	1	8	24G
# trimming/1-overlapper
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595479234.pbs	overlap.sh	normal	480	1920G	24:00:00	er01	obtovl_BLR	3840G	144	6	8G
# trimming/3-overlapbasedtrimming
## None
# unitigging/0-mercounts
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595490100.pbs	meryl-count.sh	normal	32	128G	24:00:00	er01	meryl_BLR	256G	4	4	8G
jobwrapper_1595490408.pbs	meryl-process.sh	normal	8	24G	default	er01	meryl_BLR	default	1	8	24G
# unitigging/1-overlapper
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595490477.pbs	overlap.sh	normal	480	1920G	24:00:00	er01	utgovl_BLR	3840G	135	6	8G
# unitigging/3-overlapErrorAdjustment
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595508115.pbs	red.sh	normal	480	1920G	24:00:00	er01	red_BLR	3840G	113	8	6G
jobwrapper_1595508807.pbs	oea.sh	hugemem	41	1271G	24:00:00	er01	oea_BLR	1189G	41	41	1G
# unitigging/4-unitigger
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595534153.pbs	unitigger.sh	hugemem	8	64G	default	er01	bat_BLR	default	1	8	64G
jobwrapper_1595537262.pbs	alignGFA.sh	normal	8	16G	default	er01	gfa_BLR	default	1	8	16G
# unitigging/5-consensus
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595535074.pbs	consensus.sh	normal	480	1920G	24:00:00	er01	cns_BLR	3840G	78	6	8G
# unitigging/BLR.ctgStore
## None
# unitigging/BLR.ovlStore
## PBS_script	task_script	queue	job_cpus	job_mem	job_walltime	job_proj	job_name	job_jobfs	num_tasks	task_cpu	task_mem
jobwrapper_1595507639.pbs	1-bucketize.sh	normal	2	8G	24:00:00	er01	ovB_BLR	16G	2	2	1G
jobwrapper_1595507770.pbs	2-sort.sh	hugemem	2	62G	24:00:00	er01	ovS_BLR	58G	2	2	1G
# unitigging/BLR.utgStore
## None
```

# Caveats

As the pipeline is still in development, we recognise that there are some caveats and are currently working on:

* Unique jobIDs to avoid overwriting files - done!
* Metrics obtained from Gadi log files (summarized in first part of compute resources used) have no direct link to PBS files (containing per task compute resource requirements)

# Acknowledge us

__ Suggested acknowledgement:__
 The authors acknowledge the scientific and technical assistance
 <or e.g. bioinformatics assistance of <PERSON>> of Sydney Informatics
 Hub and resources and services from the National Computational
 Infrastructure (NCI), which is supported by the Australian Government
 with access facilitated by the University of Sydney.

# Contact us

If you would like bioinformatics assistance or support (e.g. preparing your NCMAS application), please contact sih.info@sydney.edu.au.

