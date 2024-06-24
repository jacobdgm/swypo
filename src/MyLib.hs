module MyLib (someFunc) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

data Point = P {
    getX :: Int,
    getY :: Int
} deriving Show

keyLetterPositions = [
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
