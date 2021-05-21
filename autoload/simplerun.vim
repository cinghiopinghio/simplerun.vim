function! simplerun#toggle(...)
    " Open or close the terminal

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
    call simplerun#create_window(l:command)
    let l:thisbuf = winbufnr(0)

    " stay at the bottom
    execute "normal G"

    " go back to the previous window
    wincmd p

    " add this buffer to the list
    let b:simplerun_buflist[l:command] = l:thisbuf
endfunction


function! simplerun#getCommand()
    " get the command to be run on the terminal
    if has_key(g:simplerun_commands, &filetype)
        let cmd =  'cd ' .. expand('%:p:h') .. '; time ' . g:simplerun_commands[&filetype] . ' ' . expand('%:p')
    else
        let cmd = 'make'
    endif

    return cmd
endfunction


function! simplerun#create_window(command)
    " Open a window from user function of vsplit
    " run a command in it
    if exists('g:simplerun_winfunc')
        execute 'call ' . g:simplerun_winfunc . '("'. a:command . '")'
        stopinsert
    else
        vsplit
        exec 'terminal ' . a:command
    endif
endfunction

