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

* Similar to the Type Synonyms but instead the `newtype` **becomes** the type its defined as

``` Haskell
    newtype Temperature = Temperature Int
```
* Makes a new constructor called Temperature that takes type `int`

## Class

Consider the function show
``` Haskell
    show True = "True"
    show 5 = "5"
    show (Just 3) = "Just 3"
```

One might think the type definition is 

``` Haskell
    show :: a -> String 
    -- Does not work because show can't print functions
``` 

We can fix this using `type classes`

``` Haskell
    class Show a where 
        show :: a -> String
```

## Instances

Our class definition gives it the types of its functions but not their implementations
* We can give it functionality by creating an `instance`

``` Haskell
    instance Show Bool where
    show True  = "True"
    show False = "False"
```

## Deriving

Haskell has `Show` built in, but we can `derive` it to use in our functions

``` Haskell
    data suit =     Spades | Clubs 
                  | Hearts | Diamonds
        deriving Show
        -- Tells Haskell to create the correct instance for us 
```


