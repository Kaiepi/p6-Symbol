use v6.d;
unit class Symbol:auth<github:Kaiepi>:ver<0.0.1>;

has Str $.description;

# Intentionally allows the description to be undefined as per the ECMAScript
# 2018 spec.
method CALL-ME(Symbol:U: Str $description? --> Symbol:D) {
    $?CLASS.new: :$description
}

# Intentionally allows the description to be undefined as per the ECMAScript
# 2018 spec.
my ::?CLASS %for{Str};
method for(Symbol:U: Str $description? --> Symbol:D) {
    if %for{$description}:exists {
        %for{$description}
    } else {
        my ::?CLASS $symbol .= new: :$description;
        %for{$description} := $symbol;
        $symbol
    }
}

method !stringify(Symbol:D: --> Str:D) {
    $!description.defined
        ?? "Symbol($!description)"
        !! "Symbol()"
}
multi method gist(Symbol:D: --> Str:D) {
    self!stringify
}
multi method Str(Symbol:D: --> Str:D) {
    self!stringify
}
multi method perl(Symbol:D: --> Str:D) {
    self!stringify
}

=begin pod

=head1 NAME

Symbol - Port of JavaScript's Symbol primitive type

=head1 SYNOPSIS

=begin code :lang<perl6>
use Symbol;

say Symbol('ayy lmao');                                # OUTPUT: Symbol('ayy lmao')
say Symbol('ayy lmao')     =:= Symbol('ayy lmao');     # OUTPUT: False
say Symbol.for('ayy lmao') =:= Symbol.for('ayy lmao'); # OUTPUT: True
=end code

=head1 DESCRIPTION

Symbol is a port of JavaScript's Symbol primitive type. This implements
creating Symbol instances, but not the behaviour of well-defined symbols.

Symbol's purpose is to provide a way to create objects that are guaranteed to
be unique. Optionally, they can be provided with a description, which is mainly
used when stringifying them.

=head1 ATTRIBUTES

=item Str B<$.description>

The description of the symbol. This is the string passed to C<Symbol.CALL-ME>
or C<Symbol.for>.

=head1 METHODS

=item method B<CALL-ME>(Symbol:U: Str I<$description>? --> Symbol:D)

Creates a new symbol given C<$description>.

Though its signature states that the description is optional, C<Symbol()> does
not create a symbol with no description; that actually ends up being a type
coercion. To create a symbol with no description, use C<Symbol(Nil)>.

=item method B<for>(Symbol:U: Str I<$description>? --> Symbol:D)

If no symbol instantiated using C<Symbol.for> already exists, creates a new
symbol given C<$description>, otherwise returns the one that already exists.

=item method B<gist>(Symbol:D: --> Str:D)

Stringifies the symbol like in Javascript.

=item method B<Str>(Symbol:D: --> Str:D)

Stringifies the symbol like in Javascript.

=item method B<perl>(Symbol:D: --> Str:D0

Stringifies the symbol like in Javascript.

=head1 AUTHOR

Ben Davies (Kaiepi)

=head1 COPYRIGHT AND LICENSE

Copyright 2019 Ben Davies

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
