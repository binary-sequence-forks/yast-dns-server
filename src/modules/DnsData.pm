#! /usr/bin/perl -w
#
# DnsServer module written in Perl
#

package DnsData;

use strict;

use ycp;
use YaST::YCP qw(Boolean);

use YaPI;
textdomain("dns-server");

our %TYPEINFO;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(@tsig_keys $start_service $chroot @allowed_interfaces
@zones @options @logging $ddns_file_name
$modified $save_all @files_to_delete %current_zone $current_zone_index
$adapt_firewall %firewall_settings $write_only @new_includes @deleted_includes
@zones_update_actions $firewall_support @new_includes_tsig @deleted_includes_tsig
$local_forwarder);

# persistent variables

our $start_service = 0;

our $chroot = 0;

my @allowed_interfaces = ();

=head3 @zones

See also L</%current_zone>

One zone is a hash with this content:

=over

=item - "modified" -> boolean

=item - "options" -> list of hashes {"key" => ..., "value" => ...}

=item - ...

=back

=cut
my @zones = ();

my @options = ();

my @logging = ();

my $ddns_file_name = "";

our @tsig_keys = ();

#transient variables

my $modified = 0;

my $save_all = 0;

my @files_to_delete = ();

=head3 %current_zone

A copy of an item from @zones

Get it with SelectZone(integer); see also FindZone(string) -> integer

Put it back with StoreZone() -> true

=cut
my %current_zone = ();

=head3 $current_zone_index

SelectZone sets this

StoreZone will append a zone if this is -1

=cut
my $current_zone_index = -1;

my $adapt_firewall = 0;

my %firewall_settings = ();

my $write_only = 0;

my @new_includes = ();

my @deleted_includes = ();

my @zones_update_actions = ();

my $firewall_support = 1;

my @new_includes_tsig = ();

my @deleted_includes_tsig = ();

my $local_forwarder = "";

1;

# EOF
