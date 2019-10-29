# Higher Order Functions

A **Higher Order Function** is a function that takes another function as an input

``` Haskell
    even :: Int -> Bool
    even x = x `mod` 2 == 0

    map even [1,2,3,4,5] 
     = [False, True, False, True, False]
```

The `filter` function only returns values that satisfies a condition

``` Haskell
    filter even [1 .. 5]
     = [2,4]
```

The `map` function applies the input function to every element of a list
* The `(a -> b)` in the definition denotes a function
* The `f x` means apply the function to x 
``` Haskell 
    map :: (a -> b) -> [a] -> [b]
    map f [] = []
    map f (x:xs) = f x : map f xs

    map square [1,2,3]
     = [1,4,9]
```

# **What the fuck is foldr**