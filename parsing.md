# Parsing 

Doing shit like this
``` 
Main> number "23"
23
Main> number "apa"
?
Main> number "17+23"
? 
```

``` Haskell
type Parser a = String -> Maybe (a, String)
```

```
Main> number "23"
Just (23, "")

Main> number "117junk"
Just (17, "junk")

Main> number "apa"
Nothing


```