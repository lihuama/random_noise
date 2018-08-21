PROGRAM test_rd_noise
    INTEGER, PARAMETER :: MAX_SIZE = 100
    REAL, DIMENSION(MAX_SIZE) :: y,y0
    REAL :: r
    INTEGER :: i,istat
    CHARACTER(len=80) :: msg
   
    y = [(1.2+2.*i+3.2*i**2, i=1,MAX_SIZE)]
    y0 = y
    CALL rd_noise(y,MAX_SIZE,2.)
   
    OPEN(UNIT=10,FILE='noise.dat',STATUS='REPLACE',ACTION='WRITE',IOSTAT=istat,iomsg=msg)
    IF( ISTAT==0 ) THEN
    WRITE (10,101) (i,y(i),i=1,MAX_SIZE)
101 FORMAT(1X,I0,T6,F12.6) 
    ELSE
        WRITE (*,*) TRIM(msg)
    END IF
   
    WRITE (*,'(3X,A,6X,A2,6X,A4)') 'y0','y','y-y0'
    WRITE (*,102) (y0(i),y(i),y(i)-y0(i),i=1,10)
102 FORMAT(/,3F8.3)    
    
END PROGRAM