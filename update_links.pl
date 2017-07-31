#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;
use File::Copy "mv";
use Env qw(HOME);
use Cwd 'abs_path';

sub save_orig {
	my ($df, $f) = @_;
	print "[ MV ] $df orig/$f\n";
	mv ($df, "./orig/$f") or die $!;
}

sub create_link {
	my ($df, $f) = @_;
	print "[ LN ] $f $df\n";
	symlink (abs_path($f), $df) or die $!;
}

sub should_skip {
	my $f = shift;
	return 1 if (($f =~ /^\./) ||
				 ($f eq basename($0)) ||
				 ($f eq "README") ||
				 ($f eq "host") ||
				 ($f eq "orig"));
	return 0;
}

# If ./orig doesn't exist, create it
#
# For each file in this directory:
#	SKIP this file, orig, anything that starts with a '.'
# 	NEXT if there is a link from $HOME/.$file to pwd/$file
# 	MOVE the file to pwd/orig
# 	LN   from $HOME/$file to pwd/$file

mkdir "./orig",0755 unless (-e "./orig");

opendir (DIR, '.') or die $!;

while (my $file = readdir(DIR)) {
	next if should_skip ("$file");

	print "[ PROC ] $file\n";

	my $dotfile = "$HOME" . "/." . "$file";
	# does the dot file exist in $HOME ? NO, create_link()
	unless (-e "$dotfile") {
		create_link ($dotfile, $file);
		next;
	}
	# YES: is it a link to the file here ? NO, save_orig(), create_link()
	if ( -l "$dotfile" ) {
		# If it is a link to us, next
		# Else, break the link, save the target in orig, create_link
		print "[ INFO ] $dotfile is a link to" . readlink ($dotfile) . "\n";
		next if ( readlink ($dotfile) eq abs_path($file) );

		save_orig (readlink ($dotfile), $file);
		unlink ($dotfile) or die $!;
	} else {
		save_orig ($dotfile, $file);
	}
	create_link ($dotfile, $file);
}
