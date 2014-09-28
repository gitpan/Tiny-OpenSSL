use strict;
use warnings;

package Tiny::OpenSSL::CertificateAuthority;

# ABSTRACT: Certificate Authority object.
our $VERSION = '0.1.1'; # VERSION

use Moo;
use Carp;
use Capture::Tiny qw( :all );
use Tiny::OpenSSL::Config qw($CONFIG);

extends 'Tiny::OpenSSL::Certificate';

sub sign {
    my $self = shift;

    return 1;
}

sub self_sign {

    my $self = shift;
    my $csr  = shift;

    if ( !defined $csr ) {
        croak 'csr is not defined';
    }

    my $pass_file = Path::Tiny->tempfile;
    $pass_file->spew( $self->key->password );

    my @args = (
        'x509',     '-req',
        '-days',    $CONFIG->{ca}{days},
        '-in',      $csr->file,
        '-signkey', $self->key->file,
        '-passin', sprintf( 'file:%s', $pass_file ),
        '-out',    $self->file
    );

    my ( $stdout, $stderr, $exit ) = capture {
        system( $CONFIG->{openssl}, @args );
    };

    if ( $exit != 0 ) {
        croak( sprintf( 'cannot sign certificate: %s', $stderr ) );
    }

    $self->issuer( $self->subject );
    $self->ascii( $self->file->slurp );

    return 1;
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Tiny::OpenSSL::CertificateAuthority - Certificate Authority object.

=head1 VERSION

version 0.1.1

=head1 METHODS

=head2 sign

Sign a certificate.

    my $ca->sign($csr);

=head2 self_sign

Self sign certificate.

    my $ca->self_sign($csr);

=head1 AUTHOR

James F Wilkus <jfwilkus@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James F Wilkus.

This is free software, licensed under:

  The (three-clause) BSD License

=cut
