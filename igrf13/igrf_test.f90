! ==============================================================================
! INPE - Instituto Nacional de Pesquisas Espaciais
! ETE  - Engenharia e Tecnologias Espaciais
! DSE  - Divisão de Sistemas Espaciais
!
! Author: Ronan Arraes Jardim Chagas <ronan.arraes@inpe.br>
!
! ==============================================================================
!
! Description
!
!   This FORTRAN code has the purpose to create test files to verify the IGRF
!   algorithm implemented in the package SatelliteToolbox.jl.
!
!   Two files are created, one for geocentric and other for geodetic
!   coordinates.
!
!   The file for geocentric coordinates have the following structure:
!
!   date, radius, colatitude, East-logintude, X [nT], Y [nT], Z [nT], f [nT]
!
!   The file for geodetic coordinates have the following structure:
!
!   date, altitude, colatitude, East-logintude, X [nT], Y [nT], Z [nT], f [nT]
!
!   Obs.: The input argument units are the same as in `igrf12syn` function.
!
! ==============================================================================

program igrf_test
    implicit none
    integer, parameter :: sp = kind(1.0)
    integer, parameter :: dp = kind(1.0d0)
    real(dp) :: date, r, colat, elong
    real(dp) :: h
    real(dp) :: x, y, z, f
    integer  :: i

    open(unit=1, file="IGRF13_test_geocentric.txt", form="formatted", action="write")
    open(unit=2, file="IGRF13_test_geodetic.txt",   form="formatted", action="write")

    do i = 1,2000
        ! Geocentric coordinates
        ! ======================

        date  = real(nint( (1900.0_dp + (2030.0_dp - 1900.0_dp)*rand())*10 ) )/10
        r     = real(nint( (6400.0_dp + (8000.0_dp - 6400.0_dp)*rand())*100) )/100
        colat = real(nint( (0.0_dp +  90.0_dp*rand())*100) )/100
        elong = real(nint( (0.0_dp + 360.0_dp*rand())*100) )/100

        call igrf13syn(0, date, 2, r, colat, elong, x, y, z, f)

        write(1,"(F9.1 F10.2 F8.2 F9.2 F15.5 F15.5 F15.5 F15.5)") date, r, colat, elong, x, y, z, f

        ! Geodetic coordinates
        ! ====================
        h     = r - 6378.1370_dp

        call igrf13syn(0, date, 1, h, colat, elong, x, y, z, f)

        write(2,"(F9.1 F10.2 F8.2 F9.2 F15.5 F15.5 F15.5 F15.5)") date, h, colat, elong, x, y, z, f
    end do

end program igrf_test
