#-------------------------------------------------------------------------
#
# Makefile
#    Makefile for doc directory to install man pages
#
# Copyright (c) 1994, Regents of the University of California
# Copyright (c) 1996, Dr George D Detlefsen
#
#
# IDENTIFICATION
#    $Header: /cvsroot/pgsql/src/man/Attic/Makefile,v 1.3 1996/11/20 22:53:49 momjian Exp $
#
#-------------------------------------------------------------------------

SRCDIR=..
include ../Makefile.global

install-man:
	-mkdir -p $(POSTMANDIR)
	-mkdir $(POSTMANDIR)/man1
	-mkdir $(POSTMANDIR)/man3
	-mkdir $(POSTMANDIR)/man5
	-mkdir $(POSTMANDIR)/manl
	cp *.1* $(POSTMANDIR)/man1
	cp *.3* $(POSTMANDIR)/man3
	cp *.5* $(POSTMANDIR)/man5
	cp *.l* $(POSTMANDIR)/manl

install:: install-man

clean:
	# do nothing

all:
	# do nothing
