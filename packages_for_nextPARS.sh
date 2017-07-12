
## Install pip for python packages
sudo apt-get install python-pip



## To install the required python packages

pip install --user argparse numpy biopython datetime pysam termcolor



# Add bin to PYTHONPATH for modules made here (genome_annotations.py)
cwd=`pwd`
export PYTHONPATH="$cwd/bin:$PYTHONPATH"
