# NeoVim Cheatsheet

## Movement
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

## Search
```bash
/{string}           search for string
n                   go to next search result
N                   go to previous search result
```

## Editing
```bash
y                   copy current highlight
yy                  copy current line
yiw                 copy current word
d{motion}           cut
p                   paste after cursor
P                   paste before cursor
x                   delete current character
dw                  delete current word
dd                  delete current line
<number>dd          delete <number> lines
r                   replace current character
cw                  delete curent word and go into insert mode
cc                  delete current line and go into insert mode
u                   undo changes
Ctrl + r            restore the undo
```
