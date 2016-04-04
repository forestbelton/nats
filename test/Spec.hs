import Numeric.Natural

import Test.Hspec
import Test.QuickCheck

import Lib

fromNatural :: Natural -> Nat
fromNatural n = case toInteger n of
    0 -> Z
    k -> S $ fromNatural $ fromIntegral $ k - 1

instance Arbitrary Nat where
    arbitrary = fromNatural <$> arbitrary

zero = Z
one = S Z
two = S $ S Z
three = S $ S $ S Z
four = S $ S $ S $ S Z

fact :: Int -> Int
fact n = foldr (*) 1 [1..n]

main :: IO ()
main = hspec $ do
    describe "fromNat" $ do
        it "can convert 0 correctly" $ do
            fromNat Z `shouldBe` 0

        it "can convert 4 correctly" $ do
            fromNat four `shouldBe` 4

    describe "plusNat" $ do
        it "can compute 2 + 2 = 4" $ do
            plusNat two two `shouldBe` four

        it "has zero as a left identity" $ do
            property $ \n -> plusNat zero n == n

        it "has zero as a right identity" $ do
            property $ \n -> plusNat n zero == n

        it "is commutative" $ do
            property $ \m n -> plusNat m n == plusNat n m

        it "is associative" $ do
            property $ \m n o -> plusNat m (plusNat n o) == plusNat (plusNat m n) o

    describe "multNat" $ do
        it "has one as a left identity" $ do
            property $ \n -> multNat one n == n

        it "has one as a right identity" $ do
            property $ \n -> multNat n one == n

        it "anything times zero is zero" $ do
            property $ \n -> multNat n zero == zero

        it "is commutative" $ do
            property $ \m n  -> multNat m n == multNat n m

        it "is associative" $ do
            property $ \m n o -> multNat m (multNat n o) == multNat (multNat m n) o

    describe "lteNat" $ do
        it "agrees with <= in prelude" $ do
            property $ \m n -> lteNat m n == (fromNat m <= fromNat n)

    describe "factNat" $ do
        it "computes 0! = 1" $ do
            factNat zero `shouldBe` one
         
        it "agrees with integer-based factorial" $ do
            property $ \n -> fromNat (factNat n) == fact (fromNat n)
