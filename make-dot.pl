#!/usr/bin/perl

use File::Basename;
 
print "digraph {\n";

my $inc = <<"END_INCLUDE";
subgraph cluster1 {
	style=invis;
	"R-basic";
	"R-extras";
}
subgraph cluster2 {
	style=invis;
	"pnp-tools-basic";
	"pnp-tools-intermediate";
	"pnp-tools-advanced";
}
subgraph cluster3 {
	style=invis;
	"go-basic";
	"go-extras";
}
subgraph cluster4 {
	style=invis;
	"perl-basic";
	"perl-extras";
}
subgraph cluster5 {
	style=invis;
	"python-basic";
	"python-extras";
}
subgraph cluster6 {
	style=invis;
	"ruby-basic";
	"ruby-extras";
}
subgraph cluster7 {
	style=invis;
	"os-core";
	"os-core-update";
	"os-core-dev";
	"os-clr-on-clr";
	"os-utils";
	"os-utils-gui";
}
subgraph cluster8 {
	style=invis;
	"devtools-basic";
	"devtools-extras";
}
subgraph clusteropenstack {
	style=invis;
	"openstack-common";
	"openstack-database";
	"openstack-compute";
	"openstack-compute-controller";
	"openstack-test-suite";
	"openstack-block-storage-controller";
	"openstack-block-storage";
	"openstack-data-processing";
	"openstack-telemetry";
	"openstack-telemetry-controller";
	"openstack-object-storage";
	"openstack-orchestration";
	"openstack-lbaas";
	"openstack-network";
	"openstack-vpnaas";
	"openstack-all-in-one";
	"openstack-image";
	"openstack-identity";
	"openstack-controller";
	"openstack-python-clients";
	"openstack-dashboard";
	"message-broker-rabbitmq";
};
subgraph cluster0 {
	style=invis;	
	"sysadmin-basic";
	"sysadmin-advanced";
}
END_INCLUDE

print $inc;

@files = glob("bundles/*");

my %bundles;
my %bundles2;

foreach my $filename (@files) {
	open (my $fh, "<", $filename);
	my $first = 0;
	my $bundle = basename($filename);

	while (<$fh>) {
		chomp;
		if (!/^include\((.*)\)/) {
			next;
		}
		my $line = $1;
		$first = 1;
		print "\"$bundle\" -> \"$line\";\n";
		# bundle that included something
		$bundles2{"$line"} = 1;
	}
	# bundles that didn't include anything
	if ($first == 0) {
		$bundles{"$bundle"} = 1;
	}

	close($fh);
}

while (my ($key, $value) = each(%bundles)){ 
	if (defined($bundles2{"$key"})) {
		print "\"$key\" -> \"os-core\";\n";
	}
}
print "}\n";

