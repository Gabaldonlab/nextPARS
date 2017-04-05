# nextPARS, a novel Illumina-based implementation of in-vitro parallel probing of RNA structures.

Here you will find the scripts necessary to produce the scores described in our paper from fastq files obtained during the experiment.

### Install Prerequisites
First install git:
```bash
sudo apt-get install git-all
```

Then clone this repository

```bash
git clone https://github.com/Gabaldonlab/nextPARS.git
```

Now, ensure the necessary python packages are installed, and can be found in the `$PYTHONPATH` environment variable by running the script packages_for_nextPARS.sh.

```bash
./packages_for_nextPARS.sh
```



### Sample Data
There are sample data files found in the folder [nextPARS/data](https://github.com/Gabaldonlab/nextPARS/data), as well as the necessary fasta files in [nextPARS/data/SEQS/PROBES](https://github.com/Gabaldonlab/nextPARS/data/SEQS/PROBES), and the reference structures obtained from PDB in [nextPARS/data/STRUCTURES/REFERENCE_STRUCTURES](https://github.com/Gabaldonlab/nextPARS/data/STRUCTURES/REFERENCE_STRUCTURES)



### nextPARS Scores
To obtain the scores from nextPARS experiments, use the script [get_combined_scores.py](https://github.com/Gabaldonlab/nextPARS/bin/get_combined_scores.py). Sample data for the 5 PDB control structures can be found in the folder nextPARS/data/

There are a number of different command line options in the script, many of which were experimental or exploratory and are not relevant here. The useful ones in this context are the following:
  * Use the -i option [REQUIRED] to indicate the molecule for which you want scores (all available data files will be included in the calculations -- molecule name must match that in the data file names)
  * Use the -s option to produce an output Structure Preference Profile (SPP) file. Values for each position are separated by semi-colons. Here 0 = paired position, 1 = unpaired position, and NA = position with a score too low to determine its configuration.
  * Use the -o option to output the calculated scores, again with values for each position separated by semi-colons.
  * Use the option {-V combined} to produce an output with the scores that is compatible with the structure visualization program [VARNA](http://varna.lri.fr/), (1)
  * Use the option {-V spp} to produce an output with the SPP values that is compatible with VARNA.
  * Use the -t option to change the threshold value for scores when determining SPP values [default = 0.8, or -0.8 for negative scores]
  * Use the -c option to change the percentile cap for raw values at the beginning of calculations [default = 95]

Example usage:
```bash
python get_combined_scores.py -i TETp4p6 -s
```



### Convert fastq to tab
In order to go from the fastq outputs of the nextPARS experiments to a format that allows us to calculate scores, first map the reads in the fastq files to a reference using the program of your choice.
Once you have obtained a bam file, use the script [tabGenerator.py](https://github.com/Gabaldonlab/nextPARS/bin/tabGenerator.py).
This script counts the number of reads beginning at each position (which indicates a cut site for the enzyme in the file name) and outputs it in .tab format (count values for each position are separated by semi-colons).

Example usage:
```bash
python tabGenerator.py --bam bam_folder -b bed_file -e exp_name -r reference_organism -d exp_date
```

where 
  * --bam gives the directory containing the bam file of interest
  * -b is the bed file for the reference
  * -r is the name of the reference organism
  * -e is a unique name given to a run of the nextPARS experiment
  * -d is the date of a given run of the experiment

Also accepts arguments: 
  * -q for minimum mapping quality for reads to be included [default = 0]
  * -m for minimum average counts per position for a given transcript [default = 5.0]

---

### References:
(1) Darty,K., Denise,A. and Ponty,Y. (2009) VARNA: Interactive drawing and editing of the RNA secondary structure. Bioinforma. Oxf. Engl., 25, 1974–197
