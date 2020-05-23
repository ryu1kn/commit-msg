import Test.Hspec
import Lib

main :: IO ()
main = hspec spec

spec :: Spec
spec = describe "commit-msg" $ do
    it "adds author's name" $
        extendCommitMessage originalMessage `shouldBe` "[ryuichi]\n" ++ originalMessage

originalMessage = "# Please enter the commit message for your changes. Lines starting\n\
                  \# with '#' will be ignored, and an empty message aborts the commit.\n\
                  \#\n\
                  \# On branch master\n\
                  \# Changes to be committed:\n\
                  \#\tnew file:   sample.txt\n\
                  \#\n\
                  \"
