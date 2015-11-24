import Data.Matrix

test n = matrix n n $ \(i, j) -> i+j

--helper functions
indexList mat = [(i, j) | i <- [1..nrows mat], j<-[1..ncols mat]]

--adjfuns
rightOf (i, j) (k, l) = ((i-k) == -1) && (j==l)
leftOf (i, j) (k, l) = ((i-k) == 1) && (j==l)

above (i, j) (k, l) = ((j-l) == 1) && (i==k)
below (i, j) (k, l) = ((j-l) == -1) && (i==k)

diagUpRightFrom (i, j) (k, l) = (abs (i-k)) == (abs $ j-l) && ((i-k)== -1) && ((j-l)==1)
diagUpLeftFrom (i, j) (k, l) = (abs (i-k)) == (abs $ j-l) && ((i-k)== 1)
 && ((j-l)==1)
diagDownRightFrom (i, j) (k, l) = (abs (i-k)) == (abs $ j-l) && ((i-k)== -1) && ((j-l)== -1)
diagDownLeftFrom (i, j) (k, l) = (abs (i-k)) == (abs $ j-l) && ((i-k)== 1) && ((j-l)== -1)

diagUpFrom (i, j) (k, l) = diagUpLeftFrom (i, j) (k, l) || diagUpRightFrom (i, j) (k, l)
diagDownFrom (i, j) (k, l) = diagDownLeftFrom (i, j) (k, l) || diagDownRightFrom (i, j) (k, l)

nextTo (i, j) (k, l) = rightOf (i, j) (k, l) || leftOf (i, j) (k, l)
aboveOrBelow (i, j) (k, l) = above (i, j) (k, l) || below (i, j) (k, l)
diagAdjTo (i, j) (k, l) = diagUpFrom (i, j) (k, l) || diagDownFrom (i, j) (k, l)

adjTo:: (Int, Int)->(Int, Int)->Bool
adjTo (i, j) (k, l)
  | nextTo (i, j) (k, l) = True
  | aboveOrBelow (i, j) (k, l)= True
  | diagAdjTo (i, j) (k, l)= True
  | otherwise = False

-- single element function
element adjFun (i, j) mat = map (\(i, j)->getElem i j mat) $ index adjFun(i, j) mat
index adjFun (i, j) mat = filter (adjFun (i, j)) $ indexList mat

--multiple element function
elements adjFun (i, j) mat
  | (element adjFun (i, j) mat) == [] = []
elements adjFun (i, j) mat = (element adjFun (i, j) mat)++(elements adjFun (head $(index adjFun (i, j) mat)) mat)

--nelems adj
nelements n adjFun (i, j) mat
  | (length $take n $elements adjFun (i, j) mat) < 4 = []
  | otherwise  = take n $elements adjFun (i, j) mat

main::IO()
main =
  putStrLn $foldr (++) "" $map show $ elements rightOf (1, 1) $test 8
  -- putStrLn $ show (nelems 4 diagDownFrom (1, 1) test)
  --putStrLn $ show maximum $ map sum $ listsOfnElems 4 adjTo $ matFromFile("mat.txt"))
