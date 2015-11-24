triangler n = sum [1..n]
numfacs n = length [x | x <- [1..n], n `mod` x==0]
inftriangles = map triangler [1..]
ans n = triangler (1 + (length $takeWhile (<n) $map numfacs inftriangles))

main::IO()
main = do
  putStrLn "calculating..."
  print (ans 500) 
