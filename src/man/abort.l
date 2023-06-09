.\" This is -*-nroff-*-
.\" XXX standard disclaimer belongs here....
.\" $Header: /cvsroot/pgsql/src/man/Attic/abort.l,v 1.1.2.1 1996/12/11 00:30:44 momjian Exp $
.TH ABORT SQL 01/23/93 PostgreSQL PostgreSQL
.\" XXX This .XA has to go after the .TH so that the index page number goes
.\"	in the right place...
.SH Abort
.SH NAME
abort \(em abort the current transaction
.SH SYNOPSIS
.nf
\fBabort\fP \fB[transaction]\fR
.fi
.SH DESCRIPTION
This command aborts the current transaction and causes all the
updates made by the transaction to be discarded.   
.IR "abort"
is functionally equivalent to 
.IR "rollback".
.SH "SEE ALSO"
begin(l),
end(l),
rollback(l).
