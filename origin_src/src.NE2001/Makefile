#
# Makefile for NE2001
# 
# Edit the initial variables for your system.
# Then type 'make pgm' to make the NE2001 interface 
# or        'make lib' to meke the library.
#
FC      = g77
RANLIB  = ranlib
ARFLAGS = rc
FFLAGS  = -O
LDFLAGS = -s
#
BINDIR = ../bin.NE2001
#
# Nothing below here should need to be changed.
########################################################################
PROGRAM = NE2001
DENS    = NE2001_dens
OBJECTS = dmdsm.NE2001.o density.NE2001.o neLISM.NE2001.o neclumpN.o \
		nevoidN.o scattering98.o

usage:
	@echo 'Please type one of the following:'
	@echo 'make pgm --- to make the NE2001 interface'
	@echo 'make lib --- to make the Fortran library'

all: pgm lib dens

pgm: $(PROGRAM)

lib: lib$(PROGRAM).a

dens: $(DENS)

$(PROGRAM): $(PROGRAM).o $(OBJECTS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(BINDIR)/$(PROGRAM) $(PROGRAM).o $(OBJECTS)

$(DENS): $(DENS).o $(OBJECTS)
	$(FC) $(FFLAGS) $(LDFLAGS) -o $(BINDIR)/$(DENS) $(DENS).o $(OBJECTS)

lib$(PROGRAM).a: $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $(OBJECTS)
	$(RANLIB) $@

NE2001_dens.o: NE2001_dens.f 

density.NE2001.o: density.NE2001.f

neLISM.NE2001.o: neLISM.NE2001.f

neclumpN.o: neclumpN.f

nevoidN.o: nevoidN.f

dmdsm.NE2001.o: dmdsm.NE2001.f

scattering98.o: scattering98.f

clean: 
	$(RM) $(BINDIR)/$(PROGRAM) $(PROGRAM).o $(OBJECTS) $(DENS).o
