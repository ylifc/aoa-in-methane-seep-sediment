$DIR_PATH="./";
opendir DIR, ${DIR_PATH}|| die "can not open dir \"$DIR_PATH\"\n";
@filelist = readdir DIR;
open OU, ">sh.sh";
foreach $file (@filelist) {
        if ($file =~ m/keggano$/) {
                print "$file\n";
               # $name=$file;
              #  $name=~s/keggan//;
                print OU "perl /home5/ylifc/specific_gene_selection/specific_gene_summary_kegg.pl /home5/ylifc/specific_gene_selection/KO_specific_genes.txt $file > $file\_extraced\n";
}
}
system('sh sh.sh');


