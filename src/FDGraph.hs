module FDGraph.EdgeWeighted where

-----------------------------------------------------------------------------
import Linear.V2
import Linear.Vector
-----------------------------------------------------------------------------

-- type Vec = V2 Integer
-- type AttractVec = (Vec, Integer)
--
-- data WordNode
--     = WordNode { word  :: !String
--                , count :: !Integer
--                , pos   :: !Vec
--                , force :: !Vec
--                }
--
-- sumForces :: Vec -> [AttractVec] -> Vec
-- sumForces = foldr ((^+^) . applyForce)
--     where applyForce (vec, force) = vec ^ force
--
-- updateNode :: WordNode -> WordNode
-- updateNode = undefined

data Node = Node { pV :: V2 Integer -- Node position vector
                 , fV :: V2 Integer -- Node force vector
                 , edges :: [(Node, Float)]
                 } deriving (Show, Read, Eq)


repulse :: (Fractional n) => n -> n -> n
repulse k_r d = k_r / (d*d)


spring :: (Fractional n) => n -> n -> n -> n
spring k_s l d = k_s * (d - l)
