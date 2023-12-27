```
alias gbare='/usr/bin/git --git-dir=$HOME/.dots / --work-tree=$HOME'
git clone --bare <git-repo-url> $HOME/.dots
gbare checkout
gbare config --local status.showUntrackedFiles no
```
