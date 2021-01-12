# Simplerun.vim

A simple script for `nvim` that runs your script in a `vsplit` terminal buffer.

## Usage

### Define your custom command

```
command! Top call simplerun#toggle("top")
```

### Define a custom function to open a new window

Open a new floating window with `Floaterm`

```
    function! Simplerun_winfunc(command)
        execute 'FloatermNew ' . a:command
    endfunction

    let g:simplerun_winfunc='Simplerun_winfunc'
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
