let ans = head [x | x<-[1..], (foldr (+) 0 (map (mod x) [1..10]))==0]
