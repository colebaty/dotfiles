# Dotfiles

This repo is a fork of [Nick Nisi's dotfiles
repo](https://github.com/nicknisi/dotfiles), in spirit if not in fact.

I often find myself working on multiple \*nix machines on a given day, and the
goal of this project is to quickly deploy my configuration files and plugins for 
utilities like `tmux` and `vim` so that I can work in an environment I'm accustomed to.

This is still a work in progress which has been on the back burner as I'm
working through school.  I'm hoping to finish this by the end of Summer 2024.


# Development Notes

Dotfiles repo

the file `vim/vimrc.symlink` assumes you've got the vim [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) plugin installed
otherwise, just use vimrc-basic.symlink

The `install.sh` script **is not ready to go** - I've just been symlinking manually

```bash
ln -sf /dotfiles/path/to/symlink/file .dotfile-in-home-dir
```


## Recommended minimum shell stuff

```bash
ln -sf dotfiles/aliases.symlink .bash_aliases
ln -sf dotfiles/bash/bashrc.symlink .bashrc
ln -sf dotfiles/env.symlink .profile
```

## Others I use everywhere

```bash
# tmux
ln -sf dotfiles/tmux/tmux.conf.symlink .tmux.conf

#vim

# requires YouCompleteMe

ln -sf dotfiles/vim/vimrc.symlink .vimrc



# for use if you're not gonna do a whole YCM install

ln -sf dotfiles/vim/vimrc-basic.symlink .vimrc  
```

