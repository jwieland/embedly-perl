#!/usr/bin/perl 

use strict;
use warnings;

use Test::More;

use Test::Mock::LWP::Dispatch;
use LWP::UserAgent;
use HTTP::Response;
use HTTP::Headers;

use Ouch qw(:traditional);

#Setup Expected Responses
my $oembed_res = '{"provider_url": "http://www.youtube.com/", "description": "CGRtrailers, from Classic Game Room\u00ae, presents the \"Rhino\" trailer for THE AMAZING SPIDER-MAN from Beenox, Activision and Marvel Entertainment. This game featuring everyones favorite webslinging superhero is inspired/based upon the upcoming summer movie. Enjoy!", "title": "THE AMAZING SPIDER-MAN Rhino Trailer", "url": "http://www.youtube.com/watch?v=I8CSt7a7gWY", "html": "<iframe width=\"640\" height=\"360\" src=\"http://www.youtube.com/embed/I8CSt7a7gWY?fs=1&feature=oembed\" frameborder=\"0\" allowfullscreen></iframe>", "author_name": "CGRtrailers", "height": 360, "width": 640, "thumbnail_url": "http://i2.ytimg.com/vi/I8CSt7a7gWY/hqdefault.jpg", "thumbnail_width": 480, "version": "1.0", "provider_name": "YouTube", "type": "video", "thumbnail_height": 360, "author_url": "http://www.youtube.com/user/CGRtrailers"}';

BEGIN { use_ok( 'WebService::Embedly') ; }
use WebService::Embedly;

my $embedly;
my $ua = LWP::UserAgent->new();
my $headers = HTTP::Headers->new(
				 'Content-Type'   => 'application/json',
				 'Server' => 'TornadoServer/2.0'
				);
$headers->date;

#oembed
$mock_ua->map(
	      'http://api.embed.ly/1/oembed?url=http%3A%2F%2Fyoutu.be%2FI8CSt7a7gWY&key=test&maxwidth=500',
	      sub {
		my $req = shift;
		my $uri = $req->uri;
		my $content = $oembed_res;
		$headers->content_length(length($content));
		my $res = HTTP::Response->new(200, 'OK', $headers, $content);
		return $res;
	      },
);


#pass in mock user agent..  IoC testing
$embedly = WebService::Embedly->new({ api_key => 'test',
			       maxwidth => 500,
			       ua => $ua
			     });

isa_ok($embedly, 'WebService::Embedly');
isa_ok($embedly->ua, 'LWP::UserAgent');

my $url = 'http://youtu.be/I8CSt7a7gWY';
my $e = try {
  my $oembed_ref = $embedly->oembed($url);
  is ($oembed_ref->{provider_url}, 'http://www.youtube.com/', 'Oembed response' );
};

if (catch_all $e) {
  fail 'Failed oembed request' ;
}


done_testing();
