        program read
        implicit real(a-h,o-z)
        character(len=3)::A1,A3
        character(len=50)::A2
        character(len=60)::pair
        integer:: ik,ii,ia,ib,ic,id,ie,I0(10),I1(10),I2(100),I3(100)
        open(unit=10,file='new',status='old')
        open(unit=11,file='ssbond4',status='old')
        open(unit=12,file='temp03',status='replace')
!       read file
        A3="CYX"
        ia = 0
!
        do ik = 1, 10, 1
        read(11,"(I2)") I1(ik) 
        end do
!     
        I0(1) = I1(2)
        I0(2) = I1(1)
        I0(3) = I1(4)
        I0(4) = I1(3)
        I0(5) = I1(6)
        I0(6) = I1(5)
        I0(7) = I1(8)
        I0(8) = I1(7)
        I0(9) = I1(10)
        I0(10) = I1(9)          
!
        ik = 0
        do
        read(10,*,iostat=io) pair
        if (io/=0) exit
        ik = ik + 1
        end do
        rewind(10)
!
        do id=1,ik,1
        I2(ik) = 0
        I3(ik) = 0
        end do
!
        do id=1,ik,1
           do ie=1,10,1
           if (id == I1(ie)) then
           I2(id) = 1    
           I3(id) = I0(ie)
           else
           end if
           end do 
!        write(*,*) id,I2(id),I3(id)
        end do         
!       write(*,*) ik
!
        do ii=1,ik,1
        read(10,"(A3,1X,A50)") A1,A2
        ia = I2(ii)
        if (ia == 1) then
        write(12,"(A3,1X,A50,1X,I2)") A3,A2,I3(ii)
!       write(*,*) ii, ia
        else
        write(12,"(A3,1X,A50)") A1,A2
        end if 
!        write(*,"(A3,1X,A50)") A1,A2
        end do
        close(10)
        close(11)
        close(12)
        end program
