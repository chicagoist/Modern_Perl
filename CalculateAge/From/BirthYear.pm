package CalculateAge::From::BirthYear {
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

    use Moose::Role;
    state $years_now;


    has 'birth_year'=> (
        is => 'ro',
        isa => 'Int',
        default => sub { (localtime)[5] + 1900 }
    );

    sub age {
        my $self = shift;
        my $years_old = shift;
        my $year = (localtime)[5] + 1900;

        $years_now = $years_old ? $years_old : $year - $self->birth_year;
        return $years_now;
    }

    sub module_loaded {
        (my $modname = shift) =~ s!::!/!g;
        return exists $INC{ $modname . '.pm' };
    }



}
1;