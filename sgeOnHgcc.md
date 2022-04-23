# Using Sun Grid Engine on the Human Genetics Compute Cluster

- Revision: 2017-01-03
- Original by: Viren Patel
- Edited by: TS Wingo
- Requirements:
  1. Familiarity with Linux command line
  - See [The Linux Command Line by William E. Shotts, Jr.](http://linuxcommand.org/tlcl.php/)
  2. Secure Shell (SSH) setup on your computer.

# Human Genetics Compute Cluster (HGCC)

- HGCC consists of one head node and 9 compute nodes.
- The computes nodes have varying amounts of RAM, CPU (cores), and local
  scratch space (`/tmp`)
- Head node is called node00
- Compute nodes are called node01, node02, …

# Sun Grid Engine (SGE)

- HGCC uses Sun Grid Engine to schedule and run jobs on the cluster.
- The main command for submitting jobs is `qsub`.
- This tutorial will demonstrate how to use qsub effectively.

# SGE Queues on HGCC

- There are two queues defined on HGCC – b.q and i.q

`b.q`

- For batch (non-interactive) jobs
- Restricted to node01 – node06
- Job defaults: _1 core / 8GB RAM_
- 240 hours maximum run time
- Requestable resources:
  - Cores
  - Run time
  - Memory is not requestable per se; you get 8 GB per core requested (See
    slide on requesting additional resources).

`i.q`

- For interactive jobs, e.g. to run program with a GUI, or requiring command
  line access
- Restricted to node07 – node09
- Job defaults
  - 1 core / 8GB RAM
  - 24 hours max. run time
  - Requestable resources:
    - Cores

# Strategies

- Use local scratch space
- Use shell scripts
- Use modules
- Use common data sets already available

Common data sets, e.g. hg38 reference genome, are available in
`/sw/hgcc/Data`. Check there first before downloading to your home directory.

Help reduce data duplication. If you have these data in your home directory
please delete them. If you need some data make a request.

# Strategy: Use local scratch space

- This reduces the network traffic to the /home volume
- Each compute node has a 1TB /scratch partition
- Note: `/scratch` on node01 is distinct from `/scratch` on node02
- Recommended mode of operation is:
  1. Create unique folder in /scratch (e.g. `/scratch/x6d3es`)
  2. Copy data to unique folder
  3. Do not copy your entire data set. Copy only the data file(s) you need,
     e.g. the two fastq files for one sample you're mapping
  4. Process and write results to unique folder
  5. Copy results from unique folder to `/home/<your username>/<Project Name>/`
  6. Delete unique folder

Sometimes input data is large (e.g. WGS data). In that case, do not copy
to unique folder; instead read from /home but still use unique folder to
process your data (and generate output) and then copy results back.

# Strategy: Use SGE job scripts

- Create a SGE job script to run your program/pipeline and copy data
  to and from `/scratch`
- Using a job script will allow running multiple commands (pipeline) as
  one job
- Use `qsub` to submit your script to SGE. SGE will schedule the script to
  run on a compute node.

# Strategy: Use Modules

- Commands (square brackets indicate optional information)

```
module avail                    # Display available modules
module load <name[/version]\>   # Load a module
module list                     # List loaded modules
module unload <name[/version]\> # Unload a module
module purge                    # Unload all loaded modules
```

# Example 1: run FastQC on a single file

1. Create a folder to hold all files related to the task/project

- Recommended folder structure

```
${HOME}/project
${HOME}/project/data
${HOME}/project/refs
${HOME}/project/logs
${HOME}/project/output
${HOME}/project/sge
```

# Example 1: run FastQC on a single file

2. Create the job submission script in `${HOME}/project/sge`

- Recommend to create scripts for each step, e.g. FastQC, mapping, calling,
  etc.
- Give a descriptive name to your scripts e.g. `step01_fastqc.sh`

# Example 1: run FastQC on a single file

```
#!/bin/sh

# This script requires a single parameter when called – the portion of the
# file name preceding '.fastq.gz' or '.bam'. This is usually the <sample_name>.
# The output directory (OUTDIR) needs to exist.

# load the FastQC module, which gives you the fastqc program
module load FastQC

# set directory variable names
PRJDIR=“${HOME}/project”
DATADIR=“${PRJDIR}/data”
OUTDIR=“${PRJDIR}/output/FastQC”

# create a unique folder on the local compute drive
if [ -e /bin/mktemp ]; then
  TMPDIR=`/bin/mktemp -d -p /scratch/` || exit
elif [ -e /usr/bin/mktemp ]; then
  TMPDIR=`/usr/bin/mktemp -d –p /scratch/` || exit
else
  echo “Error. Cannot find mktemp to create tmp directory”
  exit
fi

# copy on the data
cp ${DATADIR}/$1.fastq.gz ${TMPDIR}

# run fastqc on the data
fastqc –o ${TMPDIR} --no-extract ${TMPDIR}/$1.fastq.gz

# remove the original fastq file
/bin/rm ${TMPDIR}/$1.fastq.gz

# copy your local data to your user directory
rsync –av ${TMPDIR}/ ${OUTDIR}/$1

# remove the temp directory
/bin/rm –rf ${TMPDIR}

# unload the FastQC module
module unload FastQC
```

# Example 1: run FastQC on a single file

3. submit your job:

- Change into the logs folder:

```
# change to the log folder
cd ${HOME}/project/logs
# submit the job
qsub –q b.q –cwd –j y ../sge/step01_fasqtc.sh <sample_name>
```

- This command will run your job, generate logs in the current directory,
  and merge the .o and .e files into one.
- You may include other SGE options in the above command line or in your
  script.
- One useful option is to have SGE email you when the job completes:

```
qsub –q b.q –cwd –j y –M youremail@emory.edu ../sge/step01_fastqc.sh <sample_name>
```

- SGE options may also be included in the job script instead of specifying
  them on the command line.

# Example 2: run FastQC on multiple files

- Assumption: you have many fastq files in your `project/data` folder.
- Complete steps 1 and 2 as shown for Example 1.
- Here's a shell loop command to submit all of your fastq files (notice
  relative path to the data folder)

