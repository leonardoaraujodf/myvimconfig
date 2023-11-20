# Using GDB under VIM
- Place a .gdbinit file under ~/.gdbinit with the following content:

```
set auto-load safe-path /
```

- Under the C++ project, place a .gdbinit file with the following content:

```
file <executable-name>
break main

define hook-run
    run <arg1> <arg2>
end
```

- Open the .cpp file with vim, or if you need to execute your app as sudo, you could start vim preserving the current user .vimrc
using

```
sudo -E vim <application-file>.cpp
```

- Launch the gdb using the command :Termdebug under vim
- When the gdb got launched, type run.
