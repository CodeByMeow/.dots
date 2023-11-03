```
alias gbare='/usr/bin/git --git-dir=$HOME/.oridot / --work-tree=$HOME'
git clone --bare <git-repo-url> $HOME/.oridot
gbare checkout
gbare gbare --local status.showUntrackedFiles no
```
