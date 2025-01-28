#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

export MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

# Navigation
alias ls='ls -lh --color=auto'
alias l='ls -a'
alias c='clear'
alias Home='cd /mnt/c/Users/javii'
alias Bash='vim ~/.bashrc'
alias RefreshBash="source /home/$USER/.bashrc"

# APT
alias Install="sudo apt install"
alias Uninstall="sudo apt remove"
alias SystemUpdate="sudo apt update; sudo apt upgrade"

# Git
alias gti="git init"
alias gta="git add"
alias gtc="git commit -am"
alias gtl="git log"
alias gtlone="git log --oneline"
alias gtg="git log --graph"
alias gtst="git status"
alias gtps="git push"
alias gtpl="git pull"
alias gtb="git branch"
alias gtbdlt="git branch -d"
alias gtsw="git switch"
alias gtcheck="git checkout"
alias gtchecknb="git checkout -b"
alias gtr="git remote"
alias gtra="git remote add"
alias gtrrm="git remote remove"
alias gtrs="git remote show"
alias gtrmv="git remote rename"
alias gtrst="git reset"
alias gtrsthd="git reset --hard"
alias gtm="git merge"
alias AddSSH="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/id_rsa"

# Tar
alias Extract="tar -zxvf"

parse_git_branch() 
{
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ 󰊢 \1/'
}

styled_parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' | \
    awk '{printf "   \033[31m\033[97;41m 󰊢 %s \033[m\033[31m", $0}'
}

PS2='\[\033[01;34m\]󰟍 \u \[\033[01;35m\]  ${PWD#${PWD%/*/*/*}/}\[\033[01;31m\] $(parse_git_branch) \[\033[00m\] \n '

PS1='\n\[\033[34m\]\[\033[97;44m\] 󰟍 \u  \[\033[35m\]\[\033[97;45m\]  ${PWD#${PWD%/*/*/*}/} \[\033[0m\]\[\033[35m\]$(styled_parse_git_branch) \n\[\033[0m\]  '
