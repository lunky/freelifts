module FreeLifts
    ( 
--     plates
    ) where

import Data.Functor



data Plate = TwoPointFive | Five | Ten | TwentyFive | ThirtyFive | FourtyFive deriving (Show, Eq)


validateTotal :: Int -> Either [String] Int
validateTotal total  
    | total < 45 = Left ["Barbells start at 45"]
    | total `mod` 5 == 0 = Right total
    | otherwise = Left ["Invalid weight"]

getPlates ttl acc
    | net >= 90 = getPlates (ttl-90) (FourtyFive:acc) 
    | net >= 70 = getPlates (ttl-70) (ThirtyFive:acc)
    | net >= 50 = getPlates (ttl-50) (TwentyFive:acc)
    | net >= 20 = getPlates (ttl-20) (Ten:acc)
    | net >= 10 = getPlates (ttl-10) (Five:acc)
    | net >= 5 = getPlates (ttl-5) (TwoPointFive:acc)
    | otherwise = acc
    where net = ttl - 45

--test :: Validation [String] Int -> Either 
test = (\y -> case y of
            Right ttl -> putStrln getPlates ttl []
            Left err -> []) <$> validateTotal 150

--plates :: Int -> Either String [Plate]
--plates total =  (\(Validation y) -> getPlates y []) $ validateTotal total 

