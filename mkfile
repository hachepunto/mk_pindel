<config.mk

BAMFILE="$(find -L data/ -name "*.bam")"
SAMPLESIZE="$(find -L data/ -name "*.bam"|wc -l)"
BAMPATH="$(find -L data/ -name "*.bam" | xargs realpath)"


find -L data/ -name "*.bam" | xargs realpath | xargs basename | sed -e 's/.bam//g'