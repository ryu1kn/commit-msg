import Test.Hspec
import Param
import Lib

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "commit-msg" $ do
    it "returns original message" $
        let param = Param (Config Nothing Nothing) Nothing
         in extendCommitMessage param originalMessage `shouldBe` originalMessage

    it "adds author's name" $
        let param = Param (Config (Just ["ryuichi"]) Nothing) Nothing
         in extendCommitMessage param originalMessage `shouldBe` "[ryuichi]\n" ++ originalMessage

    it "adds task ID" $
        let param = Param (Config (Just ["ryuichi"]) (Just ["24"])) Nothing
         in extendCommitMessage param originalMessage `shouldBe` "[ryuichi][24]\n" ++ originalMessage

originalMessage = "\n\
                  \# Please enter the commit message for your changes. Lines starting\n\
                  \# with '#' will be ignored, and an empty message aborts the commit.\n\
                  \#\n\
                  \# On branch master\n\
                  \# Changes to be committed:\n\
                  \#\tnew file:   sample.txt\n\
                  \#\n\
                  \"
