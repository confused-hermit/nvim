# nvim
My nvim config

Requires minimum neovim 0.6

## Sumneko lua install 
```
mkdir ~/.config/nvim/ls 
cd ~/.config/nvim/ls
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

