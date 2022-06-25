# devenv

ZSH and NeoVim environment, containerized.

## Usage

Begin by cloning this repo

    git clone https://github.com/joshwbrick/devenv.git
    cd devenv

Copy the example `env` file to the path `.env`. The edit the file to contain the desired values.

    cp env.example .env
    nvim .env

Add your dotfiles to the `dotfiles/` directory. You can checkout another repo directly in that directory. For example:

    cd dotfiles
    git clone https://github.com/user/dotfiles.git

Run the build and docker will begin creating the image using your environment variables.

    make build

If they do not exist this will create three required files in the `dotfiles` directory. The required files are called `setup.sh`,
`init.vim` and `zshrc` and must be in the root of the `dotfiles` directory. You may include any other files or directories as well.
These will be made available in the container at `~/all_dotfiles`.

`setup.sh` can contain any shell code to install or setup your peronsal shell or vim environment. For example, in mine I
install vim-plug and setup a PHP 8 development environment. `init.vim` should contain your vim config and `zshrc` should contain
setup for zsh like your personal environment variables, aliases, functions, etc.

