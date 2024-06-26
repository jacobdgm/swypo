module MyLib (someFunc) where
import Data.Maybe
import Data.List
import KeyboardLayouts (KeyboardLayout, Point(Point), qwertyLetterPositions)

type Vocabulary = [String]

getScoresForKeyboards :: Vocabulary -> [KeyboardLayout] -> [ScoringFunction] -> [Float] -- eventually, turn this into [Score]
getScoresForKeyboards _vocabulary [] _scoringFunction = []
getScoresForKeyboards vocabulary (layout:layouts) scoringFunctions =
    getScoresForKeyboard vocabulary layout scoringFunctions
    ++ getScoresForKeyboards vocabulary layouts scoringFunctions

getScoresForKeyboard :: Vocabulary -> KeyboardLayout -> [ScoringFunction] -> [Float] -- eventually, turn this into [partial Score]
getScoresForKeyboard vocabulary layout scoringFunctions =
    map (getScoreForKeyboard vocabulary layout) scoringFunctions 

type Score = (KeyboardLayout, ScoringFunction, Float)

getScoreForKeyboard :: Vocabulary -> KeyboardLayout -> ScoringFunction -> Float 
getScoreForKeyboard = undefined

type ScoringFunction = [[Point]] -> Float

type Trail = [Point]

someFunc :: IO ()
someFunc = putStrLn "someFunc"

location :: Char -> Maybe Point
location = flip lookup qwertyLetterPositions

gestureTrail :: [Char] -> [Point]
gestureTrail word = catMaybes (map location word)

inLinearOrder :: Point -> Point -> Point -> Bool
inLinearOrder (Point x1 y1) (Point x2 y2) (Point x3 y3) =
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
        

simplifiedTrail :: [Point] -> [Point]
simplifiedTrail [] = []
simplifiedTrail [x] = [x]
simplifiedTrail [x, y] = if x == y then [x] else [x, y]
simplifiedTrail (w : x : y : zs) = if inLinearOrder w x y then simplifiedTrail (w : y : zs) else w : (simplifiedTrail (x : y : zs))

