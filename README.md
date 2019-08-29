[![Build Status](https://travis-ci.org/Kaiepi/p6-Symbol.svg?branch=master)](https://travis-ci.org/Kaiepi/p6-Symbol)

NAME
====

Symbol - Port of JavaScript's Symbol primitive type

SYNOPSIS
========

```perl6
use Symbol;

say Symbol('ayy lmao');                                # OUTPUT: Symbol('ayy lmao')
say Symbol('ayy lmao')     =:= Symbol('ayy lmao');     # OUTPUT: False
say Symbol.for('ayy lmao') =:= Symbol.for('ayy lmao'); # OUTPUT: True
```

DESCRIPTION
===========

Symbol is a port of JavaScript's Symbol primitive type. This implements creating Symbol instances, but not the behaviour of well-defined symbols.

Symbol's purpose is to provide a way to create objects that are guaranteed to be unique. Optionally, they can be provided with a description, which is mainly used when stringifying them.

ATTRIBUTES
==========

  * Str **$.description**

The description of the symbol. This is the string passed to `Symbol.CALL-ME` or `Symbol.for`.

METHODS
=======

  * method **CALL-ME**(Symbol:U: Str *$description*? --> Symbol:D)

Creates a new symbol given `$description`.

Though its signature states that the description is optional, `Symbol()` does not create a symbol with no description; that actually ends up being a type coercion. To create a symbol with no description, use `Symbol(Nil)`.

  * method **for**(Symbol:U: Str *$description*? --> Symbol:D)

If no symbol instantiated using `Symbol.for` already exists, creates a new symbol given `$description`, otherwise returns the one that already exists.

  * method **gist**(Symbol:D: --> Str:D)

Stringifies the symbol like in Javascript.

  * method **Str**(Symbol:D: --> Str:D)

Stringifies the symbol like in Javascript.

  * method **perl**(Symbol:D: --> Str:D0

Stringifies the symbol like in Javascript.

AUTHOR
======

Ben Davies (Kaiepi)

COPYRIGHT AND LICENSE
=====================

Copyright 2019 Ben Davies

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

