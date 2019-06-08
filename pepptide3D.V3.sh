#!/usr/bin/sh
rm -rf 3D
rm -rf rmsd
mkdir -p 3D
mkdir -p rmsd
rm -rf *.i1
cp SS/*.i1 .
cp SS/*.seq .
for f in *.i1
do
   cp $f temp.i1
   sed '1d' temp.i1 >temp01
   #awk '{ printf "%-3s %s %s %s\n", $2, $6, $7, $9 }' temp01 >temp02
   awk '{ printf "%-3s %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f %5.2f\n", $2, $6, $7, $9, $10, $11, $12, $13}' temp01>temp02
   ################################################################
   f1=$(echo $f | sed 's/...$//')
   #rm -rf peptide.*
   lin/cys_rec $f1.seq >ssbond
   # 5 ssbonds
   awk '$1 == "The" {} END {print $7 $8 $9 $10 $11 $12 $13 $14 $15 $16}' ssbond >ssbond2
   sh ssbond.sh >ssbond3
   ################################################################
   awk '{if ($1=="") print "0" ;else print $1}' ssbond3  >>ssbond4
   awk '{if ($2=="") print "0" ;else print $2}' ssbond3 >>ssbond4
   awk '{if ($3=="") print "0" ;else print $3}' ssbond3 >>ssbond4
   awk '{if ($4=="") print "0" ;else print $4}' ssbond3 >>ssbond4
   awk '{if ($5=="") print "0" ;else print $5}' ssbond3 >>ssbond4
   awk '{if ($6=="") print "0" ;else print $6}' ssbond3 >>ssbond4
   awk '{if ($7=="") print "0" ;else print $7}' ssbond3 >>ssbond4
   awk '{if ($8=="") print "0" ;else print $8}' ssbond3 >>ssbond4
   awk '{if ($9=="") print "0" ;else print $9}' ssbond3 >>ssbond4
   awk '{if ($10=="") print "0" ;else print $10}' ssbond3 >>ssbond4
   ################################################################
   sh convert.sh >temp03
   if [ -s "ssbond2" ]
   then 
         mv temp03 new 
   fi
   ################################################################
   ./read
   #sh convert.sh >temp03
   sh combin.sh
   ./protein < in01
   ./minimize peptide.xyz   -k min.key 0.01 > min.out
   ./dynamic  peptide.xyz_2 -k md.key 50000 1.0 0.5 2 310 > md_nvt.out
   mv peptide.099 peptide.xyz
   ./xyzpdb <in02
   #f1=$(echo $f | sed 's/...$//')
   #GAMD AMBER
   reduce -Trim  peptide.pdb >amber.pdb
   sh amber.ssbond.sh > amber02
   rm -rf tleap.in
   cat amber01 >> tleap.in
   cat amber02 >> tleap.in
   cat amber03 >> tleap.in
   tleap -s -f tleap.in
   sh amber.run.sh >log   
   ambpdb -p zw.top -c gamd.rst | grep -v WAT >gamd.pdb
   rm -rf new
   rm -rf *.x
   rm -rf *.out 
   rm -rf *.rst
   rm -rf *.top
   rm -rf *.crd    
   rm -rf amber02
   rm -rf tleap.in
   rm -rf amber.pdb
   rm -rf ssbond4
   rm -rf *.xyz*
   rm -rf in01
   #
   mv gamd.pdb 3D/$f1.pdb
   rm -rf peptide.*
   rm -rf ssbond
   rm -rf ssbond2
   rm -rf ssbond3
   rm -rf ssbond4
   ./exermsd 3D/$f1.pdb reference/$f1.pdb >rmsd/$f1.rmsd
   echo Processing pdb $f1.pdb
done
#####################################################
