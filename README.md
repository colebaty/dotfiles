# Purpose

My working environment has evolved to span multiple \*nix-based machines. This
repo is intended to ease synchronization of dotfiles across many machines so
that the working environment is as similar as possible across all machines.

# Installation - in progress

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
- [ ] store repo on home lab server?

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

## Structure 

Two types of functionality: local and remote

### Local

A manifest - a list of dotfiles in `~` that we're monitoring for changes. 

#### Sample tab-delimited file manifest file
```
<FOI>   <date of last edit> <machine last pushed from>
.tmux.conf  1633389432  Macbook-Pro.local
```

Each line contains the name of the FOI, the (epoch) date of last modification,
and the name of the node it was pushed from.  We assume all FOIs are located in `~`.

Manifest, local copies of files of interest (FOIs) are stored in `~/.dotfiles`.

Periodically polls `~` for changes; compares output of `date -j -f "%a %b %d %T %Z %Y" "`date -r <FOI>`" "+%s"` 
to the corresponding FOI's date of last push to the repo. This command comes straight 
from the `man` page for the `date` command. 

If the local file is newer, push it to the repo. If the remote counterpart is newer, pull it.

Could probably leverage `git` functionality for a lot of this.

#### Getting file info
```bash
date -j -f "%a %b %d %T %Z %Y" "`date -r <FOI>`" "+%s"  # get epoch date of FOI
uname -m                                                # node name
```

May want to consider maintaining a list of hosts/nodenames allowed to push to
repo.

## Flow

New instance;
clone -> install -> pull/update

# dotfiles
dotfile repo for easy synchronization across multiple machines
