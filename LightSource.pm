package LightSource {
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

    has 'candle_power', is      => 'ro',
        isa     => 'Int',
        default => 1;

    has 'enabled', is      => 'ro',
        isa     => 'Bool',
        default => 0,
        writer  => '_set_enabled';

    sub light
    {
        my $self = shift;
        $self->_set_enabled( 1 );
    }

    sub extinguish
    {
        my $self = shift;
        $self->_set_enabled( 0 );
    }

    __PACKAGE__->meta->make_immutable;
}
1;