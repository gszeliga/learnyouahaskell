doubleMe x = x + x

doubleUs x y = x*2 + y*2

--We usually use ' to either denote a strict version of a function (one that isn't lazy) or a slightly modified version of a function or a variable
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

--internally, Haskell has to walk through the whole list on the left side of ++. That's not a problem when dealing with lists that aren't too big
--let concat_with[1,2,3,4] ++ [9,10,11,12]

--However, putting something at the beginning of a list using the : operator (also called the cons operator) is instantaneous
--'A':" SMALL CAT"

--If you want to get an element out of a list by index, use !!. The indices start at 0.
--"Steve Buscemi" !! 6

--head [5,4,3,2,1]
--tail [5,4,3,2,1]
--last [5,4,3,2,1] 

--init takes a list and returns everything except its last element.
--init [5,4,3,2,1]

--null checks if a list is empty
--null [1,2,3] 

--take 3 [5,4,3,2,1]
--reverse [5,4,3,2,1]
--drop 3 [8,4,2,1,5,6] 

--elem takes a thing and a list of things and tells us if that thing is an element of the list. It's usually called as an infix function because it's easier to read that way.
--4 `elem` [3,4,5,6]

-- =========== Ranges ===========================

{-
[1..20]
['a'..'z']
[2,4..20]
[3,6..20]
[20,19..1]
take 10 (cycle [1,2,3])
take 10 (repeat 5)
-}

-- ========== Comprehensions ======================

{-
[ x | x <- [50..100], x `mod` 7 == 3]
[ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
[ x | x <- [10..20], x /= 13, x /= 15, x /= 19]

When drawing from several lists, comprehensions produce all combinations of the given lists and then join them by the output function we supply. A list produced by a comprehension that draws from two lists of length 4 will have a length of 16, provided we don't filter them

[ x*y | x <- [2,5,10], y <- [8,10,11]]


_ means that we don't care what we'll draw from the list anyway so instead of writing a variable name that we'll never use, we just write _. This function replaces every element of a list with 1 and then sums that up

length' xs = sum [1 | _ <- xs]

Nested list comprehensions are also possible if you're operating on lists that contain lists. A list contains several lists of numbers. Let's remove all odd numbers without flattening the list.

ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]  
ghci> [ [ x | x <- xs, even x ] | xs <- xxs]  
[[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]

-}

-- =================== Tuples ==========================

{-
fst takes a pair and returns its first component.

fst (8,11)

snd takes a pair and returns its second component. Surprise!

snd (8,11)

A cool function that produces a list of pairs: zip

zip [1,2,3,4,5] [5,5,5,5,5]
zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]

The longer list simply gets cut off to match the length of the shorter one. Because Haskell is lazy, we can zip finite lists with infinite lists:

zip [1..] ["apple", "orange", "cherry", "mango"]

-}
