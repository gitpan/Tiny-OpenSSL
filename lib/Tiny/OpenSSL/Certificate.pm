use strict;
use warnings;

package Tiny::OpenSSL::Certificate;

# ABSTRACT: X509 Certificate Object.
our $VERSION = '0.1.1'; # VERSION

use Moo;
use Types::Standard qw( InstanceOf );

with 'Tiny::OpenSSL::Role::Entity';

has [qw(issuer subject)] =>
    ( is => 'rw', isa => InstanceOf ['Tiny::OpenSSL::Subject'] );

has key => ( is => 'rw', isa => InstanceOf ['Tiny::OpenSSL::Key'] );

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Tiny::OpenSSL::Certificate - X509 Certificate Object.

=head1 VERSION

version 0.1.1

=head1 METHODS

=head2 issuer

A Tiny::OpenSSL::Subject object for the issuer of the certificate.

=head2 subject

A Tiny::OpenSSL::Subject object for the subject of the certificate.

=head2 key

A Tiny::OpenSSL::Key object.

=head1 AUTHOR

James F Wilkus <jfwilkus@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2014 by James F Wilkus.

This is free software, licensed under:

  The (three-clause) BSD License

=cut
