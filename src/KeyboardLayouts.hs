module KeyboardLayouts (qwertyLetterPositions, Point(Point)) where

data Point = Point {
    getX :: Int,
    getY :: Int
} deriving (Show, Eq)

qwertyLetterPositions :: [(Char, Point)]
qwertyLetterPositions = [
    -- The top row is y = 0, and the rows beneath it are y = 1 and y = 2.
    -- In the screenshot we're working from (at https://support.google.com/crowdsource/answer/10279623?hl=en),
    -- the top row is offset from the second two rows, which accounts for
    -- the x values of all the letters.
    ('q', Point 0 0),
    ('w', Point 2 0),
    ('e', Point 4 0),
    ('r', Point 6 0),
    ('t', Point 8 0),
    ('y', Point 10 0),
    ('u', Point 12 0),
    ('i', Point 14 0),
    ('o', Point 16 0),
    ('p', Point 18 0),

    ('a', Point 1 1),
    ('s', Point 3 1),
    ('d', Point 5 1),
    ('f', Point 7 1),
    ('g', Point 9 1),
    ('h', Point 11 1),
    ('j', Point 13 1),
    ('k', Point 15 1),
    ('l', Point 17 1),

    ('z', Point 3 2),
    ('x', Point 5 2),
    ('c', Point 7 2),
    ('v', Point 9 2),
    ('b', Point 11 2),
    ('n', Point 13 2),
    ('m', Point 15 2)
    ]
