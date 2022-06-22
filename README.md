# My own neovim configuration

## Usage

### Install [packer.vim](https://github.com/wbthomason/packer.nvim)
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Make symbol links
```sh
ln -s path/to/repo/vimrc ~/.config/nvim/init.vim
ln -s path/to/repo/lua ~/.config/nvim/lua
```

### Install language server
  * clangd
  * rust-analyzer
  * gopls
  * pyright
  * tsserver

### Install plugins
```vim
:PackerSync
```

