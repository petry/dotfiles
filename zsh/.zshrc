# ─── PERFORMANCE: mede o tempo de startup (descomente pra debugar) ───
# zmodload zsh/zprof

# ─── HISTÓRICO ───────────────────────────────────────────────────────
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ─── COMPLETION ENGINE (deve vir antes dos plugins) ──────────────────
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi
zstyle ':completion:*' matcher-list 'm:{a-z}=A-Z'   # case-insensitive
zstyle ':completion:*' menu select                   # menu navegável


# ─── ZINIT (plugin manager) ──────────────────────────────────────────
source /opt/homebrew/opt/zinit/zinit.zsh  # Intel Mac: /usr/local/...

# Plugins com lazy loading — não travam o startup
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab  # tab completion com fzf

# ─── FZF ─────────────────────────────────────────────────────────────
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ─── ZOXIDE (substitui cd) ───────────────────────────────────────────
eval "$(zoxide init zsh)"

# ─── ALIASES ─────────────────────────────────────────────────────────
alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias tree='eza --tree --icons'
alias cat='bat --style=auto'
alias cd='z'  # usa zoxide

# Git shortcuts
alias gs='git status'
alias gl='git log --oneline --graph --decorate -10'
alias gd='git diff'

# ─── STARSHIP PROMPT (sempre por último) ─────────────────────────────
eval "$(starship init zsh)"

# ─── ITERM2 SHELL INTEGRATION ────────────────────────────────────────
# Shell Integration — habilita marcadores de comando, upload/download de arquivos e o status do último comando direto na gutter:
# curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

source ~/.iterm2_shell_integration.zsh


# ─── NEOVIM  ─────────────────────────────────────────────────────────
# adiciona no .zshrc
alias v='nvim'
alias vi='nvim'
alias vim='nvim'


# ─── CORES ───────────────────────────────────────────────────────────
# EZA_COLORS — paleta Dracula (256 colors)
export BAT_THEME="Dracula"
export EZA_COLORS="\
di=1;38;5;141:\
ex=1;38;5;84:\
fi=0;38;5;253:\
ln=1;38;5;117:\
or=1;38;5;203:\
*.js=0;38;5;228:\
*.ts=0;38;5;228:\
*.jsx=0;38;5;228:\
*.tsx=0;38;5;228:\
*.css=0;38;5;212:\
*.scss=0;38;5;212:\
*.html=0;38;5;215:\
*.json=0;38;5;117:\
*.md=0;38;5;84:\
*.yml=0;38;5;117:\
*.yaml=0;38;5;117:\
*.toml=0;38;5;117:\
*.png=0;38;5;212:\
*.jpg=0;38;5;212:\
*.svg=0;38;5;212:\
*.go=0;38;5;117:\
*.sh=0;38;5;84:\
*.env=0;38;5;203:"


