# commit-msg

Pre-populate commit message. Example pre-populated message:

```sh
[ryuichi,john][24]

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
# Changes to be committed:
#	new file:   README.md
#
```

Here, `ryuichi` and `john` are pair programming. `24` is a card id.

## Usage

To use this command, save it as `.git/hooks/prepare-commit-msg`.

To test this command, invoke this with following arguments.

```sh
$ .git/hooks/prepare-commit-msg <commit-message-file> <commit-source> <commit-sha>
```

## Development

### Prerequisites

* stack
