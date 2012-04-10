#!/usr/bin/perl

use strict;
use warnings;

use Carp ();

$SIG{__WARN__} = sub { local $Carp::CarpLevel = 1; Carp::confess("Warning: ", @_) };

use Test::More tests => 4;

BEGIN { use_ok 'DateTime::Format::SCTS' }

my $dt = DateTime::Format::SCTS->parse_datetime('030212065530');
isa_ok $dt, 'DateTime';
is $dt->ymd, '2012-02-03', 'date';
is $dt->hms, '06:55:30', 'time';
