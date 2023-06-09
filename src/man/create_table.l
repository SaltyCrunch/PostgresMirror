.\" This is -*-nroff-*-
.\" XXX standard disclaimer belongs here....
.\" $Header: /cvsroot/pgsql/src/man/Attic/create_table.l,v 1.1.2.1 1996/12/11 00:31:10 momjian Exp $
.TH "CREATE TABLE" SQL 11/05/95 PostgreSQL PostgreSQL
.SH NAME
create table \(em create a new class
.SH SYNOPSIS
.nf
\fBcreate table \fR classname \fB(\fPattname-1 type-1 {\fB,\fP attname-i type-i}\fB)\fP
	[\fBinherits\fR \fB(\fR classname-1 {\fB,\fR classname-i} \fB)\fR]
	[\fBarchive\fR \fB=\fR archive_mode]
	[\fBstore\fR \fB=\fR \*(lqsmgr_name\*(rq]
	[\fBarch_store\fR \fB=\fR \*(lqsmgr_name\*(rq]
.fi
.SH DESCRIPTION
.BR "Create table"
will enter a new class into the current data base.  The class will be
\*(lqowned\*(rq by the user issuing the command.  The name of the
class is
.IR classname
and the attributes are as specified in the list of
.IR attname s.
The 
.IR i th
attribute is created with the type specified by
.IR type "-i."
Each type may be a simple type, a complex type (set) or an array type.
.PP
Each array attribute stores arrays that must have the same number of
dimensions but may have different sizes and array index bounds.  An
array of dimension
.IR n
is specified by appending 
.IR n
pairs of square brackets:
.nf
att_name = type[][]..[]
.fi
.PP
The optional
.BR inherits
clause specifies a collection of class names from which this class
automatically inherits all fields.  If any inherited field name
appears more than once, Postgres reports an error.  Postgres automatically
allows the created class to inherit functions on classes above it in
the inheritance hierarchy.  Inheritance of functions is done according
to the conventions of the Common Lisp Object System (CLOS).
.PP
Each new class
.IR classname 
is automatically created as a type.  Therefore, one or more instances
from the class are automatically a type and can be used in 
.IR alter table(l)
or other 
.BR "create table"
statements.  See 
.IR introduction (l)
for a further discussion of this point.
.PP
The optional
.BR store
and 
.BR arch_store
keywords may be used to specify a storage manager to use for the new
class.  The released version of Postgres supports only \*(lqmagnetic
disk\*(rq as a storage manager name; the research system at UC Berkeley
provides additional storage managers.
.BR Store
controls the location of current data,
and
.BR arch_store
controls the location of historical data.
.BR Arch_store
may only be specified if
.BR archive
is also specified.  If either
.BR store
or
.BR arch_store
is not declared, it defaults to \*(lqmagnetic disk\*(rq.
.PP
The new class is created as a heap with no initial data.  A class can
have no more than 1600 attributes (realistically, this is limited by the
fact that tuple sizes must be less than 8192 bytes), but this limit
may be configured lower at some sites.  A class cannot have the same
name as a system catalog class.
.PP
The
.BR archive
keyword specifies whether historical data is to be saved or discarded.
.IR Arch_mode 
may be one of:
.TP 10n
.IR none
No historical access is supported.
.TP 10n
.IR light
Historical access is allowed and optimized for light update activity.
.TP 10n
.IR heavy
Historical access is allowed and optimized for heavy update activity.
.PP
.IR Arch_mode
defaults to \*(lqnone\*(rq.  Once the archive status is set, there is
no way to change it.  For details of the optimization, see [STON87].
.SH EXAMPLES
.nf
--
-- Create class emp with attributes name, sal and bdate
--
create table emp (name char16, salary float4, bdate abstime)
.fi
.nf
--
--Create class permemp with pension information that
--inherits all fields of emp 
--
create table permemp (plan char16) inherits (emp)
.fi
.nf
--
--Create class foo on magnetic disk and archive historical data
--
create table foo (bar int4) archive = heavy
    store = "magnetic disk"
.fi
.nf
--
--Create class tictactoe to store noughts-and-crosses
--boards as a 2-dimensional array
--
create table tictactoe (game int4, board = char[][])
.fi
.nf
--
--Create a class newemp with a set attribute "manager".  A
--set (complex) attribute may be of the same type as the
--relation being defined (as here) or of a different complex
--type.  The type must exist in the "pg_type" catalog or be
--the one currently being defined.
--
create table newemp (name text, manager = newemp)
.fi
.SH "SEE ALSO"
drop table(l).
