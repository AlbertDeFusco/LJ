program LJ
use cluster
implicit none
character(len=150) :: fconfin

call getarg (1,fconfin)
call read_conf(fconfin)

call En_LJ()

deallocate(RR)

end program LJ

