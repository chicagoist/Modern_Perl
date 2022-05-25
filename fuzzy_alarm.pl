#!/usr/bin/perl -w

use v5.10;
use FindBin qw($Bin);
use lib "$Bin";
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

use Cat;

my $fuzzy_alarm = Cat->new;
$fuzzy_alarm->meow for 1 .. 3;
say $fuzzy_alarm->sound for 1 .. 3;
#Cat::meow for 1 .. 3;
$fuzzy_alarm->sound("HURA!!!");
say $fuzzy_alarm->sound;

my $fat = Cat->new( name => 'Fatty', birth_year => 2007, diet => 'Sea Treats');
say $fat->name, ' eats ', $fat->diet;
$fat->diet( 'Low Sodium Kitty Lo Mein' );
say 'Age of ',$fat->name,' is ',$fat->age, ' years old';
say $fat->name, ' now eats ', $fat->diet;
$fat->show_vital_stats;

my $fluffy = Cat->new;
my $cheese = Cat->new;
say 'Alive!' if $fluffy->DOES( 'LivingBeing' );
say 'Cat Alive!' if $fluffy->DOES( 'Cat' );