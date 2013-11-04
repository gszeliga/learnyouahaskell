addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

factorial :: Integer -> Integer  
factorial n = product [1..n]

{-

ghci> :t (==)  
(==) :: (Eq a) => a -> a -> Bool

We see a new thing here, the => symbol. Everything before the => symbol is called a class constraint. We can read the previous type declaration like this: the equality function takes any two values that are of the same type and returns a Bool. The type of those two values must be a member of the Eq class (this was the class constraint).

*Main> :t (elem)
(elem) :: Eq a => a -> [a] -> Bool

The elem function has a type of (Eq a) => a -> [a] -> Bool because it uses == over a list to check whether some value we're looking for is in it.

Some type classes are:

** Eq is used for types that support equality testing. The functions its members implement are == and /=. So if there's an Eq class constraint for a type variable in a function, it uses == or /= somewhere inside its definition

** Ord is for types that have an ordering.

ghci> :t (>)  
(>) :: (Ord a) => a -> a -> Bool

All the types we covered so far except for functions are part of Ord. Ord covers all the standard comparing functions such as >, <, >= and <=. The compare function takes two Ord members of the same type and returns an ordering. Ordering is a type that can be GT, LT or EQ, meaning greater than, lesser than and equal, respectively. 

ghci> "Abrakadabra" `compare` "Zebra"  
LT

** Members of Show can be presented as strings. All types covered so far except for functions are a part of Show. The most used function that deals with the Show typeclass is show. It takes a value whose type is a member of Show and presents it to us as a string.


** Read is sort of the opposite typeclass of Show. The read function takes a string and returns a type which is a member of Read.

ghci> read "True" || False  
True  
ghci> read "8.2" + 3.8  
12.0  
ghci> read "5" - 2  
3  
ghci> read "[1,2,3,4]" ++ [3]  
[1,2,3,4,3]

But what happens if we try to do just read "4". Fails because it cannot infer the type that we want from it, that's why we need to use explicit type annotations

ghci> read "5" :: Int  
5




-}

