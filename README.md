NE2001
======

NE 2001 code with slight modification to calculate density for x,y,z coordinates in galactocentric cartesian coordiantes.
NE2001 code described in Cordes & Lazio (2001), arXiv:astro-ph/0207156.

Installation
============

1. Prerequisite: a running version of the g77 compiler
2. Edit the source code to link to the right data files (this is a bit tedious, keep in mind the FORTRAN line width limitations!):
    - In neclumpN.NE2001.f, line 77: change variable 'filename' to full path of neclumpN.NE2001.dat
    - In neclumpN.f, line 77: change variable 'filename' to full path of neclumpN.NE2001.dat
    - In density.NE2001.f, line 152: set path variable to input.NE2001 directory and set length of variable accordingly in line 149,
    same in line 277 (263) and 640 (630)
    - In nelism.NE2001.f, line 58: set path variable to input.NE2001 directory and set length of variable accordingly in line 55
2. In the src.NE2001 directory: edit the BINDIR variable in the makefile to change the installation directory
3. run:
    - > make lib 
    - > make pgm
    - > make dens

Run NE2001 in python
====================

Get the gmf code package from github.com/me-manu/gmf
The ne2001.py contains the functions that interface the fortran code.

Set the NE2001_PATH:

export NE2001_PATH="/path/to/bin/directory/"

License
=======

The python implementation of NE2001 is distributed under the modified BSD License.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    - Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    - Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
    - Neither the name of the NE2001 developers  nor the
    names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE NE2001 DEVELOPERS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The original code can be found at http://www.astro.cornell.edu/~cordes/NE2001/
