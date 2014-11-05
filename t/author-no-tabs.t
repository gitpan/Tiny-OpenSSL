
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.09

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Tiny/OpenSSL.pm',
    'lib/Tiny/OpenSSL/Certificate.pm',
    'lib/Tiny/OpenSSL/CertificateAuthority.pm',
    'lib/Tiny/OpenSSL/CertificateSigningRequest.pm',
    'lib/Tiny/OpenSSL/Config.pm',
    'lib/Tiny/OpenSSL/Key.pm',
    'lib/Tiny/OpenSSL/Role/Entity.pm',
    'lib/Tiny/OpenSSL/Subject.pm',
    't/01-config.t',
    't/02-key.t',
    't/03-subject.t',
    't/04-csr.t',
    't/05-ca.t',
    't/06-certificate.t',
    't/author-critic.t',
    't/author-no-tabs.t',
    't/author-pod-spell.t',
    't/release-eol.t',
    't/release-pod-coverage.t',
    't/release-pod-syntax.t'
);

notabs_ok($_) foreach @files;
done_testing;
