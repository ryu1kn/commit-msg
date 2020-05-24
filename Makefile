.PHONY: deploy
deploy:
	cp -f .stack-work/dist/x86_64-osx/Cabal-*/build/commit-msg-exe/commit-msg-exe .git/hooks/prepare-commit-msg
