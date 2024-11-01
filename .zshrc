eval "$(anyenv init -)"

# git-promptの読み込み
source ~/.zsh/.git-prompt.sh

## Git補完
fpath=(
  ${HOME}/.zsh/completions
  ${fpath}
)
autoload -Uz compinit
compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

alias devcon="devcontainer exec --workspace-folder . bash"

export PATH="/Users/shunya.kaneko/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shunya.kaneko/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shunya.kaneko/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shunya.kaneko/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shunya.kaneko/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
eval PATH="$(bash --norc -ec 'IFS=:; paths=($PATH); 
for i in ${!paths[@]}; do 
if [[ ${paths[i]} == "''/Users/shunya.kaneko/.pyenv/shims''" ]]; then unset '\''paths[i]'\''; 
fi; done; 
echo "${paths[*]}"')"
export PATH="/Users/shunya.kaneko/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh
source '/opt/homebrew/Cellar/pyenv/2.3.26/libexec/../completions/pyenv.zsh'
command pyenv rehash 2>/dev/null
pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

source "$HOME/.cargo/env"

# pecoの設定
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# search a destination from cdr list
function peco-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  peco --query "$LBUFFER"
}

export PATH="/usr/local/go/bin:$PATH"
