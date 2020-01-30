# Typeclasses

## (=>) Notation
> `show :: Show a => a -> String`

* if a belongs to the `Show` family, then the function has the type a -> String\
-> Used because show :: a -> String is not defined for certain types (eg. functions)

## Instance 

``` Haskell 
    data Greeting = Hello | Goodbye

    instance Show Greeting where
        show Hello = "How are you doing"
        show Goodbye = "See you later!"
```

* Creates an instance of the Show class, allowing for strings to be returned when used 

## Deriving 

``` Haskell
    data Name = Harry | Elif | Seth
        deriving Show
```

* `deriving Show` tells the Haskell compiler to make Show instances for us
* Typing `Harry` into ghc yields `Harry` as output
* Derive multiple classes with `deriving (Show, _)`

## Equality

``` Haskell 
    instance Eq Greeting where
        Hello == Hello = True
        Goodbye == Goodbye = True
        _ == _ = False
```

* Allows for the == operator to be used with data types

* Can be derived with `deriving Eq`

## Ord

