:set tabstop=4
:set number
:set relativenumber
:set mouse=a
:set noswapfile
:set ignorecase
:set smartcase

" highlight trailing whitespace (and spaces before tabs) in red
highlight ExtraWhitespace ctermbg=red guibg=red
augroup extrawhitespace
  autocmd!
  autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  " don't nag while you're mid-typing at the end of a line
  autocmd BufWinEnter,InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd BufWinLeave * call clearmatches()
augroup END

" reload files changed on disk (e.g. by an agent editing them under you)
:set autoread
:set updatetime=250
augroup autoreload
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * silent! checktime
  autocmd FileChangedShellPost * echohl WarningMsg
        \ | echo "file changed on disk, buffer reloaded"
        \ | echohl None
augroup END

" CursorHold only fires once per idle period, so poll on a real timer too
if has('timers')
  function! s:AutoChecktime(timer) abort
    if mode() ==# 'n'
      silent! checktime
    endif
  endfunction
  call timer_start(500, function('s:AutoChecktime'), {'repeat': -1})
endif
