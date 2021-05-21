#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J synteny_search_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user lotta.rydin@telia.com

# Load modules
module load bioinfo-tools
module load blast

# Commands
blastn -outfmt 6 -query ~/GenomeAnalysis_project/analyses/1_genome_assembly_res/genome_assembly.contigs.fasta \
-subject ~/GenomeAnalysis_project/raw_data/synteny_faecalis/GCF_000393015.1_Ente_faec_T5_V1_genomic.fna \
-out ~/GenomeAnalysis_project/analyses/6_synteny_search/synteny_faecelis_res_2
