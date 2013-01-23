#!perl -T

use Test::More;
use Data::Dumper;
use List::Utils::Nest;

my $sample = [
    {userid => 3, itemid => 1, quantity => 3},
    {userid => 3, itemid => 4, quantity => 3},
    {userid => 4, itemid => 2, quantity => 3},
    {userid => 1, itemid => 1, quantity => 3},
    {userid => 1, itemid => 2, quantity => 2},
    {userid => 1, itemid => 2, quantity => 3},
    {userid => 1, itemid => 3, quantity => 3},
    {userid => 2, itemid => 2, quantity => 3},
    {userid => 2, itemid => 4, quantity => 3},
    {userid => 2, itemid => 4, quantity => 1},
    ];

my $entries;

$entries = new List::Utils::Nest($sample)->key('userid')->entries();
is(4, scalar @{$entries});

is(1, $entries->[0]{key});
is(4, scalar @{$entries->[0]{values}});
is(2, $entries->[1]{key});
is(3, scalar @{$entries->[1]{values}});
is(3, $entries->[2]{key});
is(2, scalar @{$entries->[2]{values}});
is(4, $entries->[3]{key});
is(1, scalar @{$entries->[3]{values}});

$entries = nest($sample)->key('userid')->entries();
is(4, scalar @{$entries});

is(1, $entries->[0]{key});
is(4, scalar @{$entries->[0]{values}});
is(2, $entries->[1]{key});
is(3, scalar @{$entries->[1]{values}});
is(3, $entries->[2]{key});
is(2, scalar @{$entries->[2]{values}});
is(4, $entries->[3]{key});
is(1, scalar @{$entries->[3]{values}});

$entries = nest($sample)->key('userid', 'itemid')->entries();
is(8, scalar @{$entries});

is("1_____1", $entries->[0]{key});
is(1, scalar @{$entries->[0]{values}});
is("1_____2", $entries->[1]{key});
is(2, scalar @{$entries->[1]{values}});
is("1_____3", $entries->[2]{key});
is(1, scalar @{$entries->[2]{values}});
is("2_____2", $entries->[3]{key});
is(1, scalar @{$entries->[3]{values}});
is("2_____4", $entries->[4]{key});
is(2, scalar @{$entries->[4]{values}});
is("3_____1", $entries->[5]{key});
is(1, scalar @{$entries->[5]{values}});
is("3_____4", $entries->[6]{key});
is(1, scalar @{$entries->[6]{values}});
is("4_____2", $entries->[7]{key});
is(1, scalar @{$entries->[7]{values}});

$entries = nest($sample, delimiter => ",")->key('userid', 'itemid')->entries();
is(8, scalar @{$entries});

is("1,1", $entries->[0]{key});
is(1, scalar @{$entries->[0]{values}});
is("1,2", $entries->[1]{key});
is(2, scalar @{$entries->[1]{values}});
is("1,3", $entries->[2]{key});
is(1, scalar @{$entries->[2]{values}});
is("2,2", $entries->[3]{key});
is(1, scalar @{$entries->[3]{values}});
is("2,4", $entries->[4]{key});
is(2, scalar @{$entries->[4]{values}});
is("3,1", $entries->[5]{key});
is(1, scalar @{$entries->[5]{values}});
is("3,4", $entries->[6]{key});
is(1, scalar @{$entries->[6]{values}});
is("4,2", $entries->[7]{key});
is(1, scalar @{$entries->[7]{values}});

$entries = nest($sample)->key('userid')->key('itemid')->entries();
is(4, scalar @{$entries});

is(1, $entries->[0]{key});
is(3, scalar @{$entries->[0]{values}});
is(1, $entries->[0]{values}[0]{key});
is(1, scalar @{$entries->[0]{values}[0]{values}});
is(2, $entries->[0]{values}[1]{key});
is(2, scalar @{$entries->[0]{values}[1]{values}});
is(3, $entries->[0]{values}[2]{key});
is(1, scalar @{$entries->[0]{values}[2]{values}});

is(2, $entries->[1]{key});
is(2, scalar @{$entries->[1]{values}});
is(2, $entries->[1]{values}[0]{key});
is(1, scalar @{$entries->[1]{values}[0]{values}});
is(4, $entries->[1]{values}[1]{key});
is(2, scalar @{$entries->[1]{values}[1]{values}});

is(3, $entries->[2]{key});
is(2, scalar @{$entries->[2]{values}});
is(1, $entries->[2]{values}[0]{key});
is(1, scalar @{$entries->[2]{values}[0]{values}});

is(4, $entries->[3]{key});
is(1, scalar @{$entries->[3]{values}});
is(2, $entries->[3]{values}[0]{key});
is(1, scalar @{$entries->[3]{values}[0]{values}});

done_testing;
