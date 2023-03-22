$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
open OU, ">sh.sh";
foreach $file (@filelist) {
        if ($file =~ m/keggano$/) {
                print "$file\n";
               # $name=$file;
              #  $name=~s/keggan//;
                print OU "perl /media/ylifc/hdd1/aoa-in-methane-seep-sediment-calculation_steps/Enivronmental_adaptation_gene_detection/specific_gene_summary_kegg.pl /media/ylifc/hdd1/aoa-in-methane-seep-sediment-calculation_steps/Enivronmental_adaptation_gene_detection/KO_specific_genes.txt $file > $file\_extraced\n";
}
}
system('sh sh.sh');


