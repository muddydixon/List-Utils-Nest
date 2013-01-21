use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'List::Utils::Nest',
    AUTHOR              => q{Muddy Dixon <muddydixon@gmail.com>},
    VERSION_FROM        => 'lib/List/Utils/Nest.pm',
    ABSTRACT_FROM       => 'lib/List/Utils/Nest.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'List-Utils-Nest-*' },
);
