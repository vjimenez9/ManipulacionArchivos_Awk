BEGIN{ FS="\t"}
#$4 > 50000 && $5 < 60000{
$4  > limInf  && $4 < limSup{
                 n=split($9,a,";"); 
                 print $1 "  tiene " n "ids";
                 for(i=1;i<=n;i++){
                     print "\t" i ".- " a[i]
                 }
               }
