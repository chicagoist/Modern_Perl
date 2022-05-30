#!/usr/bin/perl -w

use v5.10;
use FindBin qw($Bin);
use lib "$Bin/packages";
# use lib "/packages";# в подкаталоге
our $VERSION = '0.01';
# use CGI;
# use POSIX;
# use Encode qw(decode_utf8);
# use Encode qw(decode encode);
#= BEGIN{@ARGV=map Encode::decode(#\$_,1),@ARGV;}
# BEGIN{@ARGV = map decode_utf8(#\$_, 1), @ARGV;}
# use open qw(:std :encoding(UTF-8));
use utf8::all 'GLOBAL';
# use Encode::Locale;
# use Encode;
# use diagnostics;


use strict;
use warnings FATAL => 'all';
use autodie qw(:all);
use utf8;
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
use Data::Dumper;
use Bundle::Camelcade;# for Intellij IDEA
use YAML;
use DDP;

use Horse;
use Cow;
use Sheep;
use Mouse;
use RaceHorse;
use Modern::Perl '2015';

my $horse = Horse->new(name => 'Mr. Ed');
$horse->_private_set_color('grey');

say $horse->name, ' is colored ', $horse->color;
$horse->speak;

my $cow = Cow->new(name => 'Cowwy');
my $baab = Sheep->new( color => 'white', name => 'Baab' );
$baab->speak; # prints "Baab goes baaaah"
$cow->speak; #
say $baab->name , ' colored ', $baab->color;

my $mickey = Mouse->new( name => 'Mickey' );
$mickey->speak;

my $s = RaceHorse->new( name => 'Seattle Slew' );
$s->won;
$s->won;
$s->won;
$s->placed;
$s->lost;
print $s->standings, "\n"; # 3 wins, 1 places, 0 shows, 1 losses
say $s->fandango;

if (RaceHorse->isa('Horse')) { # порожден ли класс Horse от класса Animal?
 print "Класс RaceHorse порожден от класса Horse.\n";
}

say ref $s, " have - 'name'" if $s->can('name');
say ref $mickey," have - 'fandango'" if $mickey->can('fandango');