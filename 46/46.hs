import Data.Numbers.Primes
import Data.List

squares n = [x^2 | x <- [1..n]]
primes' n = take n primes

goldbachs n = [prime + 2 * square | square <- squares n , prime <- primes' n]

isComposite x = odd x && not (isPrime x)

composites n = filter isComposite [2..n]

main::IO()
main = print $ find (\x -> not $ x `elem` (goldbachs 1000)) $ composites 10000
