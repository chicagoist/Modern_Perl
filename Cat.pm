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
    has 'birth_year' => (
        is  => 'ro',
        isa => 'Int',
        default => sub { (localtime)[5] + 1900 }
    );



    sub age {
        my $self = shift;
        my $years_old = shift;
        my $year = (localtime)[5] + 1900;

        return $years_old ? $years_old : $year - $self->birth_year;
    }

    sub meow {
        my $self = shift;
        say 'Meow!';
    }

    has 'sound' => (is => 'rw', default => sub {
        my $self = shift;
        return 'MEOW!';
    });

    __PACKAGE__->meta->make_immutable;
}

1;