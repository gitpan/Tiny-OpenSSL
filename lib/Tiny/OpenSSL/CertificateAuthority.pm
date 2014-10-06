use strict;
use warnings;

package Tiny::OpenSSL::CertificateAuthority;

# ABSTRACT: Certificate Authority object.
our $VERSION = '0.1.2'; # VERSION

use Moo;
use Capture::Tiny qw( :all );
use Tiny::OpenSSL::Config qw($CONFIG);

extends 'Tiny::OpenSSL::Certificate';

sub sign {
    my $self = shift;

    return 1;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Tiny::OpenSSL::CertificateAuthority - Certificate Authority object.

=head1 VERSION

version 0.1.2

=head1 METHODS

=head2 sign

Sign a certificate.

    my $ca->sign($csr);

=head1 AUTHOR

James F Wilkus <jfwilkus@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James F Wilkus.

This is free software, licensed under:

  The (three-clause) BSD License

=cut
