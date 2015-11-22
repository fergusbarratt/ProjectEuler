import Data.Numbers.Primes
ans = maximum (primeFactors 600851475143)
main :: IO()
main = putStrLn (show ans)

