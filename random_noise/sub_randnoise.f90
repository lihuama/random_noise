SUBROUTINE rd_noise(y,n,range)
    INTEGER :: n
    REAL :: range
    REAL, DIMENSION(n) :: y
    INTENT(IN) :: n,range
    INTENT(INOUT) :: y
    
    INTEGER :: i,j
    REAL :: m,sign,ms
    
    CALL RANDOM_SEED()
    CALL RANDOM_NUMBER(m)
    DO i=1,n
        DO j=1,INT(m*100)
            CALL RANDOM_NUMBER(ms)
        END DO
        DO j=1,INT(ms*100)
            CALL RANDOM_NUMBER(m)
            CALL RANDOM_NUMBER(sign)
        END DO
        IF( sign>0.5 ) THEN
            y(i) = y(i)+m*range
        ELSE
            y(i) = y(i)-m*range
        END IF
    END DO
END SUBROUTINE