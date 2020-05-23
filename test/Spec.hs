import Test.Hspec
import Lib

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "Math" $ do
    it "addition" $
        1 + 1 `shouldBe` 2
