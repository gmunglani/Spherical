! ##################################################################
! ###### Randomized Material Properties  ##########
! ##################################################################
      SUBROUTINE USDFLD(FIELD,STATEV,PNEWDT,DIRECT,T,CELENT,
     1 TIME,DTIME,CMNAME,ORNAME,NFIELD,NSTATV,NOEL,NPT,LAYER,
     2 KSPT,KSTEP,KINC,NDI,NSHR,COORD,JMAC,JMATYP,MATLAYO,
     3 LACCFLA)
C
      INCLUDE 'ABA_PARAM.INC'
C
      CHARACTER*80 CMNAME,ORNAME
      CHARACTER*3  FLGRAY(15)
      DIMENSION FIELD(NFIELD),STATEV(NSTATV),DIRECT(3,3),
     1 T(3,3),TIME(2),NOEL(1)
      DIMENSION ARRAY(15),JARRAY(15),JMAC(*),JMATYP(*),COORD(*)
C
      integer :: values(1:8), k
      integer, dimension(:), allocatable :: seed
      real(8) :: r
      real :: x, y, z, res
C
      !call date_and_time(values=values)
      !call random_seed(size=k)
      !allocate(seed(1:k))
      !seed(:) = values(8) 
      !call random_seed(put=seed)
      !call random_number(r)
      !FIELD(1) = int(r*2+1)
      !FIELD(1) = int(mod(NOEL(1),2)+1)
      x = coord(1)*18.18
      y = coord(2)*18.18
      z = coord(3)*18.18  
      if ((x.GE.0).AND.(y.GT.0)) then
          res = 4.0
      elseif ((x.LT.0).AND.(y.GE.0)) then
          res = 3.0
      elseif ((x.LE.0).AND.(y.LT.0)) then
          res = 2.0
      elseif ((x.GT.0).AND.(y.LE.0)) then
          res = 1.0
      endif
      if (abs(y).GT.0.7) then
          res = res + 4.0
      endif
      if (z.GT.0.0) then
          res = res + 8.0
      end if
      FIELD(1) = int(res)   
      RETURN
      END
