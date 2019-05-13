# peptide3D
3D peptide conformation prediction
1. install: SPIDER3-Single_np.tgz or  SPIDER3-Single_tf.tgz
2. run impute_script_np.sh
3. generating *.il files
4. mkdir peptidepdb & copy everything into  peptidepdb 
4. download : cys_rec.tar.bz2 ##ssbonds 
5. download : tinker bin: minimize dynamic protein & parameters
6. gfortran -o read read.f90
7. gfortran -o exermsf rmsd.f
8. run pepptide3D.V2.sh
9. predicitng files in 3D/
10. rmsd values in rmsd/


If you have any questions, pls email to c00jsw00@gmail.com  -->Dr. Yeng-Tseng Wang
