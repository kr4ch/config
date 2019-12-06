# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=/home/tobias/.gem/ruby/2.5.0/bin:$PATH

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Show git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(parse_git_branch)$ "
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

# Xilinx tools
source /opt/Xilinx/Vivado/2018.2/settings64.sh




export TERMINAL=urxvt

alias i3cheatsheet='egrep ^bind ~/.config/i3/config | cut -d '\'' '\'' -f 2- | sed '\''s/ /\t/'\'' | column -ts $'\''\t'\'' | pr -2 -w 145 -t | less'











## ZI-specific (originally copied from Yves)

function project() {
    unset work
    export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    # Check for project name. If none given,
    # have the user choose one.
    if [[ -z $1 ]]; then
        printf 'Please select a project:\n'
        PROJECTS=`ls /home/tobika/zi/git/hdl/`
        OPTIONS="$PROJECTS Quit"
        # Choose between projects
        select opt in $OPTIONS; do
            if [ "$opt" = "Quit" ]; then
                unset work
                break
            else
                # A project may have been selected
                for i in $PROJECTS; do
                    # okay, we found the project, define
                    # the variables
                    if [ "$opt" = "$i" ]; then
                        project=$i
                        work=/home/tobika/zi/git/hdl/$project
                        break
                    fi
                done
                # If the $work variable is not defined,
                # it means the user has managed to select a wrong
                # option, so we print a little message
                if [[ -z $work ]]; then
                    printf 'Bad option selected! Hit enter to redisplay list.\n'
                else
                    break
                fi
            fi
        done
    else
        project=$1
        if [[ -z $2 ]]; then
            work=/home/tobika/zi/git/hdl/$project
        else
            work=/home/tobika/zi/$2/hdl/$project
        fi
    fi
    # If work is not defined at this point, we simply exit
    if [[ -n $work ]]; then
        # Check that the project directory exists
        if [[ ! -d $work ]]; then
            printf "Project '%s' in directory '%s' does not exist!\n" $project $work
        else
            export work
            # Try to source the project setup file
            if [[ -e $work/scripts/setup.sh ]]; then
                export ENV=$work/scripts/setup.sh
                bash --posix
            elif [[ -e $work/flow/setup.sh ]]; then
                export ENV=$work/flow/setup.sh
                bash --posix
            else
                printf "No setup.sh script found!\n"
            fi
        fi
    fi
}



function build_ziserver() {
  if [[ -z $1 ]]; then
    config=Release
  else
    config=$1
  fi
  make -C $ZISRC/$DEFAULT_BRANCH/soft/ziServer_AsyncIOSocket/src/make -j8 PROJECT_TREE_HOME=$ZISRC/$DEFAULT_BRANCH CONFIGURATION=$config PLATFORM=linux64
}

function start_ziserver() {
  if [[ -z $1 ]]; then
    config=Release
  else
    config=$1
  fi
  # OLD SVN:
  # make_dir=$ZISRC/$DEFAULT_BRANCH/soft/ziServer_AsyncIOSocket/src/make
  make_dir=$ZISRC/soft/products-labone/soft/ziServer_AsyncIOSocket/src/make
  (cd $make_dir; ../../target/$config/linux64/ziServer_AsyncIOSocket --firmware-path ~/Zurich\ Instruments/LabOne/Firmware/ --open-override 1 --interface-usb 0 "${@:2}")
}

function start_ziserver_debug() {
  if [[ -z $1 ]]; then
    config=Release
  else
    config=$1
  fi
  make_dir=$ZISRC/$DEFAULT_BRANCH/soft/ziServer_AsyncIOSocket/src/make
  (cd $make_dir; ../../target/$config/linux64/ziServer_AsyncIOSocket --firmware-path ~/Zurich\ Instruments/LabOne/Firmware/ --open-override 1 --interface-usb 0 --debug 0 "${@:2}")
}


function build_zihttp() {
  if [[ -z $1 ]]; then
    config=Release
  else
    config=$1
  fi
  make -C $ZISRC/$DEFAULT_BRANCH/soft/ziInterface/ziHttp/src/make -j8 PROJECT_TREE_HOME=$ZISRC/$DEFAULT_BRANCH CONFIGURATION=$config PLATFORM=linux64 $1
}

