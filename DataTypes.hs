module DataTypes where

import Data.Function

-- | Data type describing the days of the week
data Day = Mon | Tue | Wed | Thurs | Fri | Sat | Sun
  deriving (Eq, Enum, Ord, Read)

instance Show Day where
  show Mon   = "Monday"
  show Tue   = "Tuesday"
  show Wed   = "Wednesday"
  show Thurs = "Thursday"
  show Fri   = "Friday"
  show Sat   = "Saturday"
  show Sun   = "Sunday"

main' = do
  print Mon          -- Prints "Monday"
  print [Tue .. Sat] -- Prints [Tuesday,Wednesday,Thursday,Friday,Saturday]
  print $ Mon == Tue -- Prints False
  print $ Mon >= Tue -- Prints False

--------------------------------------------------------------------------------


data ComplexInt = ComplexInt { realI :: Int
                             , imagI :: Int
                             } deriving (Eq)

instance Show ComplexInt where
  show c = show (realI c) ++ " + " ++ show (imagI c) ++ "i"

instance Num ComplexInt where
  a + b    = ComplexInt (realI a + realI b) (imagI a + imagI b)
  (ComplexInt x y) * (ComplexInt u v) = ComplexInt (x * u - y * v) (x * v + y * u)
  abs c    = ComplexInt (abs $ realI c) (abs $ imagI c)
  negate c = ComplexInt (negate $ realI c) (negate $ imagI c)
  signum c = ComplexInt (signum $ realI c) (signum $ imagI c)
  fromInteger n = ComplexInt (fromIntegral n) 0

cmapInt :: (Int -> Int) -> ComplexInt -> ComplexInt
cmapInt f c = ComplexInt (f $ realI c) (f $ imagI c)

main'' = print $ ComplexInt 1 2


--------------------------------------------------------------------------------

data Complex a = Complex { real :: a
                         , imag :: a
                     } deriving (Eq)

instance Show a => Show (Complex a) where
  show c = show (real c) ++ " + " ++ show (imag c) ++ "i"

instance Num a => Num (Complex a) where
  a + b  = Complex (real a + real b) (imag a + imag b)
  (Complex x y) * (Complex u v) = Complex (x * u - y * v) (x * v + y * u)
  abs    = fmap abs       -- Identical to the Num Instance above but
  negate = fmap negate    -- uses the fmap function below to clean the code.
  signum = fmap signum
  fromInteger n = fromInteger n +: 0

instance Functor Complex where
  fmap f c = Complex (f $ real c) (f $ imag c)

-- | Infix constructor operator
(+:) :: a -> a -> Complex a
infix 6 +:
r +: i = Complex r i

main = print $ (1 +: 2) + (2 +: 1)
