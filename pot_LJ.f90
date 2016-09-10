subroutine En_LJ()
use cluster
double precision :: r6i, r2, pot
double precision, dimension(3) :: r

pot = 0.d0

!$OMP PARALLEL
do i=1,Natoms-1
  !$OMP DO REDUCTION (+:pot)
  do j=i+1, Natoms
    r = RR(j,:) - RR(i,:)
    r2 = dot_product(r, r)

    r6i = (1.d0/r2)**3

    pot = pot + 4.d0*(r6i*r6i - r6i)
  enddo
  !$OMP END DO
enddo
!$OMP END PARALLEL

write(*,'("Binding Energy = ",f30.10)') pot



return
end subroutine En_LJ
