
### Added by Zinit's installer
if [[ ! -f $HOME/.config/local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.config/local/share/zinit" && command chmod g-rwX "$HOME/.config/local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.config/local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.config/local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# PROMPT="%B%(?..$fg[red]🗙 $reset_color)$fg[yellow]%~ $fg[green]%(!.#.->)%b"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

setopt HIST_SAVE_NO_DUPS

# +--------+
# | System |
# +--------+

alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'
alias _='sudo'


# +----+
# | cd |
# +----+

-(){cd -}
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'

# +--------+
# | Neovim |
# +--------+

alias vim='nvim'
alias vi='nvim'
alias svim='sudoedit'
alias dvim="vim -u /usr/share/nvim/archlinux.vim" # nvim with default config
alias nvimc='rm -I $VIMCONFIG/swap/*'             # clean nvim swap file
alias nvimcu='rm -I $VIMCONFIG/undo/*'            # clean the vim undo
alias nviml='nvim -w $VIMCONFIG/vimlog "$@"'      # log the keystrokes 
alias nvimd='nvim --noplugin -u NONE'             # launch nvim without any plugin or config (nvim debug)
alias nvimfr='nvim +e /tmp/scratchpad.md -c "set spelllang=fr"'
alias lvim='\vim -c "set nowrap|syntax off"'        # fast vim for big files / big oneliner

# +-----+
# | Git |
# +-----+

alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gpraise='git blame'
alias gpo='git push origin'
alias gpof='git push origin --force-with-lease'
alias gpofn='git push origin --force-with-lease --no-verify'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias grb='git branch -r'                                                                           # display remote branch
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --oneline'
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias gsub="git submodule update --remote"                                                        # pull submodules
alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)

alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)


alias color="sh $ZDOTDIR/colortest.sh"

sh_remote(){
    wget $1 -O - | bash
}

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
