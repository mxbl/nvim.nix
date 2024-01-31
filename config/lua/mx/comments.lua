--[[

usage in normal mode:

- [count]gcc - toggle count number of lines using linewise
- gc}        - toggle until the next blank line
- gcip       - toggle inside a paragraph
- gc}        - toggle until next blank line
- gca}       - toggle around curly brackets
- gc[oO]     - insert comment to the next/previous line and enter insert mode
- gcA        - insert comment at end of line

]]

require('Comment').setup {}
