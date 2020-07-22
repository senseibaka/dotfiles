# Load Order                    Interactive  Interactive  Script
# Startup                       Only login   Always
# ----------------------------  -----------  -----------  ------
#               /etc/zshenv               1            1       1
# ${ZDOTDIR:-$HOME}/.zshenv               2            2       2
#
#               /etc/zprofile             3
# ${ZDOTDIR:-$HOME}/.zprofile             4
#
#               /etc/zshrc                5            3
# ${ZDOTDIR:-$HOME}/.zshrc                6            4
#
#               /etc/zlogin               7
# ${ZDOTDIR:-$HOME}/.zlogin               8
#
# Shutdown
# ----------------------------  -----------  -----------  ------
# ${ZDOTDIR:-$HOME}/.zlogout              9
#               /etc/zlogout             10
#
# Files:
# * zshenv   - Exported variables that should be available to all other programs (PATH, EDITOR, PAGER, etc)
# * zprofile - Same as zlogin but sourced before zshrc
# * zshrc    - Interactive shell configuration
# * zlogin   - Sourced on the start of login (but after zshrc). e.g. could be used to start X
# * zlogout  - Called when logging out, could be used for cleanup tasks
# Notes:
# * If you want a dotfile-less home, add `export ZDOTDIR=~/.zsh` to `/etc/zshrc`
# * `.zprofile` is meant as an alternative to `.zlogin` for ksh fans; the two are not intended to be used together, although this could certainly be done if desired
# * ZSH seems to read `~/.profile` as well, if `~/.zshrc` is not present.

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nick/.oh-my-zsh"

# ANDROID
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# avdmanager, sdkmanager
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
# adb, logcat
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# apksigner, zipalign
export PATH=$PATH:$ANDROID_SDK_ROOT/build-tools

# openjdk first
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
# java8 path
export PATH="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin:$PATH"

# rust
export PATH=$PATH:$HOME/.cargo/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# aws
export AWS_REGION=ap-southeast-2

# don't paginate if less than a page worth of content
export LESS="-R -F -X $LESS"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-autosuggestions
	emacs
	git
	gitfast
	aws
	osx
	docker
	docker-compose
	you-should-use
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# local aliases
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias rgf='rg --files | rg'
alias weather='curl v2.wttr.in'
alias brew-up='brew update && brew upgrade'
node-usage () {
	find . -name 'node_modules' -type d -prune -print | xargs du -chs
}
node-clear () {
	find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;
	find . -name 'package-lock.json' -type f -prune -print -exec rm '{}' \;
}
alias edit-zsh='code ~/.zshrc'
alias edit-aws='code ~/.aws/credentials'
alias gpro='g pr show --open --id'

# filetype aliases
alias -s {ape,avi,flv,m4a,mkv,mov,mp3,mp4,mpeg,mpg,ogg,ogm,wav,webm}=mpv
alias -s {ts,html,json,md,tf,zshrc}=code
alias -s git="git clone"

# global aliases
alias -g G='| grep'
alias -g R='| rg'
alias -g L='| less'
alias -g CC="| pbcopy "
alias -g "?"="| fzf "
alias -g X="| xargs "
alias -g Y="| yank "

# auto-expand global aliases
globalias() {
	if [[ $LBUFFER =~ '[A-Z0-9]+$' ]]; then
		zle _expand_alias
		zle expand-word
	fi
	zle self-insert
}
zle -N globalias
bindkey " " globalias # space key to expand globalalias

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# e.g. kms-decrypt 'encrypted secret'
kms-decrypt () {
  decryptedText=$(\
    echo $1 \
    | base64 --decode \
    | aws kms decrypt --ciphertext-blob fileb:///dev/stdin --output text --query Plaintext \
    | base64 --decode \
  )
  echo $decryptedText
  echo $decryptedText | pbcopy
  echo Copied to clipboard
}

# e.g. kms-encrypt alias/blah 'secret'
kms-encrypt () {
  keyId=$(aws kms describe-key --key-id $1 --output text --query KeyMetadata.KeyId)
  encryptedText=$(aws kms encrypt --key-id $keyId --plaintext $2 --output text --query CiphertextBlob)
  echo $encryptedText
  echo $encryptedText | pbcopy
  echo Copied to clipboard
}

total-lambda-bytes () {
	aws lambda list-functions | jq ".Functions[].CodeSize" > sizes.txt
	awk '{s+=$1} END {print s}' sizes.txt
	rm sizes.txt
}

# screen recordings are notoriously large. make them smaller.
fast-cap-convert () {
	for f in *.mov
	do
		name=${f%.mov}
		out="$name.mp4"

		if test -f "$out"
		then
			continue;
		fi

		echo "convert $f -> $out"
		HandBrakeCLI --preset "Fast 1080p30" -i $f -o $out
	done
}

flush-dns () {
	dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
}

senv () {
	source ~/.envfiles/$1
}
