# Simplerun.vim

A simple script for `nvim` that runs your script in a `vsplit` terminal buffer.


## Usage

### Define your custom command

```
command! Top call simplerun#toggle("top")
```

### Define a keymap

```
nnoremap <buffer> <F7> :call simplerun#toggle()<CR>
```

This will toggle the buffer (at each run the previous output will be cleared).

### Configuration

```
let g:simplerun_commands = {
            \ 'python': 'python',
            \ 'sh': 'bash',
            \ 'javascript': 'node',
            \ 'make': 'make --always-make --silent',
            \ 'lua': 'lua'
            \ }
```
