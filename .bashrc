colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White
# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.1-1

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
set -o ignoreeof
#
# Use case-insensitive filename globbing
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion
if [[ ( -z "$INSIDE_EMACS" || "$EMACS_BASH_COMPLETE" = "t" ) &&\
     -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
 # if [ -f "${HOME}/.bash_aliases" ]; then
 #   source "${HOME}/.bash_aliases"
 # fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
 alias df='df -h'
 alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
 cd_func ()
 {
   local x2 the_new_dir adir index
   local -i cnt
 
   if [[ $1 ==  "--" ]]; then
     dirs -v
     return 0
   fi
 
   the_new_dir=$1
   [[ -z $1 ]] && the_new_dir=$HOME
 
   if [[ ${the_new_dir:0:1} == '-' ]]; then
     #
     # Extract dir N from dirs
     index=${the_new_dir:1}
     [[ -z $index ]] && index=1
     adir=$(dirs +$index)
     [[ -z $adir ]] && return 1
     the_new_dir=$adir
   fi
 
   #
   # '~' has to be substituted by ${HOME}
   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
 
   #
   # Now change to the new dir and add to the top of the stack
   pushd "${the_new_dir}" > /dev/null
   [[ $? -ne 0 ]] && return 1
   the_new_dir=$(pwd)
 
   #
   # Trim down everything beyond 11th entry
   popd -n +11 2>/dev/null 1>/dev/null
 
   #
   # Remove any other occurence of this dir, skipping the top of the stack
   for ((cnt=1; cnt <= 10; cnt++)); do
     x2=$(dirs +${cnt} 2>/dev/null)
     [[ $? -ne 0 ]] && return 0
     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
     if [[ "${x2}" == "${the_new_dir}" ]]; then
       popd -n +$cnt 2>/dev/null 1>/dev/null
       cnt=cnt-1
     fi
   done
 
   return 0
 }
# 
alias cd=cd_func
alias ll='ls -l --color'
alias la='ls -a --color'
alias lal='ls -la --color'
alias ls='ls --group-directories-first --color'
alias l='ls'
alias c='. c.sh'

alias rm='rm -i'
alias df='df -h'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
# alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudoedit"
# alias e='emacsclient -t'
# alias ec='emacsclient -c'
# alias vim='emacsclient -t'
# alias vi='emacsclient -t'

alias pg='ps ax | grep'
alias sb='source ~/.bashrc' 
CDPATH=:~/:~/.emacs.d:~/www:~/mysrc
PATH=~/npm/bin:$PATH:~/bin:~/opt/jdk:~/opt/racket/bin:~/.cabal/bin
export PATH
export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups
# export HISTIGNORE="pwd:ls:ls -ltr:"

hlalib=~/opt/hla/hlalib 
export hlalib
hlainc=~/opt/hla/include
export hlainc

set -o vi

#temporary aliases
alias cdp='c ~/mysrc/lisp/picolisp'
alias cdr='c ~/mysrc/lisp/picolisp/roster'
alias sr='pil roster/jmain.l -main -go +'

alias docco='~/opt/node_modules/docco/bin/docco'

#So that we can start node with rlwrap and have vi mode
export NODE_NO_READLINE=1
alias node='rlwrap node'

#. ~/nvm/nvm.sh
#nvm use v0.8.5
#[[ -s "/home/michieljoris/.rvm/scripts/rvm" ]] && source "/home/michieljoris/.rvm/scripts/rvm"  # This loads RVM into a shell session.
export PATH=$PATH:/home/michieljoris/me/bin
export PATH=$PATH:~/.cabal/bin:~/.xmonad/bin
export PATH=$PATH:/usr/local/ghc7.0.3/bin
export PATH=$PATH:/usr/local/haskell-platform-2011.2.0.1/bin
export PATH=$PATH:~/bin
export PATH=$PATH:/media/EXT4_500GIG/opt/cmucl/bin
export PATH=$PATH:/home/michieljoris/opt/cmucl/bin
#export PATH=$PATH:/home/michieljoris/opt/git-annex.linux
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
export CDPATH=".:~:~/me/mysrc:~/EOCS"

source ~/.git-prompt.sh
# PS1="\s\v-\w$(__git_ps1)$"

# PS1="\[$BLUE\]studio:\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
#return value visualisation
# PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\];)\"; else echo \"\[\033[01;31m\];(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "
export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWSTASHSTATE=1 
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[36m\]'
    White='\[\e[37m\]'
    Red='\[\e[31m\]'
    Magenta='\[\e[35m\]'
    Green='\[\e[32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'
    
    # Add a bright white exit status for the last command
    # PS1="$White\$?"
    PS1=""
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        # PS1+="$Green$Checkmark "
        PS1+=""
    else
	PS1="$White\$?"
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h"
    else
        PS1+="$Blue"
        PS1+="\u@"
        PS1+=$(cat ./machinename)
        # PS1+="office"
	
        # PS1+="$Blue\\u@\\h"
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Green\\w$Magenta\$(__git_ps1)$White\$$Reset"
}
PROMPT_COMMAND='set_prompt'
# PROMPT_COMMAND='es=$?; [[ $es -eq 0 ]] && unset error || error=$(echo -e "\e[1;41m $es \e[40m")'
# PS1="${error} ${PS1}"



alias l='ls -ilph --group-directories-first'
alias ..='cd ..'
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre

# git clone git://github.com/joelthelion/autojump.gitap
[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash

# setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
# setxkbmap -option ctrl:swapcaps     # Swap Left Control and Caps Lock

if [ -f ~/.drush_bashrc ] ; then
    . ~/.drush_bashrc
fi

# source ~/dotfiles/.git-flow-completion.bash

# {{{
# Node Completion - Auto-generated, do not touch.
# shopt -s progcomp
# for f in $(command ls ~/.node-completion); do
#   f="$HOME/.node-completion/$f"
#   test -f "$f" && . "$f"
# done
# }}}

# export BB_SERVER_DEV=true

export TERM=xterm-256color
export EDITOR=vim
# export SPIDEROAKDATADIR=/media/michieljoris/EXT4_500GIG/.SpiderOak

# export DEVELOP=1

# eval "$(fasd --init auto)" # fails to produce prompt, but shell works??

# _fasd_bash_hook_cmd_complete v m j o
 

# git config --global alias.lg "log --color --graph --pretty=format:'%cred%h%creset -%c(yellow)%d%creset %s %cgreen(%cr) %c(bold blue)<%an>%creset' --abbrev-commit"

# The next line updates PATH for the Google Cloud SDK.
# source '/home/michieljoris/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
# source '/home/michieljoris/google-cloud-sdk/completion.bash.inc'

# export PATH=$PATH:/usr/local/go/bin



