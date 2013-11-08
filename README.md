NE2001
======

NE 2001 code with slight modification to calculate density for x,y,z coordinates in galactocentric cartesian coordiantes.
NE2001 code described in Cordes & Lazio (2001), arXiv:astro-ph/0207156.

Installation
============

1. Prerequisite: a running version of the g77 compiler
2. In the src.NE2001 directory: edit the BINDIR variable in the makefile to change the installation directory
3. run:
    > make lib 
    > make pgm
    > make dens

Run NE2001 in python
====================

Get the gmf code package from github.com/me-manu/gmf
The ne2001.py contains the functions that interface the fortran code.

Set the NE2001_PATH:

export NE2001_PATH="/path/to/bin/directory/"
