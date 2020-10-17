scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:fzfyml = "fzfyml run"
let s:yaml = expand('<sfile>:p:h') . "/RecentUse.yml"
let s:temp = tempname()

function! RecentUse#RecentUse()
    if has('nvim')
        let s:tmpfile = tempname()
        function! OnFzfExit(job_id, data, event)
            bd!
            execute("args " .  join(readfile(s:tmpfile), " "))
            redraw!
        endfunction
        call delete(s:tmpfile)
        enew
        setlocal statusline=fzf
        setlocal nonumber
        call termopen(s:fzfyml . " " . s:yaml . " > " . s:tmpfile, {'on_exit': 'OnFzfExit'})
        startinsert
    else
        let out = system("tput cnorm > /dev/tty; " . s:fzfyml . " " . s:yaml . " 2>/dev/tty")
        execute("args " . out)
        redraw!
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

