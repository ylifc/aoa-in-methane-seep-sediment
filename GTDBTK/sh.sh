gtdbtk identify --extension fa --genome_dir genomes_126 --out_dir genomes_identify --cpus 64
gtdbtk align --identify_dir genomes_identify --out_dir genomes_identify_align --cpus 64 --skip_gtdb_refs --custom_msa_filters --cols_per_gene 88
gtdbtk infer --msa genomes_identify_align/gtdbtk.ar122.user_msa.fasta --out infer_out --cpus 64 --prot _model WAG
