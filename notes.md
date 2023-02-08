# notes - install.sh

## structure

again, borrow from Nisi.

different profiles/modes/OSes/shells. each mode gets a dedicated dir in dotfiles, with
copies of required config files. will have to see how WSL handles this.

config files of selected mode are copied to ~/.config

appropriate files in ~ are symlinked to ~/.config/\<corresponding config file\>
