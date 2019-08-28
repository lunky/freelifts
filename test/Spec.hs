--module FreeLiftsSpec where
import Test.Hspec
import FreeLifts

spec :: Spec
spec = do
    describe "test harness" $ do 
        it "test harness runs" $ do
            1 `shouldBe` 1

--    describe "plates" $ do 
--        it "45 should be empty" $ do
--           let input = 45
--           let expected = []
--           plates input `shouldBe` expected
--        it "46 should be error" $ do
--           let input = 46
--           let expected = Nothing
--           plates input `shouldBe` expected


main :: IO ()
main = hspec spec
