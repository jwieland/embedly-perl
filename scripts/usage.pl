#!/usr/bin/perl

use strict;
use warnings;

use WebService::Embedly;
use Ouch qw(:traditional);

use Getopt::Long;
use Data::Dumper;

my $key;
my $help;
my $url = 'http://www.youtube.com/watch?v=mzhVAJOHgQo';
GetOptions ("apikey=s" => \$key,
	    "help" => \$help,
	    "url=s" => \$url,
	   );

if ($help) {
  usage();
}

unless ($key) {
  print "Need pass apikey\n";
  usage();
}

my $embedly = WebService::Embedly->new({ api_key => $key,
					 maxwidth => 500,
				       });

my $embed_data  = $embedly->oembed($url);

print Dumper($embed_data);

exit;


sub usage {
  print "usage: ./usage --apikey you_api_key_from_embedly.com\n";
  print "\nOptional:\n";
  print " --url url_to_lookup (default to http://www.youtube.com/watch?v=mzhVAJOHgQo)\n\n";
  exit;
}
