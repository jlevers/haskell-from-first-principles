-- review.hs
module Review where


-- Warmup/review
-- #1
stops  = "pbtdkg"
vowels = "aeiou"

buildSVSs :: String -> String -> [(Char, Char, Char)]
buildSVSs _ [] = []
buildSVSs [] _ = []
buildSVSs stops vowels = filter (\t -> (first t) == 'p') (map strToTup (foldr (genAndConcat postfixWithAll) [] twoLetterStrs))
  where
    genAndConcat f = (\ch ys -> (f ch stops) ++ ys)
    oneVwlStrs = map (\c -> c:[]) vowels
    twoLetterStrs = foldr (genAndConcat prefixWithAll) [] oneVwlStrs


strToTup :: String -> (Char, Char, Char)
strToTup [] = (undefined, undefined, undefined)
strToTup s = (s !! 0, s !! 1, s !! 2)


first :: (a, b, c) -> a
first (a, _, _) = a


prefixWithAll :: String -> [Char] -> [String]
prefixWithAll s [] = [s]
prefixWithAll s cs = map (\c -> [c] ++ s) cs


postfixWithAll :: String -> [Char] -> [String]
postfixWithAll s cs = map reverse $ prefixWithAll (reverse s) cs


-- Wow. I'm a doofus. All of that can be rewritten as:
stopVowelStops = [(x, y, z) | x <- stops, y <- vowels, z <- stops]
withP = filter (\(x, y, z) -> x == 'p') stopVowelStops

-----
-- c)

nouns = [
  "Actor", "Gold", "Painting", "Advertisement", "Grass", "Parrot",
  "Afternoon", "Greece", "Pencil", "Airport", "Guitar", "Piano",
  "Ambulance", "Hair", "Pillow", "Animal", "Hamburger", "Pizza",
  "Answer", "Helicopter", "Planet", "Apple", "Helmet", "Plastic",
  "Army", "Holiday", "Portugal", "Australia", "Honey", "Potato",
  "Balloon", "Horse", "Queen", "Banana", "Hospital", "Quill",
  "Battery", "House", "Rain", "Beach", "Hydrogen", "Rainbow",
  "Beard", "Ice", "Raincoat", "Bed", "Insect", "Refrigerator",
  "Belgium", "Insurance", "Restaurant", "Boy", "Iron", "River",
  "Branch", "Island", "Rocket", "Breakfast", "Jackal", "Room",
  "Brother", "Jelly", "Rose", "Camera", "Jewellery", "Russia",
  "Candle", "Jordan", "Sandwich", "Car", "Juice", "School",
  "Caravan", "Kangaroo", "Scooter", "Carpet", "King", "Shampoo",
  "Cartoon", "Kitchen", "Shoe", "China", "Kite", "Soccer",
  "Church", "Knife", "Spoon", "Crayon", "Lamp", "Stone",
  "Crowd", "Lawyer", "Sugar", "Daughter", "Leather", "Sweden",
  "Death", "Library", "Teacher", "Denmark", "Lighter", "Telephone",
  "Diamond", "Lion", "Television", "Dinner", "Lizard", "Tent",
  "Disease", "Lock", "Thailand", "Doctor", "London", "Tomato",
  "Dog", "Lunch", "Toothbrush", "Dream", "Machine", "Traffic",
  "Dress", "Magazine", "Train", "Easter", "Magician", "Truck",
  "Egg", "Manchester", "Uganda", "Eggplant", "Market", "Umbrella",
  "Egypt", "Match", "Van", "Elephant", "Microphone", "Vase",
  "Energy", "Monkey", "Vegetable", "Engine", "Morning", "Vulture",
  "England", "Motorcycle", "Wall", "Evening", "Nail", "Whale",
  "Eye", "Napkin", "Window", "Family", "Needle", "Wire",
  "Finland", "Nest", "Xylophone", "Fish", "Nigeria", "Yacht",
  "Flag", "Night", "Yak", "Flower", "Notebook", "Zebra",
  "Football", "Ocean", "Zoo", "Forest", "Oil", "Garden",
  "Fountain", "Orange", "Gas", "France", "Oxygen", "Girl",
  "Furniture", "Oyster", "Glass", "Garage", "Ghost"
  ]

verbs = [
  "add", "drop", "hang", "knit", "obey", "scatter",
  "visit", "allow", "end", "hug", "jump", "name",
  "reach", " land", "open", "stay", "walk", "bake",
  "escape", "imagine", "lock", "pass", "talk", "use",
  "zip", "damage", " work", "bang", "fasten", "itch",
  "march", "promise", "turn", "yawn", "kick", "notice",
  "rinse", " call", "fix", "jog", "mix", "question",
  "untie", "yell", "chase", "gather", "vanish", "zoom"
  ]

-- c)
nvns = [(n1, v, n2) | n1 <- nouns, v <- verbs, n2 <- nouns]



-- #2

-- Gets the average word length from a list of words
seekritFunc :: String -> Int
seekritFunc x =
  div (sum (map length (words x)))
      (length (words x))


-- #3
fracLength :: Fractional b => [a] -> b
fracLength xs = fromIntegral . length $ xs

-- Gets the average word length from a list of words
seekritFunc' :: Fractional a => String -> a
seekritFunc' x =
  (/) (sum (map fracLength (words x)))
      (fracLength (words x))
