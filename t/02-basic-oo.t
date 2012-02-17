#!/usr/bin/perl 

use Test::More;

BEGIN { use_ok( 'WWW::Embedly') ; }

use WWW::Embedly;
can_ok('WWW::Embedly', 'new');

my $embedly;
eval {
  $embedly = WWW::Embedly->new();
};
ok($@, "Auth_key Needed");

$embedly = WWW::Embedly->new({ api_key => 'test' });
isa_ok($embedly, 'WWW::Embedly');
is($embedly->api_key, 'test', 'Api Key set');

$embedly->api_key('diffkey');
is($embedly->api_key, 'diffkey', 'Api Key changed');



done_testing();
