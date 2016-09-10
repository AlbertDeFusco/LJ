subroutine read_conf(filename)
use cluster
implicit none
integer         :: i
character(len=150) :: filename
character(len=2) :: atom_name

open(10,file=filename,status='old')
read(10,*)Natoms
read(10,*)
allocate ( RR(Natoms, 3) )
do i=1,Natoms
   read(10,*)atom_name,RR(i,1:3)
enddo
close(10)


return
end subroutine read_conf
