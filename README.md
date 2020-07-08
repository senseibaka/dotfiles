# My dotfiles

Refer:

- https://news.ycombinator.com/item?id=11071754
- https://www.atlassian.com/git/tutorials/dotfiles

## Install on a new machine

```
git clone --bare <senseibaka/dotfiles> $HOME/dotfiles-tmp
rm -r ~/dotfiles-tmp/
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
