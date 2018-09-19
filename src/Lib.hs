module Lib
    ( Nat(..)
    , fromNat
    , plusNat
    , multNat
    , lteNat
    , factNat
    ) where

-- `Nat' is the type of natural numbers. Each number
-- is represented recursively, with `Z' representing
-- `0' and `S n' representing `n + 1'. Therefore, the
-- sequence `0, 1, 2, 3, ...` has the representation
-- `Z, S Z, S (S Z), S (S (S Z)), ...`
data Nat = Z | S Nat
    deriving (Eq, Show)

-- Given a natural number, compute its integer
-- representation.
fromNat :: Nat -> Int
fromNat _ = 0

-- Given two natural numbers, compute their sum. Think
-- about this recursively; what is the base case? What
-- is the step case?
plusNat :: Nat -> Nat -> Nat
plusNat = undefined

-- Given two natural numbers, compute their product.
-- Remember, multiplication is just repeated addition.
multNat ::  Nat -> Nat -> Nat
multNat = undefined

-- Given two natural numbers, determine if the first
-- is less than or equal to the second. For example:
-- * lteNat (S Z)     (S (S Z)) = True
-- * lteNat (S (S Z)) (S (S Z)) = True
-- * lteNat (S Z)     Z         = False
lteNat :: Nat -> Nat -> Bool
lteNat = undefined

-- Given a natural number, compute its factorial.
factNat :: Nat -> Nat
factNat = undefined
