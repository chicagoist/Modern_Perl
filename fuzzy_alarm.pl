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
use SuperCandle;
use Glowstick;
use LightSource::Cranky;

my $fuzzy_alarm = Cat->new;
$fuzzy_alarm->meow for 1 .. 3;
say $fuzzy_alarm->sound for 1 .. 3;
#Cat::meow for 1 .. 3;
$fuzzy_alarm->sound("HURA!!!");
say $fuzzy_alarm->sound;

my $fat = Cat->new( name => 'Fatty', birth_year => 2007, diet => 'Sea Treats', age => 8);
say $fat->name, ' eats ', $fat->diet;
$fat->diet( 'Low Sodium Kitty Lo Mein' );
say 'Age of ',$fat->name,' is ',$fat->age(9), ' years old';
say $fat->name, ' now eats ', $fat->diet;
$fat->show_vital_stats;

my $fluffy = Cat->new;
my $cheese = Cat->new;
say 'Alive!' if $fluffy->DOES( 'LivingBeing' );
say 'Cat Alive!' if $fluffy->DOES( 'Cat' );

my $supercandle = SuperCandle->new;
my $lightcandle = LightSource->new;
say $supercandle->candle_power;
say $lightcandle->candle_power;
say $lightcandle->light;
say $lightcandle->enabled;
say $lightcandle->extinguish;
say $lightcandle->light;
my $glowcandle = Glowstick->new;
say $glowcandle->extinguish;
my $crankycandle = LightSource::Cranky->new(enabled => 1);
#say $crankycandle->candle_power;
#say $crankycandle->extinguish;
say $crankycandle->extinguish;
say $crankycandle->light;

foreach my $key (keys %INC) {
    say $key," = ", $INC{$key};
}
say 666;

say $crankycandle->class_loaded;
my $pkg = 'CalculateAge::From::BirthYear';
say "$pkg exists" if eval { $pkg->can( 'can' ) };
say "Cat exists" if eval { Cat->new };
say "age() exists" if $pkg->can( 'age' );