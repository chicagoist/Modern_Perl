package Cat {
    use v5.10;
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

    use Moose;
    use namespace::autoclean;


    has 'name', is => 'ro', isa => 'Str';

    #has 'age', is => 'ro', isa => 'Int';
    has 'diet', is => 'rw';




    sub meow {
        my $self = shift;
        say 'Meow!';
    }

    has 'sound' => (is => 'rw', default => sub {
        my $self = shift;
        return 'MEOW!';
    });

    sub show_vital_stats {
        my $object = shift;
        say 'My name is ', $object->name;
        say 'I am ', $object->age;
        say 'I eat ', $object->diet;
    }


    with  'CalculateAge::From::BirthYear', 'LivingBeing';
    __PACKAGE__->meta->make_immutable;
}

1;