#Dotfiles for OSX

##Creating the Repository

Create a directory called .dotfiles to hold all our configuration, and initialise it as an empty Git repository.

```
$ mkdir .dotfiles
$ cd .dotfiles
$ git init
```

Copy in the configuration files we want to track, and drop symbolic links to them from where they used to be, so that the applications concerned read them correctly.

```
$ cd
$ mv .vim .dotfiles/vim
$ mv .vimrc .dotfiles/vimrc
$ mv .screenrc .dotfiles/screenrc
$ mv .gitconfig .dotfiles/gitconfig
$ ln -s .dotfiles/vim .vim
$ ln -s .dotfiles/vimrc .vimrc
$ ln -s .dotfiles/screenrc .screenrc
$ ln -s .dotfiles/gitconfig .gitconfig
```

Drop into the .dotfiles directory, add everything to the staging area, and commit it:

```
 cd .dotfiles
$ git add *
$ git commit -m "First commit of dotfiles."
```

##Cloning onto another machine

When you’re working with a new machine onto which you’d like to clone your configuration, you clone the repository from GitHub, and delete any existing versions of those files in your home directory to replace them with symbolic links into your repository, like so:

```
$ git clone git@github.com:tejr/dotfiles.git .dotfiles
$ rm -r .vim .vimrc .screenrc .gitconfig
$ ln -s .dotfiles/vim .vim
$ ln -s .dotfiles/vimrc .vimrc
$ ln -s .dotfiles/screenrc .screenrc
$ ln -s .dotfiles/gitconfig .gitconfig
```

