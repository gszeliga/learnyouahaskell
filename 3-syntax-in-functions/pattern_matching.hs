lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number you've got over there!"
lucky x = "Maybe next time pal!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial(x-1)

addVector :: (Integral a) => (a,a) -> (a,a) -> (a,a)
addVector (x1,y1) (x2,y2) = (x1 + x2, y1+y2)

first :: (Integral a) => (a,a,a) -> a
first (x,_,_) = x

second :: (Integral a) => (a,a,a) -> a
second (_,x,_) = x

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, you fool!"
head' (h:_) = h 

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:tail) = 1 + length' tail

-- The @ is called as-patterns
capital :: String -> String
capital "" = "Dummy! It's just an empty string"
capital all@(x:tail) = "The first letter of " ++ all ++ " is " ++ [x]

-- ============== Guards!!!!======================

sillyBmiTell :: (RealFloat a) => a -> String
sillyBmiTell bmi
	| bmi < 18.5 = "You're underweight, you emo, you!"
	| bmi < 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi < 30.0 = "You're fat! Lose some weight, fatty!"
	| otherwise = "You're a whale, congratulations!"

betterBmiTell :: (RealFloat a) => a -> a -> String  
betterBmiTell weight height  
        | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
        | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
        | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
        | otherwise                   = "You're a whale, congratulations!"  

dryBmiTell:: (RealFloat a) => a -> a -> String
dryBmiTell weight height
		| bmi <= skinny = "You're underweight, you emo, you!"
		| bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
		| bmi <= fat 	= "You're fat! Lose some weight, fatty!"
		| otherwise 	= "You're a whale, congratulations!"
		where 	bmi = weight / height ^ 2
			skinny = 18.5
			normal = 25.0
			fat = 30

initials ::  String -> String -> String
initials firstname lastname = "Your initials are " ++ [f] ++ "." ++ [l]
	where 	(f:_) = firstname
		(l:_) = lastname

calcBmis :: (RealFloat a) =>  [(a,a)] -> [a]
calcBmis xs = [bmi x y | (x,y) <- xs]
	where bmi x y = x / y ^2

