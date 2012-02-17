package WWW::Embedly;

use Mouse;
use MouseX::Types::URI;

=head1 NAME

WWW::Embedly - Use Embed.ly API to pull info about asset url

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use WWW::Embedly;

    my $embedly = WWW::Embedly->new({ api_key => '21212112121'});

=cut


=head1 Attributes

=cut

has 'api_key' => (
		  is  => 'rw',
		  isa => 'Str',
		  required => 1,
);

has 'uri' => (
    is     => 'rw',
    isa    => 'URI',
    coerce => 1,
);

has 'oembed_base' => (
		       is => 'ro',
		       isa => 'Str',
		       default => 'http://api.embed.ly/1/oembed?'
);

=head1 SUBROUTINES/METHODS

=head2 

=cut


=head1 AUTHOR

Jason Wieland, C<< <jwieland at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-embedly at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Embedly>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Embedly


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Embedly>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Embedly>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Embedly>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Embedly/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Jason Wieland.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut
__PACKAGE__->meta->make_immutable();

1; # End of WWW::Embedly
