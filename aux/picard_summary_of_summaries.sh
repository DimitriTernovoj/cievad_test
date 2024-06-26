echo "SAMPLE\
 TOTAL_SNPS\
 NUM_IN_DB_SNP\
 NOVEL_SNPS\
 FILTERED_SNPS\
 PCT_DBSNP\
 DBSNP_TITV\
 NOVEL_TITV\
 TOTAL_INDELS\
 NOVEL_INDELS\
 FILTERED_INDELS\
 PCT_DBSNP_INDELS\
 NUM_IN_DB_SNP_INDELS\
 DBSNP_INS_DEL_RATIO\
 NOVEL_INS_DEL_RATIO\
 TOTAL_MULTIALLELIC_SNPS\
 NUM_IN_DB_SNP_MULTIALLELIC\
 TOTAL_COMPLEX_INDELS\
 NUM_IN_DB_SNP_COMPLEX_INDELS\
 SNP_REFERENCE_BIAS\
 NUM_SINGLETONS"

HEAD_DIR=$1

for s in $(ls ${HEAD_DIR}/data/)
do
    echo -n "$s "
    echo $(grep -v "^#" ${HEAD_DIR}/data/${s}/eval.picard.variant_calling_summary_metrics | grep -v "^TOTAL_SNPS")
done
