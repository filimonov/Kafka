#!/usr/bin/perl -w



use 5.010;
use strict;
use warnings;



use Test::More;



#BEGIN {
#    eval 'use Test::NoWarnings';    ## no critic
#    plan skip_all => 'because Test::NoWarnings required for testing' if $@;
#}



use Cwd qw(
    abs_path
);
use File::Spec::Functions qw(
    catdir
    catfile
);





my ( $modules_dir, $t_dir, $author_dir, $release_dir, $t_modules_dir, $tools_dir );



$modules_dir    = abs_path( 'lib' );
$t_dir          = abs_path( 't' );
$author_dir     = abs_path( catdir( 'xt', 'author' ) );
$release_dir    = abs_path( catdir( 'xt', 'release' ) );
$t_modules_dir  = catdir( $t_dir, 'lib' );
$tools_dir      = abs_path( 'tools' );



eval 'use Test::Perl::Critic;'; ## no critic
plan skip_all => 'because Test::Perl::Critic required for testing' if $@;

Test::Perl::Critic->import( -profile => catfile( $author_dir, '.perlcritic.rc' ) );

all_critic_ok(
    $modules_dir,
    $t_dir,
    $author_dir,
    $release_dir,
    $t_modules_dir,
    $tools_dir,
);


