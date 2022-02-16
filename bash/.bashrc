function  encrypt_folder {
  tar -cvf "$1.tar" "$1"
  gpg -c "$1.tar"
  rm -f "$1.tar"
  rm -f "$1"
  return 0
}

function  decrypt_folder {
  gpg $1
  tar -xvf {$1.*}
  rm f $1
}

function  git-blame-lines {
  if [ $# -ne 2 ] &&  [ $# -ne 3 ]
  then
    echo "Usage: git-blame-lines filename first-line [last-line]"
    return 1
  fi
  if [ $# == 2 ]
  then
    lastline=$2
  else [ $# == 3 ]
    lastline=$3
  fi
  git log --pretty=format:%H -- $1 | xargs -i git blame {} -L $2,$lastline -- $1
  return 0
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function vim {
    s=$1
    file=${s%:*}
    line=${s#*:}
    if [ "$file" != "$line" ]
    then
        /usr/bin/vim $file +$line
    else
        /usr/bin/vim $@
    fi
}

function send {
    kill -s USR1 $1
}

#TITLEBAR='\[\e]0;\u@\h\a\]'

#PS1="${TITLEBAR}\[\e[31;1m\]\u@\[\e[33;1m\]\h:\[\e[34;1m\]\W\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/(\1)/')> \[\e[0m\]"

alias tmux="TERM=screen-256color-bce tmux"
alias ls='ls -h --color'
alias ll='ls -hlia --color'
alias grep='grep --color'
alias ssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias ps='ps -F -ALL'
alias myip='ifconfig | grep "inet addr" | head -n 1 | cut -f1 -d'B' | cut -f2 -d':''
alias vi='vim'
alias psname='ps -F -ALL | grep'
alias s='cd ..'
alias ss='cd ../..' 
alias d='cd -'
alias g='git'
alias c='clear'
alias ps='ps -F -ALL'
alias myip='ifconfig | grep "inet addr" | head -n 1 | cut -f1 -d'B' | cut -f2 -d':''
alias vi='vim'
alias psname='ps -F -ALL | grep'
alias s='cd ..'
alias ss='cd ../..' 
alias d='cd -'
#powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

#Esperanto
alias userdoc="docker ps| sed '1 d' | awk '{print \$1}' | xargs docker inspect | grep USERNAME | awk -F= '{print \$2}' | sed 's/.\{2\}$//'  | sort | uniq -c"
alias userdoc_all="docker ps -a| sed '1 d' | awk '{print \$1}' | xargs docker inspect | grep USERNAME | awk -F= '{print \$2}' | sed 's/.\{2\}$//'  | sort | uniq -c"

export PATH=".:$HOME/bin:$PATH"
#must be last
. ~/.git_svn_bash_prompt
