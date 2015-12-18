import qualified Data.Set as Set

b = [1, 3, 6, 8, 10, 11]
subsets = [[p, q, r] | p <- b, q <- b, r <- b, p/=q && q/=r && p/=r]
sumsubsets = map sum subsets
main = print sumsubsets
