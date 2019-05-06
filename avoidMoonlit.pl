#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS 

package avoidMoonlit;

use strict;
use Plugins;

use Time::HiRes qw(time);

use Globals;
use Utils;
use Misc;
use AI;
use Network::Send;
use Commands;
use Skill;
use Log qw(debug message warning error);
use Translation;
use Actor;

Plugins::register('avoidMoonlit', 'React to Moonlit block.', \&on_unload, \&on_reload);

my $hooks = Plugins::addHooks(
		['packet_areaSpell', \&avoidSkill, undef],
		['packet_pre/high_jump', \&makeAround, undef],
		
);

sub on_unload {
        Plugins::delHooks($hooks);
}

sub on_reload {
        message "avoidSkill plugin reloading\n";
        Plugins::delHooks($hooks);
}

my $x;
my $y;
sub avoidSkill {
	for my $ID (@spellsID) {
		my $spell = $spells{$ID};

		if (getSpellName($spell->{type}) eq "Moonlit Water Mill") {
		$x = ($spell->{'pos'}{'x'} - int(rand(9)));
		$y = ($spell->{'pos'}{'y'} + int(rand(8)));
			if ($char->{'pos_to'}{'x'} == $spell->{'pos'}{'x'} && $char->{'pos_to'}{'y'} == $spell->{'pos'}{'y'}) {
			Commands::run("move $x  $y");	
			}
		}
	}
}
sub makeAround {
	$x = ($char->{'pos'}{'x'} - int(rand(5)));
	$y = ($char->{'pos'}{'y'} + int(rand(2)));
	Commands::run("move $x  $y");
}

1;
