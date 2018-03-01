# the length of sequence between the paired-end adapters in paired-end sequence
INSERTSIZE=500


# Output prefix
PREFIX="prueba"

# the reference genome sequences in fasta format
REFERENCE="/home/hachepunto/mk_pindel/mitocondria/NCBI_NC_012920.1_Homo_sapiens_mitochondrion.fasta"
# name and version of reference genome
INFOREF="NCBI_NC_012920.1"
# date of reference genome version
DATEREF="20141031"

# maximum size of structural variations to be detected
# 1=128, 2=512, 3=2,048, 4=8,092, 5=32,368, 6=129,472, 7=517,888, 8=2,071,552, 9=8,286,208 (maximum 9, default 5)
MAX=8


# Number of threds
NT=4
