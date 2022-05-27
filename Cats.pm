package Cats {
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


    use MooseX::Declare;
    role LivingBeing { requires qw(name age diet) };

        role CalculateAge::From::BirthYear {
            has 'birth_year',
                is      => 'ro',
                isa     => 'Int',
                default => sub { (localtime)[5] + 1900 };

            method age {
                return (localtime)[5] + 1900 - $self->birth_year;
            }
        }

            class Cat with LivingBeing with CalculateAge::From::BirthYear {
        has 'name',is  => 'ro',isa => 'Str';
        has 'diet',is => 'rw';
    }

    __PACKAGE__->meta->make_immutable;
}
1;