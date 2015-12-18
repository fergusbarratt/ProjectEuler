
ans = reverse $ take 10 $ reverse $ show $ sum [x^x | x <- [1..1000]]

main::IO()
main = print ans
