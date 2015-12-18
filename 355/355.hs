import Data.Numbers.Primes
import Data.List
import Data.Choose

isCoprime :: Int -> Int -> Bool
isCoprime m n = null $ intersect (primeFactors m) (primeFactors n)

listIsCoprime :: [Int] -> Bool
listIsCoprime [] = True
listIsCoprime [_] = True
listIsCoprime (m:ms)


allCoprimeTo :: Int -> Int -> [Int]
allCoprimeTo n m = nub $ filter (isCoprime m) [1..n]

-- reducedCoprimes :: [Int]->[Int]
-- reducedCoprimes n = filter listIsCoprime $ elems (listChoose 2 )

co :: Int -> [[Int]]
co n = map (allCoprimeTo n) [1..n]

main::IO()
main = 
  -- print $ isCoprime 8 10
  -- print $ listIsC
  print $ co 30
  -- print $ co 100


