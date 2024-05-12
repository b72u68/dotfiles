# Tmux Cheatsheet

## Session

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

## Windows

Kill specific window:

    tmux kill-window -t myname

Kill other windows except working window:

    tmux kill-window -a

## Important Shortcuts and Remapping

```bash
Ctrl + a            prefix (default prefix Ctrl + c)
prefix + |          split window vertically
prefix + -          split window horizontally
prefix + r          load configuration file
Alt + left          switch to left pane
Alt + right         switch to right pane
Alt + up            switch to upper pane
Alt + down          switch to lower pane
prefix + Ctrl + c   create new session
```
