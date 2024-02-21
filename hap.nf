// include modules - here, modules are single processes
include { SAMTOOLS_FAIDX } from './modules/samtools/faidx/main.nf'
include { MASON_VARIATOR } from './modules/mason/variator/main.nf'
include { BCFOOTLS_NORM } from './modules/bcftools/norm/main.nf'
include { BCFOOTLS_SORT } from './modules/bcftools/sort/main.nf'
include { BCFOOTLS_INDEX } from './modules/bcftools/index/main.nf'
include { MASON_SIMULATOR } from './modules/mason/simulator/main.nf'



workflow{
    // Input channels
    ch_ids      = Channel.from(1..params.n)
    ch_ref      = Channel.fromPath(params.reference)
    ch_ref_idx  = SAMTOOLS_FAIDX(ch_ref)

    // Generate samples (haplotype consensus sequence + VCF)
    (fasta,vcf) = MASON_VARIATOR(ch_ids,ch_ref,ch_ref_idx)

    BCFOOTLS_NORM(vcf,ch_ref) | BCFOOTLS_SORT | BCFOOTLS_INDEX

    // Generate reads
    if (params.read_type == 'ngs'){
        MASON_SIMULATOR(ch_ids, fasta)
    }


    
} 
