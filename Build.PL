#!/usr/bin/perl

use 5.006;

use strict;
use warnings;

use Module::Build;

my $module = 'DateTime::Format::SCTS';

(my $dist = $module) =~ s/::/-/g;

my $build = Module::Build->new(
    module_name => $module,
    license => 'perl',
    requires => {
        'perl'                      => 5.006,
        'DateTime::Format::Builder' => 0,
    },
    optional => {
    },
    build_requires => {
        'Test::More'         => 0,
        'Test::Exception'    => 0,
    },
    auto_configure_requires => 0,
    create_makefile_pl => 'traditional',
    create_readme => 1,
    create_license => 1,
    sign => 1,
    recursive_test_files => 0,
    add_to_cleanup => [
        '*.bak', '*.gz', '*.tgz', '*.ppd', '*.ppmx', '*.deb', '*.bat',
        'Makefile', 'pm_to_blib', 'cover_db', 'Debian_CPANTS.txt',
        "$dist-*",
    ],
    meta_merge => {
        resources => {
            bugtracker => "http://rt.cpan.org/NoAuth/Bugs.html?Dist=$dist",
            repository => "http://github.com/dex4er/perl-$dist",
        },
    },
);

$build->create_build_script;
