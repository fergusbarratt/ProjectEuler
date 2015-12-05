factorial n = product [1..n]
intReader a = read a::Int 
digitSum a = sum $ map intReader $ map (:[]) $ show a

main::IO()
main = do
    print $ digitSum $ factorial 100
