#!/usr/bin/env bash

# +--------+
# | System |
# +--------+

alias bigf= 'find / -xdev -type f -size +500M'  # display "big" files > 500M

# +-----+
# | X11 |
# +-----+

alias xpropc='xprop | grep WM_CLASS' # display xprop class

# +-----+
# | Zsh |
# +-----+

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index} > /dev/null"; unset index # directory stack

alias kitty='kitty -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty'

# +------+
# | wget |
# +------+
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# +----+
# | cp |
# +----+

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias la='ls -alh'

# +------+
# | grep |
# +------+

alias grep="grep -P -i --color=auto"

# +------+
# | xlip |
# +------+

alias cb='xclip -sel clip'

# +------+
# | dust |
# +------+

alias dust='du -sh * | sort -hr'

# +------+
# | ping |
# +------+

alias pg='ping 8.8.8.8'

# +------+
# | time |
# +------+

alias time='/usr/bin/time'

# +----+
# | bc |
# +----+

alias calc="noglob calcul"

# +-----+
# | bat |
# +-----+

alias batl='bat --paging=never -l log'

# +--------+
# | pacman |
# +--------+

alias paci='sudo pacman -S'               # install
alias pachi='sudo pacman -Ql'             # Pacman Has Installed - what files where installed in a package
alias pacs='sudo pacman -Ss'              # search
alias pacu='sudo pacman -Syu'             # update
alias pacr='sudo pacman -R'               # remove package but not dependencies
alias pacrr='sudo pacman -Rs'             # remove package with unused dependencies by other softwares
alias pacrc='sudo pacman -Sc'             # remove pacman's cache
alias pacro='pacman -Rns $(pacman -Qtdq)'
alias pacrl='rm /var/lib/pacman/db.lck'   # pacman remove locks
alias pacls="sudo pacman -Qe"
alias pacc='sudo pacman -Sc'
alias paccc='sudo pacman -Scc'            # empty the whole cache

# +-------+
# | fonts |
# +-------+

alias fonts='fc-cache -f -v'

# +-----+
# | yay |
# +-----+

alias yayi='yay -S'     # install
alias yayhi='yay -Ql'   # Yay Has Installed - what files where installed in a package
alias yays='yay -Ss'    # search
alias yayu='yay -Syu'   # update
alias yayr='yay -R'     # remove package but not dependencies
alias yayrr='yay -Rs'   # remove package with unused dependencies by other softwares
alias yayrc='yay -Sc'   # remove yay's cache
alias yayls="yay -Qe"

# +--------+
# | netctl |
# +--------+

alias wifi='sudo wifi-menu -o'

# +--------+
# | Golang |
# +--------+

alias gob="go build"
alias gor="go run" 
alias goc="go clean -i"
alias gta="go test ./..."       # go test all
alias gia="go install ./..."    # go install all

# +------+
# | Hugo |
# +------+

alias hugostart="hugo server -DEF --ignoreCache"

# +--------+
# | muffet |
# +--------+

alias deadlink="muffet -t 20"

# +---------+
# | netstat |
# +---------+

alias port="netstat -tulpn | grep"


# +------+
# | tmux |
# +------+

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# +-------+
# | tmuxp |
# +-------+

alias mux='tmuxp load'


# +------+
# | lynx |
# +------+

alias lynx='lynx -vikeys -accept_all_cookies'

# +----------------+
# | udiskie-umount |
# +----------------+

alias ubackup='udiskie-umount $MEDIA/BACKUP'
alias umedia='udiskie-umount $MEDIA/*'

# +--------+
# | docker |
# +--------+
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockRr='docker rm $(docker ps -a -q)'                                     # delete every containers / images
alias dockRr='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything
alias dockceu='docker-compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
alias dockce='docker-compose run --rm'

# +----------------+
# | docker-compose |
# +----------------+

alias docker-compose-dev='docker-compose -f docker-compose-dev.yml' # run a different config file than the default one

# +----------+
# | Personal |
# +----------+

alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# Folders
alias work="$HOME/workspace"
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
alias dot="$HOME/.dotfiles"

# Mindmaps
alias freebrain="freemind $CLOUD/knowledge_base/_BRAINSTORMING/*.mm &> /dev/null &"
alias freelists="freemind $CLOUD/knowledge_base/_LISTS/*.mm &> /dev/null &"
alias freepain="freemind $CLOUD/knowledge_base/_PROBLEMS/*.mm &> /dev/null &"
alias freeproj="freemind $CLOUD/knowledge_base/_PROJECTS/*.mm &> /dev/null &"
 
# Golang
alias gosrc="$GOPATH/src/" # golang src
alias gobin="$GOPATH/bin/" # golang bin

# Clojure
alias cljrepl='clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"0.1.4\"}}}" -m rebel-readline.main'

# AWS
alias awsa='aws --profile amboss-profile'

# OBS

alias obsn='prime-run obs&'

# +--------+
# | Custom |
# +--------+

alias mke='mkextract'
alias ex='extract'

# +---------+
# | scripts |
# +---------+

alias ddg="duckduckgo"
alias wiki="wikipedia"
