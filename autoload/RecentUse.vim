scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:fzfyml = "fzfyml run"
let s:yaml = expand('<sfile>:p:h') . "/RecentUse.yml"
let s:temp = tempname()

function! RecentUse#RecentUse()
    let out = system("tput cnorm > /dev/tty; " . s:fzfyml . " " . s:yaml . " 2>/dev/tty")
    execute("args " . out)
    redraw!
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

