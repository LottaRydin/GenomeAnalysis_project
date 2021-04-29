#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J htseq_BH_differential_analysis_job
#SBATCH --mail-type=ALL
#SBATCH --mail-user lotta.rydin@telia.com

# Load modules:
module load bioinfo-tools
module load samtools
module load htseq

# commands:
for f in ~/GenomeAnalysis_project/analyses/8_bwa_rna_align/sampe_BH/*.bam
do
    samtools index $f ${f}.bai
done

cd ~/GenomeAnalysis_project/analyses/9_htseq_differential_analysis

htseq-count -f bam -r pos \
~/GenomeAnalysis_project/analyses/8_bwa_rna_align/sampe_BH/*.bam \
~/GenomeAnalysis_project/analyses/5_prokka_annotation/annotation_trimmed.gff \

