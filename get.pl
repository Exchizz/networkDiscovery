use strict;
use warnings;
use Getopt::Long;
use Net::SNMP;
use Data::Dumper;
use Net::SNMP::Interfaces;

my $ifname;
my $hostname;
my $community;
my $version = 1;

GetOptions( "ifname=s"      => \$ifname,
            "host=s"        => \$hostname,
            "community=s"   => \$community,
            "protocol:s"    => \$version);

print "Running\n";
my $interfaces = Net::SNMP::Interfaces->new(Hostname => $hostname, Community => $community);
my @interfaces = $interfaces->all_interfaces();
my $inter = $interfaces->interface($ifname);


#We get the index of $ifname
my $ifindex = $inter->index();
#Speed
my $vitesse = $inter->ifHighSpeed();
#Alias
my $ifalias = $inter->ifAlias();
my $ifdescr = $inter->ifDescr();
my $ifstatus = $inter->ifOperStatus();

foreach my $interface (@interfaces) {
	print "index: ", $interface->index(), " speed: ",$interface->ifHighSpeed(), " ifalias: ", $interface->ifAlias()," description: ",$interface->ifDescr(), " status: ", $interface->ifOperStatus()."\n";
}

