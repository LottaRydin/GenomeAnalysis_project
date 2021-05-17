#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J mummerplot_genome_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user lotta.rydin@telia.com

# Load modules:
module load bioinfo-tools
module load MUMmer

# Commands

mummer -mum -b -c ~/GenomeAnalysis_project/raw_data/ref_genome/GCF_010120755.1_ASM1012075v1_genomic.fna \
~/GenomeAnalysis_project/analyses/1_genome_assembly_res/genome_assembly.contigs.fasta \
> ~/GenomeAnalysis_project/analyses/11_mummerplot_genome_evaluation/ref_qry.mums

mummerplot -R ~/GenomeAnalysis_project/raw_data/ref_genome/GCF_010120755.1_ASM1012075v1_genomic.fna \
-Q ~/GenomeAnalysis_project/analyses/1_genome_assembly_res/genome_assembly.contigs.fasta \
--png --prefix=ref_qry ~/GenomeAnalysis_project/analyses/11_mummerplot_genome_evaluation/ref_qry.mums
