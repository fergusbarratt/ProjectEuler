maximum':: (Ord a) => [a] -> a
maximum' [] = error "maximum of an empty list"
maximum' [x] = x 
maximum (x:xs)
  | x>maxTail = x
  | otherwise = maxTail
  where maxTail = maximum' xs

chunk:: Int -> [a] -> [[a]]
chunk 0 xs = [xs]
chunk n [] = [[]]
chunk n (x:xs) 
  | length xs >= n = (take n (x:xs)):chunkedTail
  | otherwise  = [xs]++
  where chunkedTail = chunk n xs

main::IO()
main = putStrLn ((chunk 2 "hello")!!3)
