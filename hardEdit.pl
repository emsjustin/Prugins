#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS 

package hardEdit;

use strict;
use Plugins;
use Commands;
use Globals;
use Utils;
use Misc;
use Log qw(message);
use vars qw($filecontent $total);
use Settings;

Plugins::register("hardEdit", "easily add lines at the end of config.txt", \&unload);


my $base_hooks = Plugins::addHooks(
	['initialized',  \&edit]
	);
	
my $commands_handle = Commands::register(
	['clear chomp','clear the chomp.txt', \&clear]
	);
	
sub unload {
	Plugins::delHooks($base_hooks);	
	message "hardEdit plugin reloading or unloading\n", 'success'
}

my $file1 = './plugins/chomp.txt';
my $file2 = Settings::getConfigFilename();

sub edit {
	open(FILE1, $file1) || die "couldn't open the file!";
	open(FILE2, '>>', $file2) || die "couldn't open the file!";
	
	if ((-s $file1) > (-z $file1)) {
	
		while($filecontent = <FILE1>){
			if ( $filecontent ) {
				print FILE2 $filecontent;
				print "Content add $filecontent";
				}
			} 
			close (FILE1); 
			close (FILE2);	
			unload('hardEdit');			
	} else {
		unload('hardEdit');
	}

}

sub clear {
	my (undef, $args) = @_;
		if ($args eq 'clear chomp') {
			open my $tmp, '>', $file1;
			close ($file1);
			print " $file1 was cleaned.";
		}
}
1;
