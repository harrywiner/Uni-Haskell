import Test.QuickCheck
data Expr = Num Int
          | Add Expr Expr
          | Mult Expr Expr
          | Div Expr Expr
          | Sub Expr Expr

size :: Expr -> Int
size (Num a) = 1
size (Mult a b) = 2 + size a + size b
size (Add a b) = 2 + size a + size b
size (Sub a b) = 2 + size a + size b
size (Div a b) = 2 + size a + size b

eval :: Expr -> Int
eval (Num a) = a
eval (Mult a b) = (eval a) * (eval b)
eval (Add a b) = (eval a) + (eval b)
eval (Sub a b) = (eval a) - (eval b)
eval (Div a b) = div (eval a) (eval b)

showExpr :: Expr -> String
showExpr (Num x) = show 3
showExpr (Mult a b) = showExpr a ++ "x" ++ showExpr b
showExpr (Add a b) = showExpr a ++ "+" ++ showExpr b
showExpr (Sub a b) = showExpr a ++ "-" ++ showExpr b
showExpr (Div a b) = showExpr a ++ "÷" ++ showExpr b

data Tree a = Leaf a
            | Split (Tree a) (Tree a)
    deriving Eq



collapse :: Tree Int -> [Int]
collapse (Leaf a) = [a]
collapse (Split m n) = (collapse m) ++ (collapse n)


mirror :: Tree a -> Tree a
mirror (Split l r) = Split (mirror r) (mirror l)
mirror t = t

foldTree :: (a -> b) -> (b -> b -> b) -> Tree a -> b
foldTree f g (Leaf l) = f l
foldTree f g (Split l r) = g(foldTree f g l) (foldTree f g r)

collapse' :: Tree Int -> [Int]
collapse' t = foldTree (\x -> [x]) (++) t



prop_Thing t = 
    t == mirror (mirror t)

prop_Second t = 
    collapse (mirror t) == reverse (collapse t)