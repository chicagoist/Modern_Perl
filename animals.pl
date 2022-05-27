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

my $horse = Horse->new(name => 'Mr. Ed');
$horse->color('grey');

say $horse->name, ' is colored ', $horse->color;
$horse->speak;

my $cow = Cow->new(name => 'Cowwy');
my $baab = Sheep->new( color => 'white', name => 'Baab' );
$baab->speak; # prints "Baab goes baaaah"
$cow->speak; #
say $baab->name , ' colored ', $baab->color;
