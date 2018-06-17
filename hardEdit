#                     _           _   _       
#  ___ _ __ ___  ___ (_)_   _ ___| |_(_)_ __  
# / _ \ '_ ` _ \/ __|| | | | / __| __| | '_ \ 
#|  __/ | | | | \__ \| | |_| \__ \ |_| | | | |
# \___|_| |_| |_|___// |\__,_|___/\__|_|_| |_|
#                  |__/                       
#	BECAUSE FARM IS WHAT MATTERS
# 1 - Criar um arquivo "chomp.txt" dentro da pasta plugins
# 2 - O conteúdo do arquivo "chomp.txt" será adicionado (ao final do arquivo "config.txt") toda vez que o oepnkore iniciar.
#     DELETE O CHOMP.TXT após usar, para não adicionar várias linhas iguais.

package hardEdit;

use strict;
use Plugins;
use Commands;
use Globals;
use Utils;
use Misc;
use Log qw(message);
use vars qw($filecontent $total);
use Settings::getConfigFilename;
use File::Spec;

Plugins::register("hardEdit", "easily add lines at the end of config.txt", \&unload);


my $base_hooks = Plugins::addHooks(
	['start2',  \&edit]
	);
	
sub unload {
	Plugins::delHooks($hooks);
	message "hardEdit plugin reloading or unloading\n", 'success'
}

our $folder = $Plugins::current_plugin_folder;

sub edit {

	my $file1 = File::Spec->catdir($folder,'chomp.txt');
	my $file2 = Settings::getControlFilename($file)
	
	open(FILE1, $file1) || die "couldn't open the file!";
	open(FILE2, $file2) || die "couldn't open the file!";
	
	while($filecontent = <FILE1>){
		if ( $filecontent ) {
		print FILE2 $filecontent;
		print "Content add $filecontent";
    }  
  } 
close (FILE1); 
close (FILE2);
}
1;
