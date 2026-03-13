cat > install.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Instalando dotfiles..."

# ─── HOMEBREW ────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "📦 Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ─── PACOTES ─────────────────────────────────────────────────────────
echo "📦 Instalando pacotes..."
brew install starship zoxide fzf eza bat zinit neovim
brew install --cask font-jetbrains-mono-nerd-font iterm2 visual-studio-code

# ─── ZSH ─────────────────────────────────────────────────────────────
echo "⚙️  Configurando zsh..."
cp zsh/.zshrc ~/.zshrc

# ─── STARSHIP ────────────────────────────────────────────────────────
echo "⚙️  Configurando Starship..."
mkdir -p ~/.config
cp starship/starship.toml ~/.config/starship.toml

# ─── NEOVIM ──────────────────────────────────────────────────────────
echo "⚙️  Configurando Neovim..."
mkdir -p ~/.config/nvim
cp nvim/init.vim ~/.config/nvim/init.vim

# ─── VSCODE ──────────────────────────────────────────────────────────
echo "⚙️  Configurando VSCode..."
mkdir -p ~/Library/Application\ Support/Code/User
cp vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo "📦 Instalando extensões VSCode..."
code --install-extension dracula-theme.theme-dracula
code --install-extension golang.go
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-python.python
code --install-extension ms-python.ruff
code --install-extension redhat.vscode-yaml
code --install-extension eamodio.gitlens
code --install-extension usernamehw.errorlens
code --install-extension PKief.material-icon-theme
code --install-extension streetsidesoftware.code-spell-checker

# ─── ITERM2 SHELL INTEGRATION ────────────────────────────────────────
echo "⚙️  Configurando iTerm2 Shell Integration..."
curl -sL https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# ─── FZF ─────────────────────────────────────────────────────────────
echo "⚙️  Configurando fzf..."
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish

echo ""
echo "✅ Dotfiles instalados com sucesso!"
echo "👉 Rode: source ~/.zshrc"
echo "👉 No VSCode: Cmd+Shift+P → 'Shell Command: Install code command in PATH'"
echo "👉 No iTerm2: Settings → Profiles → Text → seleciona JetBrainsMono Nerd Font"
echo "👉 No iTerm2: Settings → Profiles → Colors → importa o tema Dracula"
EOF

chmod +x install.sh
