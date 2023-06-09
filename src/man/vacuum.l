.\" This is -*-nroff-*-
.\" XXX standard disclaimer belongs here....
.\" $Header: /cvsroot/pgsql/src/man/Attic/vacuum.l,v 1.1.2.1 1996/12/11 00:32:08 momjian Exp $
.TH VACUUM SQL 11/05/95 PostgreSQL PostgreSQL
.SH NAME
vacuum \(em vacuum a database
.SH SYNOPSIS
.nf
\fBvacuum [table]\fP
.fi
.SH DESCRIPTION
.BR Vacuum
is the Postgres vacuum cleaner.  It opens every class in the database,
moves deleted records to the archive for archived relations, cleans
out records from aborted transactions, and updates statistics in the
system catalogs.  The statistics maintained include the number of
tuples and number of pages stored in all classes.  Running
.BR vacuum
periodically will increase Postgres's speed in processing user queries.
.PP
The open database is the one that is vacuumed.  
.PP
We recommend that production databases be vacuumed nightly, in order
to keep statistics relatively current.  The
.BR vacuum
query may be executed at any time, however.  In particular, after
copying a large class into Postgres or deleting a large number of
records, it may be a good idea to issue a
.BR vacuum
query.  This will update the system catalogs with the results of all
recent changes, and allow the Postgres query optimizer to make better
choices in planning user queries.
.PP
The purge(l) command can be used to control the archive retention
characteristics of a given table.
.SH "SEE ALSO"
purge(l).
