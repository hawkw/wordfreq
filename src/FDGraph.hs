module FDGraph where

-----------------------------------------------------------------------------
import Linear.V2
import Linear.Vector
-----------------------------------------------------------------------------

type Vec = V2 Integer
type AttractVec = (Vec, Integer)

data WordNode
    = WordNode { word  :: !String
               , count :: !Integer
               , pos   :: !Vec
               , attraction :: [AttractVec]
               }

sumForces :: Vec -> [AttractVec] -> Vec
sumForces = foldr ((^+^) . applyForce)
    where applyForce (vec, force) = vec ^ force
