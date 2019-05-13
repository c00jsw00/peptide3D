# peptide3D
3D peptide conformation prediction
1. install: SPIDER3-Single_np.tgz or  SPIDER3-Single_tf.tgz
2. run impute_script_np.sh
3. generating *.il files
4. download : cys_rec.tar.bz2 ##ssbonds 
5. download : tinker bin: minimize dynamic protein
6. run pepptide3D.V2.sh
7. gfortran -o read read.f90
8. gfortran -o exermsf rmsd.f