function start_zihttp() {
  if [[ -z $1 ]]; then
    config=Release
  else
    config=$1
  fi
  make_dir=$ZISRC/$DEFAULT_BRANCH/soft/ziInterface/ziHttp/src/make
  (cd $make_dir; ../../target/$config/linux64/ziHttp -r ../../../ziHttpCore/src/main/resources)
}

function build_zipython() {
  make -C $ZISRC/$DEFAULT_BRANCH/soft/ziInterface/ziPython/src/make -j8 PROJECT_TREE_HOME=$ZISRC/$DEFAULT_BRANCH CONFIGURATION=Release PLATFORM=linux64 PYTHON_VERSION=36
}

function install_zipython() {
  if [[ -z $1 ]]; then
    project=$DEFAULT_BRANCH
  else
    project=$1
  fi

  source_dir=$ZISRC/$project/soft/ziInterface/ziPython/target/Release/linux64/
  temp_dir=$HOME/temp
  target_dir=$HOME/.local/lib/python3.6/site-packages
  tar_file=`find $source_dir -name ziPython3.6*.tar.gz | tail -n 1`
  echo $tar_file
  install_dir=`tar -xzvf $tar_file -C $temp_dir | sed -n '1p;'`
  wd=`pwd`
  rm -r $target_dir/zhinst*
  cd $temp_dir/$install_dir
  python setup.py install --prefix $HOME/.local
  cp -r zhinst $target_dir
  cd $wd
  rm -r $temp_dir/$install_dir
}

function build_ziawg() {
  if [[ -z $1 ]]; then
    project=$DEFAULT_BRANCH
  else
    project=$1
  fi

  make -C $ZISRC/$project/soft/ziAWG/ziAWGCompiler/src/make -j8 PROJECT_TREE_HOME=$ZISRC/$DEFAULT_BRANCH/$project CONFIGURATION=Release PLATFORM=linux64
}

function bindiff() {
  cmp -l $1 $2 | gawk '{printf "%08X %02X %02X\n", $1, strtonum(0$2), strtonum(0$3)}'
}

function xbindiff() {
  basenamesrc=`basename $1`
  basenamedst=`basename $2`
  tmpsrc="/scratch/$USER/$basenamesrc.src.xxd"
  echo $tmpsrc
  tmpdst="/scratch/$USER/$basenamedst.dst.xxd"
  echo $tmpdst
  xxd $1 > $tmpsrc
  xxd $2 > $tmpdst
  #meld --diff $tmpsrc $tmpdst
  tkdiff $tmpsrc $tmpdst; rm $tmpsrc $tmpdst
}

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

#export LC_ALL=en_US.UTF-8
# Setup the prompt
#export PS1="\u@\h:\w\\$ "
# Use Python from the Anaconda install
#export PATH=/opt/anaconda3/bin:~/bin:~/.local/bin:~/.gem/ruby/2.5.0/bin:~/zi/git/soft/devices/cervino/utils/lin:~/zi/git/soft/devices/cervino_tools/linux_apps:/opt/tigervnc-1.9.0.x86_64/usr/bin:$PATH
#export PYTHONPATH=
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
export SVN_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim
export TRUNK="svn+ssh://zisvn@svn.zhinst.com/devel_svn/trunk"
export HOME_SERVER="/home/tobika"
export ZISRC="$HOME_SERVER/zi"
export DEFAULT_BRANCH="trunk.svn"
#export DEFAULT_BRANCH="git"

# Aliases
#alias startvnc='/opt/tigervnc-1.9.0.x86_64/usr/bin/vncserver :84 -depth 24 -geometry 3840x1600 -geometry 2560x1440'
#alias sourceise='source /usr/local/Xilinx/14.7/ISE_DS/settings64.sh'
alias sourcevivado='source /opt/Xilinx/Vivado/2018.2/settings64.sh'

alias bernina='project bernina'
alias cervino='project cervino'
alias hirzel='project hirzel'
alias etzel='project etzel'
alias klausen='project klausen'
alias grimsel='project grimsel'
alias julier='project julier'

#alias ll='ls -la --color=auto'
#alias ls='ls --color=auto'
#alias grep='grep --color=auto'
#alias sstat='svn stat -q'
#alias sup='svn up'
#alias vivado='vivado -tempDir /scratch/yvess/vivado'
#alias makerelease="make CONFIGURATION=Release TARGET=linux64"
#alias code="code --disable-gpu"
#alias rg="grep -r -i --color=auto"

#LS_COLORS="$LS_COLORS:ow=1;33"

