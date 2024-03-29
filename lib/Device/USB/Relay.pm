package Device::USB::Relay;

use 5;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(
	relay_on relay_off relay_set
);
use Carp;

our $VERSION = '0.01';

sub relay_on
{
    my $port = shift;
    check_port($port);
    relay_set($port,1);
}

sub relay_off
{
    my $port = shift;
    check_port($port);
    relay_set($port,0);
}

sub relay_set
{
    my $port = shift;
    my $state = shift;
    
    $state = $state ? 1 : 0;
    
    open TTY, ">/dev/ttyUSB0" or carp "$!";
    print TTY chr(255),chr($port),chr($state);
    close TTY;
}
    
sub check_port
{
    my $port = shift;
    unless ( $port =~ /^\d+$/ ){ carp("Invalid port number: $port"); };
    if ( $port > 8 or $port < 1 ) { carp("Port number out of range: $port"); };    
}


1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Device::USB::Relay - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Device::USB::Relay;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Device::USB::Relay, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Gerd, E<lt>busker@busker.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Gerd Busker

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.0 or,
at your option, any later version of Perl 5 you may have available.


=cut
