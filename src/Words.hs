module Words where

-----------------------------------------------------------------------------
import qualified Data.HashMap as HashMap
-----------------------------------------------------------------------------

followers :: String -> [String] -> [String]
followers string = followers' []
    where followers' fs (x:y:xs)
            | x == string      = followers' (fs ++ [y]) xs
          followers' fs (_:xs) = followers' fs xs
          followers' fs []     = fs

followerCounts :: [String] -> HashMap.Map String Integer
followerCounts xs = foldr (HashMap.adjust (+1)) initCounts xs
    where initCounts = HashMap.fromList $ map (\x -> (x, 0)) xs
