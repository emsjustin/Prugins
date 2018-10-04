package howManyStorages;

use strict;
use File::Spec;
use Plugins;
use Globals qw($interface $quit);
use Log qw(debug message warning error);
use Settings;
use Network;
use Network::Send;
use Utils;
use Storage;
use Misc;

Plugins::register('howManyStorages', 'count how many times you use storage', \&Unload);

my $hooks = Plugins::addHooks(
      ['packet/storage_opened', \&onInfo, undef]
);
		message "Check howManyStorages successfully loaded.\n", "success";
		
my $chooks = Commands::register(
	['howMany', "Calculating", \&commandHandler]

);

my $lastStorage = 0;

sub on_unload {
	message "Plugin howManyStorages unloading\n", 'success';
	Plugins::delHooks($hooks);
	Commands::unregister($chooks);
}

sub onInfo {
	my ($self, $args) = @_;
	if ($args->{change} > 0) {
		$lastStorage = $args->{change};
	}
	
sub commandHandler {
		message "howManyStorages: $lastStorage\n";
}

return 1;
