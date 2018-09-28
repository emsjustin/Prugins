macro remover_all_equips {
	$removeAll = stripTease()
	$listLenght = @listlenght($removeAll)
	$one = @arg("$removeAll", 1)
	$i = 1
	while ($i <= $listLenght) as equipThat
		$equipInvIndex = @arg("$removeAll", $i)
		do uneq $equipInvIndex
		$i++;
	end equipThat
}

sub stripTease {
	my $index_equipped;
	for my $item (@{$char->inventory}) {
		if ($item->{equipped}) {
				if (!$index_equipped) {
					$index_equipped .= '"' .$item->{binID} .'"';
				} else {
					$index_equipped .= ', "'."$item->{binID}".'"';
				}
		}
	}
	return $index_equipped;
}
