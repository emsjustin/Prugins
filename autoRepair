#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS 
# não terminado

package autoRepair;

use strict;
use Plugins;
use Commands;
use Globals;
use Utils;
use Misc;
use Log qw(message);
use vars qw($filecontent $total);
use Settings;

Plugins::register("autoRepair", "automatic repair broken items", \&unload);

my $base_hooks = Plugins::addHooks(
	['unequip_item',  \&broken],
	['AI_pre',  \&checkTimer]
	);
	
my $commands_handle = Commands::register(
	['broken','fast broken list', \&broken]
	);
	
sub unload {
	Plugins::delHooks($base_hooks);	
	message "autoRepair plugin reloading or unloading\n", 'success'
}

my $repairnpc = "prt_in";

sub checkTimer {
	if (timeOut($timeout{ai_checkBroken})) {
		broken();
		$timeout{ai_checkBroken}{time} = time;
	}
}


sub broken {
	foreach my $item (@{$char->inventory->getItems()}) {
		if ($item->{broken}) {
			print "item $item->{name} are broked \n";
			repair();
		}
	}
}
sub repair {
	if (($item->{broken}) && (timeOut($timeout{ai_checkBroken}) < $timeout{ai_checkBroken}{time})) { 
	Commands::run ("ai manual");
	Commands::run ("move $repairnpc 63 54");
	configModify("allowedMap "); #lista allowed
		if ($repairnpc eq $field->name) {
			Commands::run ("do talknpc 63 54 c r0 r0 c");
			Commands::run ("do ai auto");
			configModify("allowedMap "); #lista allowed
		}
	}
}

1;
