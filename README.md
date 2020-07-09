# My dotfiles

Refer:

- https://news.ycombinator.com/item?id=11071754
- https://www.atlassian.com/git/tutorials/dotfiles

## Install on a new machine

```
git clone --bare https://github.com/senseibaka/dotfiles.git $HOME/.dotfiles
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```

## Git commands with dotfiles

`config` is aliased to `git` with some settings to allow this to work.
For example:

```
config status
config add .something
config commit -m "Add .something"
config push
config pull
```
