if exists("g:loaded_simplerun") || &cp
  finish
endif

let g:loaded_simplerun = 1
let s:keepcpo = &cpo
set cpo&vim

let s:simplerun_cmds = {
            \ 'python': 'python',
            \ 'sh': 'bash',
            \ 'javascript': 'node',
            \ 'make': 'make --always-make --silent -f',
            \ 'lua': 'lua'
            \ }

if exists("g:simplerun_commands")
    call extend(g:simplerun_commands, s:simplerun_cmds, 'keep')
else
    let g:simplerun_commands = s:simplerun_cmds
endif

let &cpo = s:keepcpo
unlet s:keepcpo
