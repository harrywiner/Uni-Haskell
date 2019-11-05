# Type Classes

## Type Synonyms

* An alternate name for an existing type 
``` Haskell
    type Name = String

    -- These now do the same thing
    function :: String -> String
    
    function :: Name -> Name
``` 
## Newtypes

* Similar to the Type Synonyms but instead the `Newtype` **becomes** the type its defined as

``` Haskell
    newtype Temperature = Temperature Int
```
* Makes a new constructor called Temperature that takes type `int`

## Type Classes

Consider the function show
``` Haskell
    show True = "True"
    show 5 = "5"
    show (Just 3) = "Just 3"
```

One might think the type definition is 

``` Haskell
    show :: a -> String
``` 
But it cannot take functions 