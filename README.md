# Store my VIM related files

This is *based* on this VIMRC tutorial:
https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

I got tired of losing my .vimrc and related config files all the time.
When I'm improving my learning curve about VIM, having all sort of fancy
plugins and configurations working smoothly together, I suddenly lose
all of the them.

So I'm gonna store them in this repo now, and as the config improves, this
repo will improve too.

So if you are looking around and want to experiment the amazing lightweight vim text editor go ahead
and pull out those files. Have fun :)

[Setup GDB under VIM](gdb_vim.md)

# ctags

Using Debian based distribution, install ctags

```bash
sudo apt-get install universal-ctags
```

Create a .ctags file under your home directory
```bash
touch ~/.ctags
```

Add the following content to it:
```bash
--recurse=yes
--exclude=.git
--exclude=BUILD
--exclude=.svn
--exclude=*.js
--exclude=vendor/*
--exclude=node_modules/*
--exclude=db/*
--exclude=log/*
--exclude=\*.min.\*
--exclude=\*.swp
--exclude=\*.bak
--exclude=\*.pyc
--exclude=\*.class
--exclude=\*.sln
--exclude=\*.csproj
--exclude=\*.csproj.user
--exclude=\*.cache
--exclude=\*.dll
--exclude=\*.pdb
```

Now under your source code, just type:
```
ctags
```

ctags basic commands could be found [here](https://courses.cs.washington.edu/courses/cse451/10au/tutorials/tutorial_ctags.html).

# cscope

Install cscope
```bash
sudo apt-get install cscope
```

Go to your source code and run the following command:
```bash
find . -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" > cscope.files
```

Build the reference database:
```bash
cscope -q -R -b -i cscope.files
```

Now follow [this tutorial](https://cscope.sourceforge.net/cscope_vim_tutorial.html) to use cscope under vim (basically you just need to copy the .vim folder to your home directory).
