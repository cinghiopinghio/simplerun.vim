function! simplerun#toggle(...)

    " create a buffer list
    if !exists('b:simplerun_buflist')
        let b:simplerun_buflist = {}
    endif

    if a:0 == 1
        let l:command = a:1
    else
        let l:command = simplerun#getCommand()
    endif

    " if exists, delete the buffer
    if has_key(b:simplerun_buflist, l:command) && bufwinnr(b:simplerun_buflist[l:command]) > 0
        let l:buff=remove(b:simplerun_buflist, l:command)
        exec 'bdelete! ' . l:buff
    endif

    " create a vsplit with a terminal
    vsplit
    exec 'terminal ' . l:command
    let l:thisbuf = winbufnr(0)

    " stay at the bottom
    execute "normal G"

    " go back to the previous window
    wincmd p

    " add this buffer to the list
    let b:simplerun_buflist[l:command] = l:thisbuf
endfunction


function! simplerun#getCommand()

    if has_key(g:simplerun_commands, &filetype)
        let cmd = g:simplerun_commands[&filetype] . ' ' . expand('%')
    else
        let cmd = 'make'
    endif

    return cmd
endfunction
