use v6.d;
use Symbol;
use Test;

plan 8;

my Str $description = "if two astronauts were on the moon and one bashed the other's head in with a rock would that be fucked up or what?";

lives-ok { Symbol($description) }, 'can create symbols with Symbol.CALL-ME';
lives-ok { Symbol.for($description) }, 'can create symbols with Symbol.for';
lives-ok {
    my Symbol $symbol = Symbol($description);
}, 'symbol instances are of type Symbol';

cmp-ok Symbol($description), &[!=:=], Symbol($description),
       'symbols with the same description created with Symbol.CALL-ME are unique';
cmp-ok Symbol.for($description), &[=:=], Symbol.for($description),
       'symbols with the same description created with Symbol.for are unique';

{
    my Symbol $symbol      = Symbol($description);
    my Str    $stringified = "Symbol($description)";
    is $symbol.gist, $stringified,
       'Symbol.gist stringifies symbols like in Javascript';
    is $symbol.Str, $stringified,
       'Symbol.Str stringifies symbols like in Javascript';
    is $symbol.perl, $stringified,
       'Symbol.perl stringifies symbols like in Javascript';
}

# vim: ft=perl6 ts=4 sts=4 sw=4
