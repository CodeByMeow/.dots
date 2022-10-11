### Git bare

```
git clone --bare <git-repo-url> $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles/ config --local status.showUntrackedFiles no

# Define the alias in the current shell scope:
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias setuntrack='config config --local status.showUnstrackedFiles no'

# If non-default branch in repo, or naming the initial branch before first push:
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME switch -c base

# If instead pulling an already populated repo, simply:
config checkout
# Deal with conflicting files, or run again with -f flag if you are OK with overwriting
```
