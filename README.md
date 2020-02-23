IGRF Test
=========

This FORTRAN code has the purpose to create test files to verify the IGRF
algorithm implemented in the package SatelliteToolbox.jl.

Two files are created, one for geocentric and other for geodetic coordinates.

The file for geocentric coordinates have the following structure:

    date, radius, colatitude, East-logintude, X [nT], Y [nT], Z [nT], f [nT]

The file for geodetic coordinates have the following structure:

    date, altitude, colatitude, East-logintude, X [nT], Y [nT], Z [nT], f [nT]

Obs.: The input argument units are the same as in `igrfXXsyn` function, where
`XX` is the IGRF version.
