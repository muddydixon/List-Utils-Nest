#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'List::Utils::Nest' ) || print "Bail out!\n";
}

diag( "Testing List::Utils::Nest $List::Utils::Nest::VERSION, Perl $], $^X" );
