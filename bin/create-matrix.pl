#!/usr/bin/env perl

use 5.006;
use strict;
use warnings;

use JSON::PP;

# TODO job to update available perl versions
# TODO read config file from $ENV{GITHUB_WORKSPACE}/.github/... for minimum version
# TODO add tests from base repo

my $linux => { 
    include => [
        { 'perl-version' => '5.8.1', },
        { 'perl-version' => '5.8.2', },
        { 'perl-version' => '5.8', },
        { 'perl-version' => '5.10.0', },
        { 'perl-version' => '5.10', },
        { 'perl-version' => '5.12', },
        { 'perl-version' => '5.14', },
        { 'perl-version' => '5.16', },
        { 'perl-version' => '5.18', },
        { 'perl-version' => '5.20', },
        { 'perl-version' => '5.22', },
        { 'perl-version' => '5.24', },
        { 'perl-version' => '5.26', },
        { 'perl-version' => '5.28', },
        { 'perl-version' => '5.30', },
        { 'perl-version' => '5.32', },
    ],
};

my $macos => {
    include => [
        { 'perl-version' => '5.18', },
    ],
};

my $windows => {
    include => [
        { 'perl-version' => '5.8.9', },
        { 'perl-version' => '5.10.0', },
        { 'perl-version' => '5.10.1', },
        { 'perl-version' => '5.12.3', },
        { 'perl-version' => '5.14.4', },
        { 'perl-version' => '5.16.3', },
        { 'perl-version' => '5.18.4', },
        { 'perl-version' => '5.20.3', },
        { 'perl-version' => '5.22.3', },
        { 'perl-version' => '5.24.4', },
        { 'perl-version' => '5.26.3', },
        { 'perl-version' => '5.28.2', },
        { 'perl-version' => '5.30.3', },
    ],
];


print '::set-output name=perl-versions-linux::' . JSON::PP->new->utf8->indent(0)->encode($linux);
print '::set-output name=perl-versions-macos::' . JSON::PP->new->utf8->indent(0)->encode($macos);
print '::set-output name=perl-versions-windows::' . JSON::PP->new->utf8->indent(0)->encode($windows);

print `env`;

print `pwd`;

print "-> RUNNER_WORKSPACE\n";
print `ls -la $ENV{RUNNER_WORKSPACE}`;
print "-> GITHUB_WORKSPACE\n";
print `ls -la $ENV{GITHUB_WORKSPACE}`;

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
