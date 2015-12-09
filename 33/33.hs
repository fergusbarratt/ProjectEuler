import Data.List
data Fraction = Fraction Int Int

instance Eq Fraction where 
  -- Fraction 0 _ == Fraction c _ = c == 0
  -- Fraction a _ == Fraction 0 _ = a == 0
  -- Fraction _ 0 == Fraction _ 0 = False
  Fraction a b == Fraction c d = a' / b' == c' / d'
    where a' = fromIntegral a 
          b' = fromIntegral b
          c' = fromIntegral c
          d' = fromIntegral d

instance Show Fraction where 
  show (Fraction 0 1) = "0"
  show (Fraction 1 1) = "1"
  show (Fraction a b) = show a ++ "/" ++ show b

naiveReduce :: Fraction -> Fraction
naiveReduce (Fraction a b) 
  | gcd a b `mod` 10 == 0 = Fraction 0 1
  | show a == show b = Fraction 0 1
  | show a == reverse (show b) = Fraction 0 1
  | intersect (show a) (show b) /= [] = Fraction (read (show a \\ show b)) (read (show b \\ show a))
  | otherwise = Fraction 0 1 

reduce :: Fraction -> Fraction
reduce (Fraction a b) = Fraction (truncate (a' / abgcd)) (truncate (b' / abgcd))
  where abgcd = fromIntegral $ gcd a b
        a' = fromIntegral a
        b' = fromIntegral b

fractionProduct :: Fraction -> Fraction -> Fraction
fractionProduct (Fraction a b) (Fraction c d) = Fraction (a*c) (b*d)

twoDigitFractions = [Fraction a b | a <- [10..99] , b <- [10..99], a < b]
someFraction = take 200 twoDigitFractions
anss = filter (\x -> naiveReduce x == reduce x) twoDigitFractions
ans = reduce $ foldl fractionProduct (Fraction 1 1) anss

main :: IO()
main = do 
  print ans

