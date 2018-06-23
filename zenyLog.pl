#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS 
# Cria um arquivo zenyLog.txt
# [DATA] [CHAR] [ZENY/HORA]
package zenyLog;
 
use strict;
use Plugins;
use Settings;
use Globals;
use Utils;
use Misc;
use Log qw(message error warning);
use Network;
use Time::HiRes qw(time);
 
#########
# startup
Plugins::register('zenyLog', 'Creates a detailed zeny log', \&Unload, \&Unload);

my $commands_handle = Commands::register(
	['zeny','create a zeny output log file', \&zenyLog],
	);

# onUnload
sub unload {
    Commands::unregister($commands_handle);
    undef $commands_handle;
	message "zenyLog plugin reloading or unloading\n", 'success'
}

my $datestring = localtime();

sub zenyLog {
    my (undef, $args) = @_;
	my ($endTime_EXP, $w_sec, $zenyPerHour, $zenyMade);
	$endTime_EXP = time;
	$w_sec = int($endTime_EXP - $startTime_EXP);
		if ($args eq 'output') {
		$zenyMade = $char->{zeny} - $startingzeny;
		$zenyPerHour = int($zenyMade / $w_sec * 3600);
			open(WRITE, ">>:utf8", "$Settings::logs_folder/zenyLog.txt");
			print WRITE "[$datestring] $char->{name}: $zenyPerHour \n";
		}
	close(WRITE);
	message "[zenyLog] Info saved to Log File\n";
}
	
	
return 1;
