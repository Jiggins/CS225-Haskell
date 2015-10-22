# CS225 - Assignment 1

## Exercise 1
Implement the following functions functions:

```haskell
-- | takeWhile, applied to a predicate p and a list xs, returns the
--   longest prefix (possibly empty) of xs of elements that satisfy
takeWhile :: (a -> Bool) -> [a] -> [a]

-- | filter
filter :: (a -> Bool) -> [a] -> [a]

-- | gcd is the non-negative factor of both x and y of which
-- every common factor of x and y is also a factor; for example
-- 'gcd' 4 2 = 2, 'gcd' (-4) 6 = 2, 'gcd' 0 4 = 4. 'gcd' 0 0 = 0.
gcd :: (Integral a) => a -> a -> a

-- | Left-associative fold
foldl :: (b -> a -> b) -> b -> [a] -> b

-- | Right-associative fold
foldr :: (a -> b -> b) -> b -> [a] -> b

-- | Sort a list
sort :: Ord a => [a] -> [a]
```

### Exercise 2 - Haskell without the Haskell
It is possible to write the quicksort algorithm in Haskell without using any of
the standard library functions, including `<=`, `>` and even `.`.  Reimplement
all of the functions, classes and instances needed for `takeWhile`, `filter`,
`foldl`, `foldr` and `sort.`

```haskell
-- This Language Pragma prevents any of the standard library functions from
-- being imported.
{-# LANGUAGE NoImplicitPrelude #-}

module NoPrelude where

import GHC.Types (Char)
import System.IO (putStrLn)

-- For full marks comment out the following imports
import GHC.Classes (Ord  (..))
import GHC.Show    (Show (..))
import GHC.Types   (Bool, Ordering)


takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile = undefined

filter :: (a -> Bool) -> [a] -> [a]
filter = undefined

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl = undefined

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr = undefined

sort :: Ord a => [a] -> [a]
sort = undefined
```
