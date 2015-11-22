let ans = maximum [x | x<- [y*y'|y<-[100..999], y'<-[100..999]], (reverse(show x))==(show x)]
main::IO()
main = putStrLn (show ans)
