package LightSource::Cranky {
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

    use Carp 'carp';
    use Moose;
    extends 'LightSource';
    use namespace::autoclean;

    override light => sub {
        my $self = shift;
        carp "Can't light a lit LightSource!" if $self->enabled;
        super();
    };

    override extinguish => sub {
        my $self = shift;
        carp "Can't extinguish unlit LightSource!" unless $self->enabled;
        super();
    };

    __PACKAGE__->meta->make_immutable;
}
1;