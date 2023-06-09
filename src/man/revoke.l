.\" This is -*-nroff-*-
.\" XXX standard disclaimer belongs here....
.\" $Header: /cvsroot/pgsql/src/man/Attic/revoke.l,v 1.1.2.1 1996/12/11 00:32:00 momjian Exp $
.TH REVOKE SQL 11/05/95 PostgreSQL PostgreSQL
.SH NAME
revoke \(em revoke access privileges
.SH SYNOPSIS
.nf
\fBrevoke\fR <privilege[,privilege,...]>
	\fBon\fR <rel1>[,...<reln>]
	\fBfrom\fR [\fBpublic\fR | group <group> | <username>]

	\fBprivilege\fR is {\fBALL\fR | \fBSELECT\fR | \fBINSERT\fR | \fBUPDATE\fR | \fBDELETE\fR | \fBRULE\fR}
.fi
.SH DESCRIPTION
.PP
.B revoke
allows you to revoke privileges given to all users or certain users or groups.
.SH EXAMPLES
.nf
--
--Example of a revoke
--
revoke insert
	on mytab
	from public
.fi
.SH "SEE ALSO"
grant(l)
