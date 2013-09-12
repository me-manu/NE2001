c 	program NE2001_dens
c  calls density_2001 to calculate thermal electron density
c  Returns seven components of the free electron density of the 
c  interstellar medium at Galactic location (x,y,z).  
c  Calling arguments:
c  input:
c	x, y, z = galactocentric location (kpc)
c       Right-handed coordinate system
c       x is in l=90 direction
c       y is in l=180 direction
c       The sun is at (x,y,z) = (0,R0,0)  
c  output:
c    electron densities in cm^{-3}:
c	ne1:	outer, thick disk 
c	ne2:	inner, thin disk (annular in form)
c	nea:	spiral arms
c	negc:   galactic center component
c       nelism: local ISM component
c       necN:   contribution from discrete 'clumps'
c       nevN:   contribution from voids
c    fluctuation parameters (one for each ne component):
c       F1, F2, Fa, Fgc, Flism, FcN, FvN 
c    flags:
c       whicharm: which of the 5 arms x,y,z is in (0 for interarm region)
c          wlism: 1 if x,y,z is in any of the four LISM components 
c           wLDR: 1 if in LDR, 0 if not
c           wLHB: 1 if in LHB, 0 if not
c           wLSB: 1 if in LSB, 0 if not
c         wLOOPI: 1 if in LoopI, 0 if not
c       (nb: nelism is calculated according to LHB:LOOPI:LSB:LDR) 
c       hitclump: clump number that x,y,z is in (0 if none) 

	implicit none
	integer nargs
	character*80 inbuf
	integer ndir
	character*1 limit

	real vperp
        data vperp/100./

c New stuff added by me
	real x,y,z

	integer whicharm

c Large scale components:

	real ne1, ne2, nea
	real F1val, F2val, Faval

c Galactic center:

	real negc, Fgc

c LISM:
	real nelism, Flism 
        integer wlism, wLDR, wLHB, wLSB, wLOOPI

c clumps: 
        real necN, FcN
	integer hitclump

c voids:
	real nevN, FvN
	integer hitvoid, wvoid
c functions:

	integer iargc
	external iargc

	nargs = iargc()
	if(nargs .ge. 1) then
	   call getarg(1, inbuf)
	   read(inbuf, *) x
	   call getarg(2, inbuf)
	   read(inbuf, *) y
	   call getarg(3, inbuf)
	   read(inbuf, *) z
	else
	   write(*,*) 'Usage: NE2001_dens x y z'
           write(*,*) '       x (kpc)'
           write(*,*) '       y (kpc)'
           write(*,*) '       z (kpc)'
	   stop
        endif

	call density_2001(x,y,z,
     .        ne1,ne2,nea,negc,nelism,necN,nevN,
     .        F1val, F2val, Faval, Fgc, Flism, FcN, FvN,
     .        whicharm, wlism, wldr, wlhb, wlsb, wloopI,
     .        hitclump, hitvoid, wvoid)
	write(*,"(e15.5, e15.5, e15.5, e15.5, e15.5, e15.5, e15.5)") ne1, 
     .        ne2, nea, negc, nelism, necN, nevN

	stop
	end
