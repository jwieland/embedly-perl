#!/usr/bin/perl 

use Test::More;

diag( "Testing WWW::Embedly  $WWW::Embedly::VERSION, Perl $], $^X" );

BEGIN { use_ok( 'Mouse' ); }
BEGIN { use_ok( 'MouseX::Types::URI') ; }
BEGIN { use_ok( 'WWW::Embedly') ; }

done_testing();
