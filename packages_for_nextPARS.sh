## To install the required python packages

pip install --user argparse biopython datetime glob gzip numpy pysam termcolor



# Add bin to PYTHONPATH for modules made here (genome_annotations.py)
cwd=`pwd`
export PYTHONPATH="$cwd/bin:$PYTHONPATH"
