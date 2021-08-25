# Purpose

My working environment has evolved to span multiple \*nix-based machines. This
repo is intended to ease synchronization of dotfiles across many machines so
that the working environment is as similar as possible across all machines.

# Installation

```bash
$ git clone git@github.com:colebaty/dotfiles.git
$ cd dotfiles/
$ chmod 755 install.sh
$ ./install.sh
```
Note: Since this repo is private, for VMs it will be easiest to generate a new
key pair and register with GitHub.

# Goals

- [ ] configure dotfiles for acceptable minimum standard workable across:
    - [ ] Parrot OS
    - [ ] Kali
    - [ ] Ubuntu 20.01
    - [ ] MacOS
- [ ] desired programs across all platforms
    - [ ] zsh
    - [ ] oh-my-zsh
    - [ ] tmux
    - [ ] vim

## Configuration files

### zsh

General path to oh-my-zsh installation

Option 1 - should work if $HOME is present in each systems environment
```bash
export ZSH="$HOME"
```

Option 2 - environment-specific
```bash
# test for environment
if $(uname -a) == "Darwin" # macOS
    do export ZSH="$HOME/.oh-my-zsh"
elif $(uname -a == {{ UBUNTU }})
    do export ZSH=""/home/$(whoami)/.oh-my-zsh"
fi
```

### oh-my-zsh

### tmux

### vim

## Flow

New User:
clone -> install -> 

# dotfiles
dotfile repo for easy synchronization across multiple machines
