library(genoPlotR)

ref <- read_dna_seg_from_fasta("GCF_000393015.1_Ente_faec_T5_V1_genomic.fna")
assembly <- read_dna_seg_from_fasta("genome_assembly.contigs.fasta")

bh_vs_bq <- read_comparison_from_blast('synteny_faecelis_res_2')

plot_gene_map(dna_segs=list(assembly=assembly, Enterococcus_faecalis=ref), comparisons=list(bh_vs_bq), 
              gene_type="side_blocks",
              dna_seg_scale=TRUE, scale=FALSE)