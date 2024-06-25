module MyLib (someFunc) where
import Data.Maybe
import Data.List

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Point = P {
    getX :: Int,
    getY :: Int
} deriving (Show, Eq)

-- data LetterPosition = LP {
--     getRow :: Int 
--     getPosition :: Int, -- i.e., the position within the row
-- } deriving Show

qwertyLetterPositions :: [(Char, Point)]
qwertyLetterPositions = [
    ('q', P 0 0),
    ('w', P 2 0),
    ('e', P 4 0),
    ('r', P 6 0),
    ('t', P 8 0),
    ('y', P 10 0),
    ('u', P 12 0),
    ('i', P 14 0),
    ('o', P 16 0),
    ('p', P 18 0),

    ('a', P 1 1),
    ('s', P 3 1),
    ('d', P 5 1),
    ('f', P 7 1),
    ('g', P 9 1),
    ('h', P 11 1),
    ('j', P 13 1),
    ('k', P 15 1),
    ('l', P 17 1),

    ('z', P 3 2),
    ('x', P 5 2),
    ('c', P 7 2),
    ('v', P 9 2),
    ('b', P 11 2),
    ('n', P 13 2),
    ('m', P 15 2)
    ]

-- dvorakLetterPositions :: [(Char, LetterPosition)]
-- dvorakLetterPositions = [
--     ('p', LP 0 0),
--     ]

findPointForLetter :: Char -> Maybe Point
findPointForLetter = flip lookup qwertyLetterPositions

findPointsForWord :: [Char] -> [Point]
findPointsForWord word = catMaybes (map findPointForLetter word)

-- telescopeWord :: [Char] -> [Char]
-- telescopeWord [] = []
-- telescopeWord [x] = [x]
-- telescopeWord (x : y : zs) = if x == y then telescopeWord (y : zs) else x : (telescopeWord (y : zs))

directedColinear :: Point -> Point -> Point -> Bool
directedColinear (P x1 y1) (P x2 y2) (P x3 y3) =
    if y1 /= y2 || y2 /= y3 then False
    else
        if xs == sortedXs then True
        else xs == reverse sortedXs
        where
            xs = [x1, x2, x3]
            sortedXs = sort xs
        

findCanonicalPath :: [Point] -> [Point]
findCanonicalPath [] = []
findCanonicalPath [x] = [x]
findCanonicalPath [x, y] = if x == y then [x] else [x, y]
findCanonicalPath (w : x : y : zs) = if directedColinear w x y then findCanonicalPath (w : y : zs) else w : (findCanonicalPath (x : y : zs))
 

-- asdf == asf == adf == af
-- adsf /= af since jog in the middle
-- afd /= af since different end letter
