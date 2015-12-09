import Data.List

propDivs::Int -> [Int]
propDivs num = filter (\x -> num `mod` x == 0) [1..num-1]

isPerfect:: Int -> String
isPerfect n
  | sum (propDivs n) == n = "perfect"
  | sum (propDivs n) > n = "abundant"
  | sum (propDivs n) < n = "deficient"
  | otherwise = "none"

abundants::Int -> Int -> [Int]
abundants down up = filter (\x -> isPerfect x == "abundant") [down..up]

main::IO()
main = do
  print $ isPerfect 28
  print $ sum $ [24..2813] \\ [x + y | x <- abundants 24 2813, y <- abundants 24 2813] 
  -- print $ sum $ [24..28123] \\ abundants 24 28123

