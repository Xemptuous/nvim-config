# Keybinds and Features


## Telescope
A helper for fuzzy-finding various things recursively 
from cwd (and help files/buffers)
### Keybindings
<pre>
    <kbd>ff</kbd>: fuzzyfind
    <kbd>fg</kbd>: live_grep
    <kbd>fb</kbd>: buffers
    <kbd>fh</kbd>: help_tags
</pre>

## CodeWindow
A side-bar mini window that shows a braille-reduced version
of a "minimap". Shows errors and TS highlighting, as well
as offering navigations and current cursor positions.

### Keybindings

<pre>
    <kbd>leader-mo</kbd>: Open
    <kbd>leader-mc</kbd>: Close
    <kbd>leader-mf</kbd>: Toggle Focus
    <kbd>leader-mm</kbd>: Toggle Open/Close
</pre>


## NerdTree
A file-navigations helper to make nvim into a full-fledged IDE!

### Keybindings
<pre>
    <kbd>Ctrl-t</kbd>: Toggle NERDTree
    <kbd>F8</kbd>: Toggle Tagbar (right-side helper showing current file debug info)
</pre>

### Vim Commands
`:NERDTreeToggle`
  
`:NERDTreeCWD` Current directory
  
`:NERDTreeFind` fuzzy-finder for file/dir


## Toggle Term
A built-in terminal utilizing current shell (zsh in my case)
that can easily be toggled. 

### Keybindings
<pre>
    <kbd>Alt-t</kbd>: Toggle Terminal
</pre>

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
<pre>
    <kbd>leader-gg</kbd>: Open LazyGit
</pre>
##### Global:
<pre>
    <kbd>P</kbd>: Push
    <kbd>p</kbd>: Pull
    <kbd>x</kbd>: Open Menu
    <kbd>R</kbd>: Refresh
    <kbd>m</kbd>: Merge/Rebase options
</pre>

##### Commit:
<pre>
    <kbd>c</kbd>: Checkout File
    <kbd>d</kbd>: Discard commit's changes to specified file
    <kbd>o</kbd>: Open File
    <kbd>e</kbd>: Edit File
    <kbd>space</kbd>: Toggle File included in path
</pre>

full list of keybindings: https://github.com/jesseduffield/lazygit/blob/master/docs/keybindings/Keybindings_en.md

## Vim Surround
Super helpful commands to surround words/phrases

### Keybindings
<pre>
    <kbd>cs</kbd>: Change Surround - e.g., `cs"'` changes "Hello world!" to 'Hello world!'
    <kbd>cst</kbd>: Change Surround TO - e.g., `cst"` changes 'Hello world!' to "Hello world!"
    <kbd>ds</kbd>: Delete Surround - e.g., `ds"` changes "Hello world!" to Hello world!
    <kbd>ys</kbd>: "You" Surround
    <kbd>yst</kbd>: "You" Surround TO
    <kbd>ysf</kbd>: "You" Surround TO(Full)
    <kbd>ysiw</kbd>: "You" Surround Inner-Word - e.g., `ysiw[` over Hello changes Hello world! to [Hello] world!
    <kbd>yss</kbd>: "You" Surround Entire Line - e.g., `yssb`  changes Hello world! to (Hello world!)
    <kbd>S</kbd>: Visual Mode(useful for HTML) - surrounds entire selection with <> tags and closes appropriately
</pre>

  
## Comment

### Keybindings
<pre>
    <kbd>gcc</kbd>: Comment w/ . supports
    <kbd>gbc</kbd>: Block Comment w/ . supports
    <kbd>[#]gcc</kbd> Comment # of lines
    <kbd>gc$, gcw, gciw, gc2j, gc4k, etc.</kbd>
</pre>


## Visual Multi
  
Feature which allows multiple cursors to be created if desired,
as well as various functionality (incl regex matching, text shifting,
number creation, etc.)

### Keybindings

<pre>
    <kbd>Ctrl-n</kbd>: Regex match word over cursor and select next for Visual-Multi mode
    <kbd>Ctrl-up, Ctrl-down</kbd>: Create cursors vertically
    <kbd>Shift-left, Shift-right</kbd>: Select range one character at a time
    <kbd>Tab</kbd>: Toggle between Normal and Extended mode (more like visual)
    <kbd>n N</kbd>: Get next/previous occurence
    <kbd>[]</kbd>: Select next/previous cursor
    <kbd>q</kbd>: Skip current and get next occurence
    <kbd>Q</kbd>: Remove current cursor/selection
</pre>

full list of mappings: https://github.com/mg979/vim-visual-multi/wiki/Mappings

