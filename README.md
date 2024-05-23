My Dotfiles

Install Brew:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install oh-my-zsh:

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install powerlevel10k, autosuggestions, syntax-highlighting:

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Install required packages:

```
brew install neovim stow autojump fzf ripgrep pngpaste
```

Download into `~/.dotfiles` and from there run `stow .`, which will create symlinks. 
- if you have existing files like .zshrc or ~/.config/nvim/init.lua, etc, stow will fail. You need to delete them.
    - DANGER ZONE: you could technically use `--adopt` flag, but that will overwrite files under dotfiles with the ones being symlinked.
- files that exist on local machine, but not in this dotfiles directory will not be affected, even if theyre in a directory that is in dotfiles (so local file like ~/.config/abracadabra.txt will not be touched).

Following:
https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/

Other optional packages:
```
brew install golang
```
