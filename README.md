# Keybinds and Features


## Telescope
A helper for fuzzy-finding various things recursively 
from cwd (and help files/buffers)
### Keybindings

`ff` fuzzyfind

`fg` live_grep

`fb` buffers

`fh` help_tags


## CodeWindow
A side-bar mini window that shows a braille-reduced version
of a "minimap". Shows errors and TS highlighting, as well
as offering navigations and current cursor positions.

### Keybindings
`<leader>mo` Open
  
`<leader>mc` Close
  
`<leader>mf` Toggle Focus
  
`<leader>mm` Toggle Open/Close


## NerdTree
A file-navigations helper to make nvim into a full-fledged IDE!

### Keybindings
`Ctrl-t` Toggle NERDTree
  
`F8` Toggle Tagbar (right-side helper showing current file debug info)

### Vim Commands
`:NERDTreeToggle`
  
`:NERDTreeCWD` Current directory
  
`:NERDTreeFind` fuzzy-finder for file/dir


## Toggle Term
A built-in terminal utilizing current shell (zsh in my case)
that can easily be toggled. 

### Keybindings
`<A-t>` Toggle Terminal

### Vim Commands
`:ToggleTerm` (size=n)(dir=/)(direction={horizontal,vertical})
  
`:ToggleTermToggleAll` opens and closes all terminals at once
  
`:TermExec` runs the terminal with specified command e.g., `2TermExec cmd="git status" dir=~/<my-repo-path>` will run git status in terminal 2
  
##### Sending Lines:
`:ToggleTermSendCurrentLine <T_ID>:` sends the whole line where you are standing with your cursor

`:ToggleTermSendVisualLines <T_ID>:` sends all the (whole) lines in your visual selection
    
`:ToggleTermSendVisualSelection <T_ID>:` sends only the visually selected text

## LazyGit
Makes Git super lazy and simple with a GUI

### Keybindings
`\<leader>gg` Open LazyGit

## Vim Surround
Super helpful commands to surround words/phrases

### Keybindings
`cs` Change Surround - e.g., `cs"'` changes "Hello world!" to 'Hello world!'

`cst` Change Surround TO - e.g., `cst"` changes 'Hello world!' to "Hello world!"

`ds` Delete Surround - e.g., `ds"` changes "Hello world!" to Hello world!

`ys` "You" Surround
  
`yst` "You" Surround TO
  
`ysf` "You" Surround TO(Full)
  
`ysiw` "You" Surround Inner-Word - e.g., `ysiw[` over Hello changes Hello world! to [Hello] world!

`yss` "You" Surround Entire Line - e.g., `yssb`  changes Hello world! to (Hello world!)

`S` Visual Mode(useful for HTML) - surrounds entire selection with <> tags and closes appropriately

  
## Comment

### Keybindings
`gcc` Comment w/ . supports
  
`gbc` Block Comment w/ . supports
  
`[#]gcc` Comment # of lines
  
`gc$, gcw, gciw, gc2j, gc4k, etc.`



## Visual Multi
  
Feature which allows multiple cursors to be created if desired,
as well as various functionality (incl regex matching, text shifting,
number creation, etc.)

### Keybindings

`Ctrl-n` Regex match word over cursor and select next for Visual-Multi mode
  
`Ctrl-up, Ctrl-down` Create cursors vertically
  
`Shift-left, Shift-right` Select range one character at a time
  
`Tab` Toggle between Normal and Extended mode (more like visual)
  
`n N` Get next/previous occurence
  
`[]` Select next/previous cursor
  
`q` skip current and get next occurence
  
`Q` remove current cursor/selection

full list of mappings: https://github.com/mg979/vim-visual-multi/wiki/Mappings

