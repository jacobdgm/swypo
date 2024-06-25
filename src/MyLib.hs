module MyLib (someFunc) where
import Data.Maybe
import Data.List

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Point = P {
    getX :: Int,
    getY :: Int
} deriving (Show, Eq)

qwertyLetterPositions :: [(Char, Point)]
qwertyLetterPositions = [
    -- The top row is y = 0, and the rows beneath it are y = 1 and y = 2.
    -- In the screenshot we're working from (at https://support.google.com/crowdsource/answer/10279623?hl=en),
    -- the top row is offset from the second two rows, which accounts for
    -- the x values of all the letters.
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

findPointForLetter :: Char -> Maybe Point
findPointForLetter = flip lookup qwertyLetterPositions

findPointsForWord :: [Char] -> [Point]
findPointsForWord word = catMaybes (map findPointForLetter word)

directedCollinear :: Point -> Point -> Point -> Bool
directedCollinear (P x1 y1) (P x2 y2) (P x3 y3) =
    if y1 /= y2 || y2 /= y3 then False
        -- since the top row of the keyboard is offset from the bottom two rows,
        -- a line connecting a letter in the top row to a line in the bottom row
        -- cannot be collinear with a letter in the middle row. 
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
findCanonicalPath (w : x : y : zs) = if directedCollinear w x y then findCanonicalPath (w : y : zs) else w : (findCanonicalPath (x : y : zs))

