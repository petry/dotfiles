# dotfiles 🚀

Setup completo de terminal e ferramentas para macOS — tema Dracula, performance first.

## O que está incluído

| Ferramenta | Função |
|---|---|
| **zsh + zinit** | Shell com plugin manager leve |
| **Starship** | Prompt rápido (Rust) com tema Dracula |
| **eza** | `ls` moderno com ícones e cores |
| **bat** | `cat` com syntax highlighting |
| **fzf** | Fuzzy finder (Ctrl+R turbinado) |
| **zoxide** | `cd` inteligente com histórico |
| **Neovim** | Editor leve pra configs e scripts |
| **VSCode** | IDE com extensões para Go, TS, Python e YAML |

---

## Instalação

### Novo Mac — do zero

```bash
git clone git@github.com:petry/dotfiles.git ~/dotfiles
cd ~/dotfiles && bash install.sh
```

O script instala automaticamente: Homebrew, todos os pacotes, fontes, extensões do VSCode e aplica todas as configurações.

### Passos manuais após o install.sh

**iTerm2**

1. `Settings → Profiles → Text → Font` → seleciona **JetBrainsMono Nerd Font**
2. `Settings → Profiles → Colors → Color Presets → Import` → importa `extras/Dracula.itermcolors`
3. `Settings → Profiles → Keys → Key Mappings → Presets` → **Natural Text Editing**
4. `Settings → General → Magic` → ativa **GPU Rendering**
5. `Settings → Profiles → Terminal → Scrollback Lines` → **10000** (desativa Unlimited)

**VSCode**

```
Cmd+Shift+P → Shell Command: Install 'code' command in PATH
```

---

## Estrutura

```
dotfiles/
├── install.sh              ← script de instalação completo
├── zsh/
│   └── .zshrc              ← config do zsh com zinit, fzf, zoxide e aliases
├── starship/
│   └── starship.toml       ← prompt inline, tema Dracula
├── nvim/
│   └── init.vim            ← neovim minimalista para configs e scripts
├── vscode/
│   └── settings.json       ← tema, extensões e performance
└── extras/
    └── Dracula.itermcolors ← tema oficial Dracula para iTerm2
```

---

## Manter atualizado

Após qualquer alteração nos arquivos de config, rode:

```bash
dotfiles-sync
```

O alias copia os arquivos modificados, commita e faz push automaticamente. Ele está definido no `.zshrc`:

```zsh
alias dotfiles-sync='cd ~/dotfiles && \
  cp ~/.zshrc zsh/.zshrc && \
  cp ~/.config/starship.toml starship/starship.toml && \
  cp ~/.config/nvim/init.vim nvim/init.vim && \
  git add . && git commit -m "chore: sync dotfiles" && git push && cd -'
```

---

## Detalhes do setup

### zsh

- **zinit** como plugin manager com lazy loading (startup ~50–80ms)
- **compinit** com cache de 24h para não penalizar o startup
- **fzf-tab** — Tab completion com menu visual
- **zsh-autosuggestions** — sugestões baseadas no histórico
- **fast-syntax-highlighting** — mais rápido que o padrão

### Starship

Prompt inline (sem quebra de linha), com informações de diretório, branch Git, status e linguagem ativa. Configurado com a paleta exata do Dracula via hex:

| Elemento | Cor |
|---|---|
| Diretório | `#BD93F9` (roxo) |
| Git branch | `#FF79C6` (rosa) |
| Git status | `#FF5555` (vermelho) |
| Go | `#8BE9FD` (ciano) |
| Node.js | `#50FA7B` (verde) |

### VSCode — extensões instaladas

| Extensão | Função |
|---|---|
| `dracula-theme.theme-dracula` | Tema |
| `PKief.material-icon-theme` | Ícones |
| `golang.go` | Suporte Go |
| `dbaeumer.vscode-eslint` | Lint JS/TS |
| `esbenp.prettier-vscode` | Formatter |
| `ms-python.python` | Suporte Python |
| `ms-python.ruff` | Linter Python rápido |
| `redhat.vscode-yaml` | Suporte YAML |
| `eamodio.gitlens` | Git avançado |
| `usernamehw.errorlens` | Erros inline |
| `streetsidesoftware.code-spell-checker` | Spell check |

### Performance — o que foi desabilitado

| Item | Motivo |
|---|---|
| Minimap no VSCode | Redesenha constantemente |
| `autoUpdate` de extensões | Downloads em background |
| `followSymlinks` na busca | Varre `node_modules` |
| `telemetry` do VSCode | Requests desnecessários |
| GitLens CodeLens | Pesado em repos grandes |
| `add_newline` no Starship | Remove espaço entre prompts |
| Scrollback ilimitado no iTerm2 | Consumo de memória em sessões longas |

---

## Atalhos úteis

| Atalho | Ação |
|---|---|
| `Ctrl+R` | Busca no histórico com fzf |
| `Tab` | Completion com menu visual (fzf-tab) |
| `z <nome>` | Navega para diretório pelo histórico |
| `ll` | `eza -lah` com ícones e git status |
| `tree` | Árvore de diretórios com ícones |
| `gs` | `git status` |
| `gl` | `git log` compacto com grafo |
| `v <arquivo>` | Abre no Neovim |

---

## Referências

- [Starship](https://starship.rs)
- [zinit](https://github.com/zdharma-continuum/zinit)
- [eza](https://github.com/eza-community/eza)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [Dracula Theme](https://draculatheme.com)
- [iTerm2 Shell Integration](https://iterm2.com/documentation-shell-integration.html)
