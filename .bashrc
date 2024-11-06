#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color'

# Show git branch name and bash prompt
# bold for dirty branches
c_sgr0="$(tput sgr0)"
c_clean=$c_sgr0
c_dirty="$(tput bold)"
parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver="["$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"]"
  else
          return 0
  fi
  echo -e $gitver
}
branch_color ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
    color=""
    if git diff --quiet 2>/dev/null >&2
    then
      color="${c_clean}"
    else
      color=${c_dirty}
    fi
  else
    return 0
  fi
  echo -ne $color
}

PS1='\u@\h \w \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]$ '
PATH=$PATH:./node_modules/.bin:~/.yarn/bin:~/.local/bin

get_container() {
  docker ps | grep $1 | awk '{print $1}' | head -n 1
}

get_log() {
  docker logs -f `get_container $1`
}

docker_shell() {
  docker exec -it `get_container $1` bash
}

alias gco='git checkout'
alias gst='git status'
alias gbr='git branch'
alias grm='git rebase -i origin/master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gaa='git add -A'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

set -o vi

export VISUAL='/usr/bin/vim'

export CHROME_BIN=/usr/bin/chromium
export FIREFOX_BIN=/usr/bin/firefox

alias dlog='get_log'
alias dshell='docker_shell'

wtfk8s() {
  kubectl describe pod | awk '/^Events:/,EOF'
  kubetail '.*' -s 100h -f false
}
source /usr/share/nvm/init-nvm.sh
