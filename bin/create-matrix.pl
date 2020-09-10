#!/usr/bin/env perl

use 5.006;
use strict;
use warnings;

use JSON::PP qw(encode_json);

my $x = {
    include => [
    { 'perl-version' => '5.12', },
    { 'perl-version' => '5.14', },
    { 'perl-version' => '5.16.2', },
] };

my $y = encode_json($x);

print ":: set-output name=perl-versions::$y\n";
print "::set-output name=perl-versions::$y\n";

exit 0;

#1;

__END__

#=pod

#=encoding UTF-8

#=head1 NAME

#check-ci-perl-version - Check that we have the request Perl version on AppVeyor or Travis CI

#=head1 VERSION

#Version 1.000

#=head1 DESCRIPTION

#Checks that the Perl version this script runs under is the version specified
#in the C<TRAVIS_PERL_VERSION> or C<PERL_VERSION> environment variable.

#=head1 SUPPORT

#=head2 Bugs / Feature Requests

#Please report any bugs or feature requests through the issue tracker
#at L<https://github.com/skirmess/dzil-inc/issues>.
#You will be notified automatically of any progress on your issue.

#=head2 Source Code

#This is open source software. The code repository is available for
#public review and contribution under the terms of the license.

#L<https://github.com/skirmess/dzil-inc>

#  git clone https://github.com/skirmess/dzil-inc.git

#=head1 AUTHOR

#Sven Kirmess <sven.kirmess@kzone.ch>

#=head1 COPYRIGHT AND LICENSE

#This software is Copyright (c) 2017-2020 by Sven Kirmess.

#This is free software, licensed under:

#  The (two-clause) FreeBSD License

#=cut

# vim: ts=4 sts=4 sw=4 et: syntax=perl