```
# change to the log directory
cd ${HOME}/project/logs

# loop through your gzipped fastq files
for F in `find ../data –name \*.fastq.gz –print`; do
  S=$(basename $F | sed 's/\.fastq\.gz$//')
  qsub –q b.q –cwd –j y ../sge/step01_fastqc.sh $S
done
```

Note: qsub limit is 500 jobs. For larger numbers use array jobs.

# SGE: Checking the status of jobs

- Use qstat to check the status of your jobs

```
qstat
```

- `qstat` by itself will only list your jobs
- To list all currently running and scheduled jobs

```
qstat –u ‘\*'
```

# SGE: To delete a job

- Use `qdel` to delete a job
- `qdel` takes the job-ID from qstat

Example:

```
# usage: qdel <job Id>
qdel 37788

```

Of course, you can only delete your jobs.

```
qdel 37788
vpatel - you do not have the necessary privileges to delete the job
"37788"
```

# SGE: Requesting additional cores for your job

```
qsub –q b.q –pe smp 4 …
```

- Notes:
  - Requesting additional cores also provides additional memory
  - 1 core = 8 GB, 2 cores = 16GB, 4 cores = 32GB, …
  - Your program(s) must be able to take advantage of multiple cores or
    additional memory.
  - You may have to specify this via the program's command line options,
    e.g. specifying `–p` option for `bowtie2`. See [the bowtie manual](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml#performance-tuning)
  - The smp parallel environment requires that the requested number of cores
    be free/available on a single node, otherwise you job will not run.
  - Using more cores/memory may not result in a dramatic performance
    improvement. Think about possibly breaking your analysis into multiple
    jobs/steps and running those jobs/steps concurrently on multiple nodes.
  - Multiple small jobs may be more efficient than a single large job. It
    also is more user-friendly.

# SGE: Requesting additional time for your job

```
qsub –q b.q -l h_rt=hh:mm:ss ...
```

- hh = hours, mm = minutes, ss = seconds

- Notes:
  - Default run time for batch jobs is 240 hours.
  - This is sufficient for 99.9% of jobs on HGCC. If your job is taking more
    than 240 hours to run, it's probably stuck and should be terminated.
  - You can also request a shorter run time, e.g. for testing purposes

```
qsub –q b.q –l h_rt=1:00:00 ...
```

- The above will run your job for one hour then automatically terminate
  it.

# SGE: Using the interactive queue

- Interactive jobs have a maximum run time of **24 hours**.
- Use `qrsh` to run a command

```
qrsh –q i.q ‘hostname'
```

- To run an interactive program like R

```
qrsh –q i.q ‘module load R && R --no-save && module unload R'
```

- Note: `--no-save`, or `--save`, or `--vanilla` are required to R run via the
  interactive queue

# SGE: Interactive Queue with a Graphical User Interface (GUI)

- OS X/Windows users will need to install X server software
- OS X: install [Xquartz](http://www.xquartz.org)
- Windows: install [Xming](http://sourceforge.net/projects/xming)

Example setup:

```
ssh –X vpatel@hgcc.genetics.emory.edu  # use –X option when you ssh to HGCC
qlogin –q i.q                          # use qlogin to establish a session on a compute node
xterm                                  # launch the GUI program
```

# SGE: Additional information 

- [Quickstart](http://star.mit.edu/cluster/docs/0.92rc2/guides/sge.html)
- [Array Jobs](http://wiki.gridengine.info/wiki/index.php/Simple-Job-Array-Howto)
