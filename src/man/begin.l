.\" This is -*-nroff-*-
.\" XXX standard disclaimer belongs here....
.\" $Header: /cvsroot/pgsql/src/man/Attic/begin.l,v 1.1.2.1 1996/12/11 00:30:50 momjian Exp $
.TH BEGIN SQL 11/05/95 PostgreSQL PostgreSQL
.SH NAME
begin \(em begins a transaction
.SH SYNOPSIS
.nf
\fBbegin\fP \fB[transaction|work]\fR
.fi
.SH DESCRIPTION
This command begins a user transaction which Postgres will guarantee is
serializable with respect to all concurrently executing transactions.
Postgres uses two-phase locking to perform this task.  If the transaction
is committed, Postgres will ensure that all updates are done or none of
them are done.  Transactions have the standard ACID (atomic,
consistent, isolatable, and durable) property.
.SH "SEE ALSO"
abort(l),
end(l).
