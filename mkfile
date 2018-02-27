<config.mk


"results/"$PREFIX"config.txt":	data/%.bam
	mkdir -p `dirname $target`
	./bin/makeconfig

results/%.vcf:	"results/"$PREFIX"config.txt"
	mkdir -p `dirname $target`
	pindel \
		--fasta $REFERENCE \
		--config-file $prereq \
		--output-prefix $PREFIX \
		--chromosome ALL \
		--number_of_threads $NT \
		--max_range_index $MAX \