# Functions, Lists, Pattern Matching and Recursion

## Functions
Functions are defined at the top level.  Haskell uses spaces to separate
function parameters rather than brackets.

```haskell
addOne x = x + 1
```

This function will return a number (x + 1) given any input x.

The basic function syntax is defined in
[**Learn You a Haskell for Great Good! - Baby's first functions**](http://learnyouahaskell.com/starting-out#babys-first-functions).

### Prefix and Infix functions
Haskell uses a mixture of prefix and infix notation in its syntax. All
functions use prefix notation unless the function name is comprised of only
special characters -
`!` `#` `$` `%` `&` `*` `+` `.` `/` `<` `=` `>` `?` `@` `^` `|` `-` `~` `:` 

#### Using prefix functions as infix
Surrounding a function in back ticks `\`` will allow it to be used as an infix
operator. For example, for all {x,y}:

```haskell
mod x y == x `mod` y

div x y == x `div` y

add :: Num a => a -> a -> a
add x y = x + y

add x y == x `add` y

```

#### Using infix functions as prefix
Similarity, Surrounding an infix function in brackets `()` will allow it to be
used as a prefix function. For example, for all {x,y}

```haskell
x + y == (+) x y

x / y == (/) x y

-- | List Concatenation
(++) :: [a] -> [a] -> [a]
(++) []     ys = ys
(++) (x:xs) ys = x : xs ++ ys
```

### Haskell Lexical Structure
A full lexical structure can be found in the Haskell2010 Report -
https://www.haskell.org/onlinereport/haskell2010/haskellch2.html#x7-180002.4

## Lists
In Haskell, lists are a homogeneous data structure. It stores several elements
of the same type. Lists are denoted with square brackets `[]` with comma
separated values.

```haskell
xs = [1,2,3]
```

**Note:** Many Haskell programmers use the variable names `xs` and `ys` to
denote lists. As with all variable names, they can be called anything*. The
name `xs` can be read as 'the plural of x'.

*almost anything, variables must begin with a lower case letter.

### List definition in [Haskell Source Code][Source]
```haskell
data [] a = [] | a : [a]
```

[Source]: https://downloads.haskell.org/~ghc/7.0.4/docs/html/libraries/ghc-prim-0.2.0.0/src/GHC-Types.html#Char

### Splat! - More Syntactic Sugar


## Pattern Matching
Haskell will treat multiple functions with the same name as different patterns
for a function to follow.  If we know a definite answer for a given input, we
can define a pattern for it.  For example if we try to divide by 0 we should get
an error.  The function below defines the inverse function, `λ x -> 1 / x`, for
any given number `x` the function should return `1 / x`, unless `x == 0`.

```haskell
inverse 0 = error "Divide by zero"
inverse x = 1 / x
```

Patterns matching can be done over multiple lines. In the following example we
define `zipWith`. `zipWith` is a function that takes two lists and joins them
with a function.

```haskell
zipWith (+) [1,2,3] [2,4,6] = (1 + 2) : (2 + 4) : (3 + 6) : []
                            =  3 : 6 : 9 : []
                            = [3, 6, 9]
```

##### `zipWith` definition
```haskell
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ [] _          = []
zipWith _ _ []          = []
zipWith f (x:xs) (y:ys) =  f x y : zipWith xs ys
```

### Guards
