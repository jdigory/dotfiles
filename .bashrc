# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
PATH=/home/camp/bin:$PATH
alias ci='camp-info'
alias cia='camp-info --all'
alias cls='printf "\033c"'
alias dir=ll
alias sl='screen -ls'
bind '"\C-d":complete'

# http://henrik.nyh.se/2008/12/git-dirty-prompt
# http://www.simplisticcomplexity.com/2008/03/13/show-your-git-branch-name-in-your-prompt/
#   username@Machine ~/dev/dir[master]$   # clean working directory
#   username@Machine ~/dev/dir[master*]$  # dirty working directory
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

export PROMPT_DIRTRIM=3
export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

export HISTTIMEFORMAT="%F %T "

# ssh agent handling
mkdir -p ~/.state
if [ ! -z "$SSH_AUTH_SOCK" ]; then
    screen_ssh_agent=${HOME}/.state/ssh-agent-screen
    if [ "$TERM" = "screen" ]; then
        SSH_AUTH_SOCK=${screen_ssh_agent}; export SSH_AUTH_SOCK
    else
        ln -snf ${SSH_AUTH_SOCK} ${screen_ssh_agent}
    fi
fi
