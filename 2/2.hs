let ans = sum (takeWhile (<4000000) [x | x<-fibs, x `mod` 2==0])

