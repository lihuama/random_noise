PROGRAM test_rd_noise
   REAL, DIMENSION(100) :: y,y0
   REAL :: r
   INTEGER :: i
   
   y = [(1.2+2.*i+3.2*i**2, i=1,100)]
   y0 = y
   CALL rd_noise(y,100,2.)
   WRITE (*,'(3X,A,6X,A2,6X,A4)') 'y0','y','y-y0'
   WRITE (*,102) (y0(i),y(i),y(i)-y0(i),i=1,10)
102 FORMAT(/,3F8.3)
    
END PROGRAM