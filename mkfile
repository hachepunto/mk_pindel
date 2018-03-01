<config.mk

'results/'$PREFIX'_config.txt': 
	mkdir -p `dirname $target`
	bash bin/makeconfig

'results/'$PREFIX'_BP' \
'results/'$PREFIX'_CloseEndMapped' \
'results/'$PREFIX'_D' \
'results/'$PREFIX'_INT_final' \
'results/'$PREFIX'_INV' \
'results/'$PREFIX'_LI' \
'results/'$PREFIX'_RP' \
'results/'$PREFIX'_SI' \
'results/'$PREFIX'_TD':	'results/'$PREFIX'_config.txt'
	mkdir -p `dirname $target`
	/home/hachepunto/pindel/pindel \
		--fasta $REFERENCE \
		--config-file $prereq \
		--output-prefix 'results/'$PREFIX'_build' \
		--chromosome ALL \
		--number_of_threads $NT \
		--max_range_index $MAX \
	&& {
		mv 'results/'$PREFIX'_build_BP' 'results/'$PREFIX'_BP' 
		mv 'results/'$PREFIX'_build_CloseEndMapped' 'results/'$PREFIX'_CloseEndMapped' 
		mv 'results/'$PREFIX'_build_D' 'results/'$PREFIX'_D' 
		mv 'results/'$PREFIX'_build_INT_final' 'results/'$PREFIX'_INT_final' 
		mv 'results/'$PREFIX'_build_INV' 'results/'$PREFIX'_INV' 
		mv 'results/'$PREFIX'_build_LI' 'results/'$PREFIX'_LI' 
		mv 'results/'$PREFIX'_build_RP' 'results/'$PREFIX'_RP' 
		mv 'results/'$PREFIX'_build_SI' 'results/'$PREFIX'_SI' 
		mv 'results/'$PREFIX'_build_TD' 'results/'$PREFIX'_TD' 
	}



'results/'$PREFIX'.vcf':	'results/'$PREFIX'_BP'\
	'results/'$PREFIX'_CloseEndMapped'\
	'results/'$PREFIX'_D'\
	'results/'$PREFIX'_INT_final'\
	'results/'$PREFIX'_INV'\
	'results/'$PREFIX'_LI'\
	'results/'$PREFIX'_RP'\
	'results/'$PREFIX'_SI'\
	'results/'$PREFIX'_TD'
	mkdir -p `dirname $target`
	/home/hachepunto/pindel/pindel2vcf \
		-P 'results/'$PREFIX \
		-r $REFERENCE \
		-R $INFOREF \
		-d $DATEREF \
		-v $target'.build' \
	&& mv $target'.build' $target