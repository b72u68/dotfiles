# wsl-dotfiles
Personal configuration for bash shell, tmux, windows terminal, and NeoVim (or Vim)
> This cheatsheet is summarized from personal experience and other online tutorials. It should not be considered as an official advice.

## Tmux
### Session
Start new session:
    tmux
Start new session 
    tmux new -s myname
Attach:
    tmux a
Attach to specific session:
    tmux a -t myname
List sessions:
    tmux ls
Kill specific session:
    tmux kill-session -t myname
Kill other sessions except working session:
    tmux kill-session -a

### Windows
Kill specific window:
    tmux kill-window -t myname
Kill other windows except working window:
    tmux kill-window -a

### Important Shortcuts and Remapping
```bash
Ctrl + a            prefix (default prefix is Ctrl + c)
prefix + |          split window vertically
prefix + -          split window horizontally
prefix + r          load configuration file
Alt + left          switch to left pane
Alt + right         switch to right pane
Alt + up            switch to upper pane
Alt + down          switch to lower pane
prefix + Ctrl + c   create new session
```

## NeoVim (Vim)
### Movement
```bash
gg                  go to top of page
G                   go to the bottom of page
w                   go to the beginning of next word
b                   go the beginning of previous word
<number>gg          go to line <number>
0                   go the beginning of line
$                   go to end of line
}                   go to next paragraph
{                   go to previous paragraph
g;                  go to previous edit
```

### Search
```bash
/{string}           search for string
n                   go to next search result
N                   go to previous search result
```

### Copy and Paste
```bash
y                   copy current highlight
yy                  copy current line
yiw                 copy current word
d{motion}           cut
p                   paste after cursor
P                   paste before cursor
```

### Delete
```bash
x                   delete current character
dw                  delete current word
dd                  delete current line
<number>dd          delete <number> lines
```

### Replace
```bash
r                   replace current character
cw                  delete curent word and go into insert mode
cc                  delete current line and go into insert mode
```
