let trips = [(a, b, c) | a <- [1..1000], b <- [1..1000], c <- [1..1000], a^2+b^2==c^2]
let trip = filter (\(a, b, c) -> a+b+c==1000) trips
let ans = trip !! 1 * trip !! 2 * trip !! 3
