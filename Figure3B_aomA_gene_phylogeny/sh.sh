mafft --auto All_AOA_gene.fa > All_AOA_gene_mafft.fa
trimal -in All_AOA_gene_mafft.fa -out All_AOA_gene_mafft_trimal.fa -automated1
iqtree2 -s All_AOA_gene_mafft_trimal.fa -m TEST -B 1000 -T AUTO