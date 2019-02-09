#
# Run this script in the main openkore folder
# Original: https://github.com/PcWiz4rD/Plugins/blob/master/AutoUpDate.pl
# Adapted: emsjustin

use strict;
use warnings;
use utf8;
use File::Fetch;
use File::Copy;
use LWP::Simple;

my %links = (
             	
		'./tables/bRO/recvpackets.txt' => 'https://raw.githubusercontent.com/OpenKore/openkore/master/tables/bRO/recvpackets.txt',
		'./tables/bRO/shuffle.txt' => 'https://raw.githubusercontent.com/OpenKore/openkore/master/tables/bRO/shuffle.txt',					   
		'./tables/bRO/sync.txt' => 'https://raw.githubusercontent.com/OpenKore/openkore/master/tables/bRO/sync.txt',
		'./tables/servers.txt' => 'https://raw.githubusercontent.com/OpenKore/openkore/master/tables/servers.txt',
		
	     
);


for my $items (keys %links) {
my $content = get($links{$items});
defined $content or die "Cannot read '$links{$items}";
open(my $rtf, '>', $items) or die "não foi possível abrir o arquivo";

print $rtf $content;
print "$items Atualizado \n";
close $rtf or die "não foi possível fechar o arquivo : $!";
}
