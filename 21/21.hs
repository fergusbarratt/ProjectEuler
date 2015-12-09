import Data.List

propDivs::Int -> [Int]
propDivs num = filter (\x -> mod num x == 0) [1..num-1]

d:: Int -> Int
d n = sum $ propDivs n

amicable:: Int -> Int -> Bool
amicable a b = d a == b && d b == a

amPairsUnder::Int -> [(Int, Int)] 
amPairsUnder t = [(a, b) | a <- [1..t], b <- [1..t], a/=b, amicable a b]

flatTups::[(Int, Int)]-> [Int]
flatTups [] = []
flatTups [(a, b)] = [a, b]
flatTups (x:xs) = fst x:snd x:flatTups xs

allAmsUnder::Int -> [Int]
allAmsUnder x = nub $ flatTups $ amPairsUnder x

main::IO()
main = do
  print $ sum $ allAmsUnder 10000
