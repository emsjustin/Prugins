#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS 
# Testar se o servidor está online

use strict;
use IO::Socket::INET;
use Time::Hires;

my $socket;

sub open_client() {
$socket = new IO::Socket::INET (
 			PeerHost  => '127.0.0.1',		# host do server
            PeerPort  => '10000',# porta em que o server está listening
			Proto => 'tcp',
);	# timeout de conexao
die "cannot connect to the server $!\n" unless $socket;
print "Cliente Socket\n";# Criando o socket cliente
}
# auto-flush on socket
$| = 1;
my $datestring = localtime();
my $time = time;

open_client();

while (1) {
		print $socket "ok\n";
		print "seding...\n";
		my $buff;
		$socket->recv($buff, 1024);
		
		if (!$buff) {		
			print "server offline $datestring \n";
			shutdown($socket, 1);
				if (time > $time) {
					$time = time + 240;
					print "restarting server \n";
					open_client();
				}
		}

		sleep 5;
}
