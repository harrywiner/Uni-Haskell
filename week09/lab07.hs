data Expr = Num Int
        | Add Expr Expr
        | Mult Expr Expr
        | Sub Expr Expr
        | Div Expr Expr


eval :: Expr -> Int
eval (Num x) = x
eval (Add a b) = eval a + eval b
eval (Mult a b) = eval a * eval b
eval (Sub a b) = eval a - eval b
eval (Div a b) = div (eval a) (eval b)

showExpr :: Expr -> String
showExpr (Num n) = show n
showExpr (Add a b) = showExpr a ++ "+" ++ showExpr b
showExpr (Sub a b) = showExpr a ++ "-" ++ showExpr b
showExpr (Mult a b) = showExpr a ++ "*" ++ showExpr b
showExpr (Div a b) = showExpr a ++ "/" ++ showExpr b

size :: Expr -> Int
size (Num a) = 0
size (Add a b) = size a + size b + 1
size (Sub a b) = size a + size b + 1
size (Mult a b) = size a + size b + 1
size (Div a b) = size a + size b + 1


data Tree a = Leaf a
            | Split (Tree a) (Tree a)
        deriving Eq

collapse :: Tree Int -> [Int]
collapse (Leaf a) = a : []
collapse (Split (a) (b)) = collapse (a) ++ collapse (b)

mirror :: Tree a -> Tree a
mirror (Leaf a) = (Leaf a)
mirror (Split (a) (b)) = (Split (mirror b) (mirror a))

