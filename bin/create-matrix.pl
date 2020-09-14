#!/usr/bin/env perl

use 5.006;
use strict;
use warnings;

use JSON::PP;

# TODO job to update available perl versions
# TODO read config file from $ENV{GITHUB_WORKSPACE}/.github/... for minimum version
# TODO add tests from base repo

#my $linux = { 
#    include => [
#        { 'perl-version' => '5.8.1', },
#        { 'perl-version' => '5.8.2', },
#        { 'perl-version' => '5.8', },
#        { 'perl-version' => '5.10.0', },
#        { 'perl-version' => '5.10', },
#        { 'perl-version' => '5.12', },
#        { 'perl-version' => '5.14', },
#        { 'perl-version' => '5.16', },
#        { 'perl-version' => '5.18', },
#        { 'perl-version' => '5.20', },
#        { 'perl-version' => '5.22', },
#        { 'perl-version' => '5.24', },
#        { 'perl-version' => '5.26', },
#        { 'perl-version' => '5.28', },
#        { 'perl-version' => '5.30', },
#        { 'perl-version' => '5.32', },
#    ],
#};

my $linux = [
        { 'perl-version' => '5.18', },
        { 'perl-version' => '5.12', },
    ];

my $macos = {
    include => [
        { 'perl-version' => '5.18', },
    ],
};

my $windows = {
    include => [
        { 'perl-version' => '5.8.9', },
#        { 'perl-version' => '5.10.0', },
#        { 'perl-version' => '5.10.1', },
#        { 'perl-version' => '5.12.3', },
#        { 'perl-version' => '5.14.4', },
#        { 'perl-version' => '5.16.3', },
#        { 'perl-version' => '5.18.4', },
#        { 'perl-version' => '5.20.3', },
#        { 'perl-version' => '5.22.3', },
#        { 'perl-version' => '5.24.4', },
#        { 'perl-version' => '5.26.3', },
#        { 'perl-version' => '5.28.2', },
#        { 'perl-version' => '5.30.3', },
    ],
};

