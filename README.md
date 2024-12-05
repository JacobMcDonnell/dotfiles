# Dotfiles

## Folders in Home Folder

- `~/personal/`: Holds Personal Folders that are created by `run` script
    - `bin/`: Holds all executables; Things are copied here only, no changes
    - `plan9/`: Plan9Port
    - `neovim/`: Neovim source; binaries go to `bin/`
    - `dotfiles/`: Dotfiles are edited here & copied to correct location
    - `notes/`: Personal Notes repository

## Install

First execute `./run` which will handle things like installing Neovim & P9P.
Next to copy the files to the proper directory, run `./dev-env`, which will
copy config files to `~/.config/` folder and executables to `~/personal/bin/`.

