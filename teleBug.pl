package Desbugar;
 
use strict;
use Misc;
use encoding "utf8";
use Globals;
use warnings;
use Log qw(warning message error);
use Commands;
 
Plugins::register('Desbugar','Bug Teleporte', \&onUnload);
 
my $hooks = Plugins::addHooks(
    ['packet/message_string', \&desbugando],
);
 
sub onUnload {
     Plugins::delHooks($hooks);
}
 
sub desbugando {
    my ($self, $args) = @_;
   
    ++$args->{msg_id};
 
    if ($args->{msg_id} && $args->{msg_id} == 1925) {
        Commands::run("warp cancel");
        warning "[Erro] Desbugando.\n";
    }
}
 
1;
