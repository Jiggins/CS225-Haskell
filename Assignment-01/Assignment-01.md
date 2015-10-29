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

## Exercise 2 - Haskell without the Haskell
It is possible to write the quicksort algorithm in Haskell without using any of
the standard library functions, including `<=`, `>` and even `.`.  Reimplement
all of the functions, classes and instances needed for `takeWhile`, `filter`,
`foldl`, `foldr` and `sort.`

Submit to [Jack.Higgins@nuim.ie](:mailto:jack.higgins@nuim.ie) by Wednesday 4th
November 8pm.

If you cant get something to work, comment out the code causing the problem and
leave a comment to explain what you were trying to do. Marks will be awarded
for getting close to the answering so don't worry about code not compiling.

If you have any questions please email me and I will get back to you as soon as
I can. (_In Reality_; one or two days)

```haskell
-- This Language Pragma prevents any of the standard library functions from
-- being imported.
{-# LANGUAGE NoImplicitPrelude #-}

module NoPrelude where

import GHC.Types (Char)
import System.IO (IO (..), putStrLn)

-- For full marks comment out the following imports
import GHC.Classes (Ord  (..))
import GHC.Show    (Show (..))
import GHC.Types   (Bool, Ordering)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday

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

### Testing the code
The easiest way to test your code is to use `GHCi`. `GHCi` has a few features
that will help you out.

1. Load a file in `GHCi` - `ghci -i NoPrelude.hs` or `:load <file>` while in `ghci`  
   This will load all of the functions and data types into `GHCi`.

2. Reload in `GHCi` - `:reload` or `:r`  
   Reloads all modules in GHCi, useful when developing modules.

   ```haskell
   Jack@Jacks-MacBook-Pro ~/g/Haskell> ghci -i NoPrelude.hs
   GHCi, version 7.10.2: http://www.haskell.org/ghc/  :? for help
   [1 of 1] Compiling NoPrelude        ( NoPrelude.hs, interpreted )
   Ok, modules loaded: NoPrelude.

   *NoPrelude> :r
   Ok, modules loaded: NoPrelude.

   *NoPrelude>
   ```

3. Get the type of a function - `:type` or `:t <Some Haskell Expression>`
   Useful for getting the type of a function. **Note:** It can infer the type
   of an expression in Haskell, not just a function. Below is an example of how
   the type of `foldl` changes as more parameters are used.

   ```haskell
   Prelude> :t foldl
   foldl :: (b -> a -> b) -> b -> [a] -> b

   Prelude> :t foldl (+)
   foldl (+) :: Num a => a -> [a] -> a

   Prelude> :t foldl (+) 0
   foldl (+) 0 :: Num a => [a] -> a

   Prelude> :t foldl (+) 0 [1, 2, 3, 4]
   foldl (+) 0 [1, 2, 3, 4] :: Num a => a

   ```

4. Get info - `:info` or `:i`  
   Display information about the given expression. This is similar to `:type`
   but gives additional information.
   - Definition and Instances of _Type Classes_
   - Where the function is defined

   ```haskell
   Prelude> :i head
   head :: [a] -> a        -- Defined in ‘GHC.List’

   Prelude> :i tail
   tail :: [a] -> [a]      -- Defined in ‘GHC.List’

   Prelude> :i Num
   class Num a where
     (+) :: a -> a -> a
     (-) :: a -> a -> a
     (*) :: a -> a -> a
     negate :: a -> a
     abs :: a -> a
     signum :: a -> a
     fromInteger :: Integer -> a
     -- Defined in ‘GHC.Num’
     instance Num Word -- Defined in ‘GHC.Num’
     instance Num Integer -- Defined in ‘GHC.Num’
     instance Num Int -- Defined in ‘GHC.Num’
     instance Num Float -- Defined in ‘GHC.Float’
     instance Num Double -- Defined in ‘GHC.Float’

   ```

5. `GHCi` help - `:help` - for everything `GHCi` can do that I haven't told you
   about.
