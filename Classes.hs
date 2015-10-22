module Classes where

-- data Bool = False | True
--   deriving (Eq, Ord, Enum, Bounded, Read)
--
-- instance Show Bool where
--   show True = "true"
--   show _ = "False"

data Complex a = Complex a a
  deriving (Eq, Ord, Bounded, Read)

instance (Num a) => Num (Complex a) where
  (Complex a b) + (Complex a' b') = Complex (a + a') (b + b')
  (Complex a b) * (Complex a' b') = Complex (a * a' - b * b') (a * b' + b * a')
  negate (Complex a b) = Complex (-a) (-b)
  abs = undefined
  signum = undefined
  fromInteger = undefined

instance Show a => Show (Complex a) where
  show (Complex a b) = show a ++ " + " ++ show b ++ "i"