## https://github.com/shogo82148/actions-setup-perl/blob/master/.github/workflows/linux.yml
#        - "5.32.0"
#        - "5.30.3"
#        - "5.30.2"
#        - "5.30.1"
#        - "5.30.0"
#        - "5.28.3"
#        - "5.28.2"
#        - "5.28.1"
#        - "5.28.0"
#        - "5.26.3"
#        - "5.26.2"
#        - "5.26.1"
#        - "5.26.0"
#        - "5.24.4"
#        - "5.24.3"
#        - "5.24.2"
#        - "5.24.1"
#        - "5.24.0"
#        - "5.22.4"
#        - "5.22.3"
#        - "5.22.2"
#        - "5.22.1"
#        - "5.22.0"
#        - "5.20.3"
#        - "5.20.2"
#        - "5.20.1"
#        - "5.20.0"
#        - "5.18.4"
#        - "5.18.3"
#        - "5.18.2"
#        - "5.18.1"
#        - "5.18.0"
#        - "5.16.3"
#        - "5.16.2"
#        - "5.16.1"
#        - "5.16.0"
#        - "5.14.4"
#        - "5.14.3"
#        - "5.14.2"
#        - "5.14.1"
#        - "5.14.0"
#        - "5.12.5"
#        - "5.12.4"
#        - "5.12.3"
#        - "5.12.2"
#        - "5.12.1"
#        - "5.12.0"
#        - "5.10.1"
#        - "5.10.0"
#        - "5.8.9"
#        - "5.8.8"
#        - "5.8.7"
#        - "5.8.6"
#        - "5.8.5"
#
## https://github.com/shogo82148/actions-setup-perl/blob/master/.github/workflows/win32.yml        
#        - "5.32.0"
#        - "5.30.3"
#        - "5.30.2"
#        - "5.30.1"
#        - "5.30.0"
#        - "5.28.3"
#        - "5.28.2"
#        - "5.28.1"
#        - "5.28.0"
#        - "5.26.3"
#        - "5.26.2"
#        - "5.26.1"
#        - "5.26.0"
#        - "5.24.4"
#        - "5.24.3"
#        - "5.24.2"
#        - "5.24.1"
#        - "5.24.0"
#        - "5.22.4"
#        - "5.22.3"
#        - "5.22.2"
#        - "5.22.1"
#        - "5.22.0"
#
#        # - "5.21.11"
#        # - "5.21.10"
#        # #- "5.21.9" # failed with Devel-PatchPerl-1.80
#        # - "5.21.8"
#        # - "5.21.7"
#        # - "5.21.6"
#        # - "5.21.5"
#        # - "5.21.4"
#        # - "5.21.3"
#        # - "5.21.2"
#        # - "5.21.1"
#        # - "5.21.0"
#
#        - "5.20.3"
#        - "5.20.2"
#        - "5.20.1"
#        - "5.20.0"
#
#        # builds fail from v5.19.2 to v5.19.11
#        # I'll try them later
#        # - "5.19.11"
#        # - "5.19.10"
#        # - "5.19.9"
#        # - "5.19.8"
#        # - "5.19.7"
#        # - "5.19.6"
#        # - "5.19.5"
#        # - "5.19.4"
#        # - "5.19.3"
#        # - "5.19.2"
#        # - "5.19.1"
#        # - "5.19.0"
#
#        - "5.18.4"
#        - "5.18.3"
#        - "5.18.2"
#        - "5.18.1"
#        - "5.18.0"
#
#        # TODO: fix builds from v5.17.3 to v5.17.11
#        # - "5.17.11"
#        # - "5.17.10"
#        # - "5.17.9"
#        # - "5.17.8"
#        # - "5.17.7"
#        # - "5.17.6"
#        # - "5.17.5"
#        # - "5.17.4"
#        # - "5.17.3"
#        # - "5.17.2"
#        # - "5.17.1"
#        # - "5.17.0"
#
#        - "5.16.3"
#        - "5.16.2"
#        - "5.16.1"
#        - "5.16.0"
#
#        # TODO: fix builds from v5.15.0 to v5.15.9
#        # - "5.15.9"
#        # - "5.15.8"
#        # - "5.15.7"
#        # - "5.15.6"
#        # - "5.15.5"
#        # - "5.15.4"
#        # - "5.15.3"
#        # - "5.15.2"
#        # - "5.15.1"
#        # - "5.15.0"
#
#        - "5.14.4"
#        - "5.14.3"
#        - "5.14.2"
#        - "5.14.1"
#        - "5.14.0"
#
#        # TODO: fix builds from v5.13.2 to v5.13.11
#        # - "5.13.11"
#        # - "5.13.10"
#        # - "5.13.9"
#        # - "5.13.8"
#        # - "5.13.7"
#        # - "5.13.6"
#        # - "5.13.5"
#        # - "5.13.4"
#        # - "5.13.3"
#        # - "5.13.2"
#        # - "5.13.1"
#        # - "5.13.0"
#
#        - "5.12.5"
#        - "5.12.4"
#        - "5.12.3"
#        - "5.12.2"
#        - "5.12.1"
#        - "5.12.0"
#
#        # TODO: fix me https://github.com/shogo82148/actions-setup-perl/pull/60/checks?check_run_id=341423773
#        # - "5.11.5"
#        # - "5.11.4"
#        # - "5.11.3"
#        # - "5.11.2"
#        # - "5.11.1"
#        # - "5.11.0"
#
#        - "5.10.1"
#        - "5.10.0"
#
#        # TODO: fix me, builds of 5.9.x are failed
#        # - "5.9.5"
#        # - "5.9.4"
#        # - "5.9.3"
#        # - "5.9.2"
#        # - "5.9.1"
#        # - "5.9.0"
#
#        - "5.8.9"
#        - "5.8.8"
#        - "5.8.7"
#        - "5.8.6"
#        - "5.8.5"
#
#https://github.com/shogo82148/actions-setup-perl/blob/master/.github/workflows/darwin.yml
#        - "5.32.0"
#        - "5.30.3"
#        - "5.30.2"
#        - "5.30.1"
#        - "5.30.0"
#        - "5.28.3"
#        - "5.28.2"
#        - "5.28.1"
#        - "5.28.0"
#        - "5.26.3"
#        - "5.26.2"
#        - "5.26.1"
#        - "5.26.0"
#        - "5.24.4"
#        - "5.24.3"
#        - "5.24.2"
#        - "5.24.1"
#        - "5.24.0"
#        - "5.22.4"
#        - "5.22.3"
#        - "5.22.2"
#        - "5.22.1"
#        - "5.22.0"
#        - "5.20.3"
#        - "5.20.2"
#        - "5.20.1"
#        - "5.20.0"
#        - "5.18.4"
#        - "5.18.3"
#        - "5.18.2"
#        - "5.18.1"
#        - "5.18.0"
#        - "5.16.3"
#        - "5.16.2"
#        - "5.16.1"
#        - "5.16.0"
#        - "5.14.4"
#        - "5.14.3"
#        - "5.14.2"
#        - "5.14.1"
#        - "5.14.0"
#        - "5.12.5"
#        - "5.12.4"
#        - "5.12.3"
#        - "5.12.2"
#        - "5.12.1"
#        - "5.12.0"
#        - "5.10.1"
#        - "5.10.1"
#        - "5.10.0"
#        - "5.8.9"
#        - "5.8.8"
#        - "5.8.7"
#        - "5.8.6"
#        - "5.8.5"


print '::set-output name=perl-versions-linux::' . JSON::PP->new->utf8->indent(0)->encode($linux) . "\n";
print '::set-output name=perl-versions-macos::' . JSON::PP->new->utf8->indent(0)->encode($macos) . "\n";
print '::set-output name=perl-versions-windows::' . JSON::PP->new->utf8->indent(0)->encode($windows) . "\n";

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
