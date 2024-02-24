# PATH is set in .zshenv

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'

setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

setopt auto_cd

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# rbenv
eval "$(rbenv init -)"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# nvm adds like 30 seconds of load time...
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# python
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

workspace="/Users/$(whoami)/code"

alias rgf="rg --files | rg"
alias tp="tail -500f ~/Library/Logs/puma-dev.log"
alias tf="tail -500f log/development.log"
alias tj="tail -f log/development.json.log | awk '{gsub(/action/, \"\033[01;31m\033[43m&\033[0m\"); print}'"
alias ll="ls -alr"
alias ss="source ~/.zshrc"
alias notes="vim ~/code/notes.txt"
alias be="bundle exec"
alias sd="bundle update --source idme-data"
alias pdu='puma-dev -uninstall -d dev'
alias ptu='puma-dev -uninstall -d test'
alias pdi='puma-dev -install -d dev -timeout 8h'
alias pti="puma-dev -install -d test -timeout 8h"
alias bi="bundle lock --add-platform ruby && bundle install && rbenv rehash && echo 'rehashed'"
alias bu="bundle update && rbenv rehash && echo 'rehashed'"
alias rr="rbenv rehash"
alias cb='cargo build'
alias cr='cargo run'
alias cc='cargo check'
alias ks="killall ssh-agent"
alias la='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ai %ar by %an" $branch | head -n 1` \\t$branch; done | sort -r'
alias nukeyarn='rm -rf node_modules && yarn install && bundle exec rails webpacker:clobber webpacker:clean && bundle install && bundle exec rails assets:precompile && rm -rf tmp/cache && touch tmp/restart.txt && bin/spring stop'
alias wmip="curl -s https://ifconfig.co"
alias go-gems="cd $HOME/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems"
alias go-gems2="cd $HOME/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/cache/bundler/git"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."
alias ............="cd ../../../../../../../../../../.."
alias .............="cd ../../../../../../../../../../../.."

look() {
	open https://idmeinc.atlassian.net/browse/$1
}

link(){
	echo https://idmeinc.atlassian.net/browse/$1 | tr -d '\n' | pbcopy ; echo '喔'
}

gc() {
  MESSAGE=$@
  BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
  git commit -m "$BRANCH: $MESSAGE"
}

gito() {
  BRANCH=$@
  git open origin $BRANCH
}

serve() {
  port="${1:-3000}"
  ruby -run -e httpd . -p $port
}

servepython() {
  python -m http.server
}

psql15() {
  brew unlink postgresql@14 && brew link postgresql@15 --force
  brew services stop postgresql@14
  brew services start postgresql@15
}

psql14() {
  brew unlink postgresql@15 && brew link postgresql@14 --force
  brew services stop postgresql@15
  brew services start postgresql@14
}

# Allow [ or ] matching. Helpful for running rake tasks with arguments
unsetopt nomatch
