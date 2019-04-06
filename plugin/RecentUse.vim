scriptencoding utf-8
if exists('g:load_RecentUse')
    finish
endif
let g:load_RecentUse = 1

let s:save_cpo = &cpo
set cpo&vim

"nnoremap <silent> <Plug>(RecentUse) :<C-u>call RecentUse#RecentUse()<CR>
nnoremap <silent> <Tab>f :<C-u>call RecentUse#RecentUse()<CR>

let &cpo = s:save_cpo
unlet s:save_cpo
