.\" This is -*-nroff-*-
.\" XXX standard disclaimer belongs here....
.\" $Header: /cvsroot/pgsql/src/man/Attic/rollback.l,v 1.1.2.1 1996/12/11 00:32:01 momjian Exp $
.TH ROLLBACK SQL 01/20/96 PostgreSQL PostgreSQL
.\" XXX This .XA has to go after the .TH so that the index page number goes
.\"	in the right place...
.SH NAME
rollback \(em rollback, e.g. aborts, the current transaction
.SH SYNOPSIS
.nf
\fBrollback\fP \fB[transaction|work]\fR
.fi
.SH DESCRIPTION
This command rolls back the current transaction and causes all the
updates made by the transaction to be discarded.   
.PP
.IR "rollback"
is functionally equivalent to the
.IR "abort"
command.
.SH "SEE ALSO"
abort(l),
begin(l),
end(l).
