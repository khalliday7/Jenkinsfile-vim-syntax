# Jenkinsfile-vim-syntax
A plugin that enables Jenkins DSL job syntax coloring + indentation.
This project was forked from
[this repository](https://github.com/martinda/Jenkinsfile-vim-syntax),
the syntax highlighting I originally used for Jenkinsfile. This project differs
from its parent repository in its method of highlighting. The original project
highlighted on keyword alone. This project highlights based on keyword
and depth in the nested pipeline structure. In this implementation, all
keywords in the same level of the nested structure are highlighted in the
same manner.

## Installation
Install using your favorite vim plugin manager. Below I use vim-plug as an
example.

```javascript
call plug#begin('~/.vim/plugged')

Plug 'khalliday7/Jenkinsfile-vim-syntax'

call plug#end()
```
