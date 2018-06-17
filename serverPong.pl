#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS 
# Servidor responde se está online

use strict;
use IO::Socket::INET;
use Time::Hires;

my $socket = new IO::Socket::INET (
    LocalHost => '127.0.0.1',
    LocalPort => '10000',
    Proto => 'tcp',
    Listen => 1,
    Reuse => 1
);


die "cannot create socket $!\n" unless $socket;
print "Server 10002\n";

$| = 1;


while (1) {
	my $client = $socket->accept();
        my $addr = gethostbyaddr($client->peeraddr, AF_INET);
        my $port = $client->peerport;
        while (<$client>) {
			if ($_ == 'ok') {
                print "[Client:$port] $_";  ##  Print the client port and the message recived
                print $client "$.: $_";
				
			}
        }
}
 
