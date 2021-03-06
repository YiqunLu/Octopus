module global
    implicit none
    include "size.h"
    !for particle
    integer*8 :: Npts,NPP


    CHARACTER(32) :: fn_particle_init
    REAL*4 , DIMENSION(-2:Nx+1,0:Ny-1,-1:Nz,0:1) :: uu,vv,ww
    REAL*4 , DIMENSION(-2:Nx+1,0:Ny-1,-1:Nz,0:1) :: theta,salt,gam
    REAL*4 , DIMENSION(-2:Nx+1,0:Ny-1,-1:Nz) :: hFacC
    REAL*4 , DIMENSION(-2:Nx+1,0:Ny-1, -1:Nz) :: reflect_x,reflect_y
    REAL*4 , DIMENSION(-2:Nx+1,0:Ny-1) :: mld,phihyd

    REAL*4 :: sose_depth(-2:Nx+1,0:Ny-1)
    REAL*8, parameter     :: PI=3.141592653589793238462643383279502884197d0
    REAL*8, DIMENSION(:,:,:), ALLOCATABLE :: xyz, xyz0, uvwp, dxyz_fac, tsg, grad

!pickup    
    REAL*8 :: pickup=0
    REAL*8 :: pickupFreq=7776000.0

    INTEGER*8, DIMENSION(:,:), ALLOCATABLE :: pi2f,pj2f,pk2f,pi2c,pj2c,pk2c
    REAL*8, DIMENSION(:,:), ALLOCATABLE :: dif, djf, dkf, dic, djc, dkc !distance to face and cell center
    REAL*8, DIMENSION(:,:), ALLOCATABLE :: parti_mld

!grid
    REAL*8, DIMENSION(-2:Nx+1,0:Ny-1) :: dxg_r, dyg_r
    REAL*8, DIMENSION(-1:Nz):: drf_r
    REAL*8 :: z2k(5701), k2z(0:420)

!timing parameters
    REAL*8 :: t_amend, dumpFreq,DumpClock=86400, diagFreq, target_density
    REAL*8 :: tt,dtp,dt,dt_mld,tstart,tend,tend_file,dt_reinit,dt_case=15*86400
    INTEGER*8 :: rec_num
    logical :: saveTSG,useMLD,useKh,vel_stationary
    integer*8 :: iswitch


!file names
    INTEGER*8, ALLOCATABLE :: fn_ids(:,:)
    INTEGER*8 :: fn_uvwtsg_ids(7),fn_xyz_tsg_mld_ids(3),fn_id_mld

    INTEGER*8 :: file_i0
    CHARACTER(255) :: casename,path2uvw,fn_parti_init,fn_UVEL,&
                      fn_VVEL,fn_WVEL,fn_THETA,fn_SALT,fn_GAMMA,&
                      output_dir="output",fn_PHIHYD
!mixing parameters
    REAL*8 :: Khdiff, Kvdiff, kvdt2, khdt2

end module global
