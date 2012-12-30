"=============================================================================
"     FileName: .vimrc
"         Desc: my .vimrc
"       Author: Mocker
"        Email: Zuckerwooo@gmail.com
"     HomePage: zuckonit.github.com
"      Version: 0.0.2
"   LastChange: 2012-12-08 13:00:39
"      History: rewrite this file and use vundle as a management tool
"=============================================================================

"----------------------------------------------------
"                 Key Map(self-define)
"----------------------------------------------------
"=====VMap======
"<Tab>          shift right
"<Shift-Tab>    shift left
"<leader>gg     google current word
"<leader>ggs    google current select
"
"======NMap=====
"<CTRL-S>       save current buffer
"<Shift-F8>     indent your code
"<leader>ggl    google current line
"<leader>we     get weather like
"<leader>sp     horizon slipt current window
"<leader>vsp    vertical split current window
"<leader>ts     replace tab with 4 space
"<F9>           toggle neocomplcache
"
"======IMap=====
"<leader>ts     replace tab with 4 space
"<CTRL-S>       save current buffer
"<CTRL-L>       unfold the snippet
"<CTRL-J>       jump between snippet breakpoints
"<F7>           toggle spell
"<F9>           toggle neocomplcache
"
"======CMap=====
":Emailit       email current buffer'content

"======FMap=====
"<F3>           toggle auto remove trim when save (default is off)
"<F4>           insert author info in front
"<F5>           run current file by call QuickRun()
"<F7>           toggle spell
"<F8>           toggle side window
"<F10>          generate ctags and cscope file
"<F12>          toggle menu
"


"----------------------------------------------------
"              your need install at first
"----------------------------------------------------
"======Linux====
"wmctrl        maximize gvim window
"astyle        indent your code
"sdcv          use stardict in vim
"ctags         ctags
"cscope        cscope

"======Windows==
"mingw         use gcc/g++ in windows
"
"as for others :
"              just set the ./tools/windows directory
"              into your environment

"----------------------------------------------------
"        this is for vundle
"----------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"use Vundle
Bundle 'gmarik/vundle'

"colorscheme
Bundle 'Zuckonit/colors-pack4vundle'

"syntax
Bundle 'vim-scripts/python.vim--Vasiliev'
Bundle 'othree/xml.vim'
Bundle 'vim-scripts/FencView.vim'
let g:fencview_autodetect = 1

"ftplugin
Bundle 'vim-scripts/pyfold'
Bundle 'kevinw/pyflakes-vim'

"other plugins
Bundle 'c9s/bufexplorer'
Bundle 'vim-scripts/winmanager--Fox'
"Bundle 'scrooloose/nerdtree.git'
Bundle 'msanders/snipmate.vim'
Bundle 'AutoClose--Alves'
Bundle 'mattn/zencoding-vim'
Bundle 'Zuckonit/Pydiction'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'vim-scripts/pylint.vim'
Bundle 'vim-scripts/a.vim'
Bundle 'vim-scripts/AuthorInfo'
Bundle 'mattn/calendar-vim'
Bundle 'vim-scripts/echofunc.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/pydoc.vim'
Bundle 'majutsushi/tagbar'
Bundle 'mikewest/vimroom'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/auto_mkdir'
Bundle 'gg/python.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'vim-scripts/open-browser.vim'
Bundle 'vim-scripts/sudo.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/DoxygenToolkit.vim.git'
Bundle 'gmarik/github-search.vim'
Bundle 'vim-scripts/fcitx.vim'
let g:github_search_path_format = '~/gitProjects/:repo'


Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
"let g:neocomplcache_snippets_dir="~/.vim/snippets"


"just for fun
Bundle 'uguu-org/vim-matrix-screensaver'

"self vim plugins
Bundle 'Zuckonit/self-vim-plugins'
"Bundle '~/Dropbox/repos/lucky-today.git'

filetype plugin indent on


if version >= 703
    au BufEnter * set cc=78
endif



"-----------------------------------------------------
"                   global
"-----------------------------------------------------
"windows or unix-like
if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif


"gui
if has("gui_running")
    let g:isguiruning=1
else
    let g:isguiruning=0
endif



"-----------------------------------------------------
"                    basic
"-----------------------------------------------------
set viminfo+=!
set history=10000
set tabstop=4
set smarttab
set vb t_vb=                                 "close the fucking bell
set nobackup
set noswapfile
set number
set ruler
set magic
set cursorline
hi cursorline guibg=NONE gui=underline
set cursorcolumn
set t_Co=256
set ambiwidth=double
set autochdir
set showmatch
set hidden
set winaltkeys=no
set iskeyword+=_,$,@,%,#,-
syntax enable
syntax on



"colorscheme
set background=dark
if g:isguiruning==1
    colorscheme ir_black
else
    colorscheme ir_black_term
endif


"when search
set ignorecase smartcase
set hlsearch
set incsearch


"distinguish tab and space
set list
set listchars=tab:>-,trail:-
set backspace=indent,eol,start


"encoding settings
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1,cp936
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
set langmenu=zh_CN.utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8


"toggle spell
nmap <F7> : call Spellit() <CR>
imap <F7> <esc>: call Spellit() <CR>
let g:is_spell_on=0
function Spellit()
    if g:is_spell_on == 0
        exec "set spell"
        echo "auto spell on"
        let g:is_spell_on=1
    else
        exec "set nospell"
        echo "auto spell off"
        let g:is_spell_on=0
    endif
endfunction



"format
set textwidth=80

"mouse
set selectmode+=mouse
set mouse=a


"status line
set statusline=%k%F[%{&ff}:%{&fenc}]%m%r%h%w\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %=[Line:%l/%L,Column%c]\ %=[%l,%c,%p%%]
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%] "contents in statusline
set laststatus=2  "always display statusline
set report=0      "report when anything is changed


"menu
set guioptions-=m
set guioptions-=T
nmap <silent> <F12> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"scroll bar
"in linux,install wmctrl at first
function Maximize_Window()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
if g:isguiruning == 1
    set guioptions-=L       "hide left scroll bar
    set guioptions-=r       "hide right scroll Bar
    if g:iswindows == 1
        au GUIEnter * simalt ~x "maximize when open vim
    else
        au GUIEnter * call Maximize_Window()
    endif
endif


"fullscreen in windows
if g:isguiruning==1
    if g:iswindows==1
        map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
    endif
endif

"font
if g:iswindows==1
    set gfw=Yahei_Consolas_Hybrid:h13
    set guifont=Monaco:h13
else
    set gfw=YaheiConsolasHybrid\ 10
    set guifont=Monaco\ 12 "set English font
endif


"----------------------------------------------------
"                       useful
"----------------------------------------------------
"indent by yourself,shift + tab <--- indent left , tab --> indent right
set shiftwidth=4
set softtabstop=4
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv


"restore last position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


"need not restart vim when you modify the config
"if iswindows==0
    "autocmd! BufWritePost .vimrc source %
"else
    "autocmd! BufWritePost _vimrc source %
"endif


"ctrl+s = save
map <C-s> :exec "w"<CR>
inoremap <C-s> <esc>:w<cr>


"remove trim
let g:auto_remove_whitespace=0
function! RemoveTrailingWhitespace()
    if g:auto_remove_whitespace == 1
        if &ft != "diff"
            let b:curcol = col(".")
            let b:curline = line(".")
            silent! %s/\s\+$//
            silent! %s/\(\s*\n\)\+\%$//
            call cursor(b:curline, b:curcol)
        endif
    endif
endfunction

function! ControlRemoveWhitespace()
    if g:auto_remove_whitespace == 0
        let g:auto_remove_whitespace = 1
        echo "auto remove whitespace turns on"
    else
        let g:auto_remove_whitespace = 0
        echo "auto remove whitespace turns off"
    endif
endfunction

nmap <silent> <F3> :call ControlRemoveWhitespace()<CR>
autocmd BufWritePre * call RemoveTrailingWhitespace()


"stardict + sdcv (install at first)
function! Mydict()
    let expl=system('sdcv -n ' .
                \  expand("<cword>"))
    windo if
                \ expand("%")=="diCt-tmp" |
                \ q!|endif
    25vsp diCt-tmp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
endfunction
if g:iswindows == 0
    map <silent> <leader>w :call Mydict()<CR>
endif



"shift between windows
nmap <silent> <C-n> :tabn<CR>
nmap <silent> <C-p> :tabp<CR>


au BufRead,BufNewFile {*.md,*.mkd,*.markdown}  set ft=markdown

"split
map <leader>sp :split<CR>
map <leader>vsp :vsplit<CR>

"----------------------------------------------------
"                    indent
"----------------------------------------------------
"autocmd Filetype c set equalprg=cindent
set cindent
set smartindent
set autoindent


"auto set expandtab expect snippet and shell filetype
au BufEnter * call AutoIndent()
func AutoIndent()
    if &filetype == 'snippet'
        set noexpandtab
    else
        set expandtab
    endif
endfunc


"replace tab with 4 space
map <leader>ts :%s/\t/    /g<CR>
inoremap <leader>ts <esc>:%s/\t/    /g<CR>



"use astyle to indent your code
"support c,cpp,perl,python,java,jsp,xml,html,htm
"so , install astyle at first
map <S-F8> :call FormartSrc()<CR>

func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle % –style=ansi –suffix=none %"
        exec "e! %"
    elseif &filetype == 'cpp'
        exec "!astyle % –style=ansi –suffix=none %"
        exec "e! %"
    elseif &filetype == 'perl'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'py'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'java'
        exec "!astyle –style=java –suffix=none %"
        exec "e! %"
    elseif &filetype == 'jsp'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'xml'
        exec "!astyle –style=gnu –suffix=none %
        exec "e! %"
    elseif &filetype == 'html'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    elseif &filetype == 'htm'
        exec "!astyle –style=gnu –suffix=none %"
        exec "e! %"
    endif
endfunc



"-----------------------------------------------------
"                        plugins
"-----------------------------------------------------
"neocomplcache
nmap <silent> <F9> :NeoComplCacheToggle <cr>
imap <silent> <F9> <esc> :NeoComplCacheToggle <cr>

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_wildcard = 1
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_max_list = 10
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_quick_match = 1
"let g:neocomplcache_disable_auto_complete = 1

"dict
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'css' : $VIMFILES.'/dict/css.dic',
    \ 'javascript' : $VIMFILES.'/dict/javascript.dic'
    \ }

set completeopt+=longest
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"


" open the snippet
imap <silent><C-l> <Plug>(neocomplcache_snippets_force_expand)
smap <silent><C-l> <Plug>(neocomplcache_snippets_force_expand)

"jump to next placeholder
imap <silent><C-j> <Plug>(neocomplcache_snippets_force_jump)
smap <silent><C-j> <Plug>(neocomplcache_snippets_force_jump)

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"


set completeopt=longest,menuone
set wildmenu
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype java set omnifunc=javacomplete#Complete

if !exists('g:neocomplcache_omni_patterns')
   let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'




"Nerdcommenter
let NERDShutUp=1

"change snipMate hotkey as Ctrl+Tab
ino <c-j> <c-r>=TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

"Quickrun
map <F5> :QuickRun<CR>
let g:quickrun_config = {}
let g:quickrun_config.html = {'command':'gnome-open'}
let g:quickrun_config.tex  = {'command':'pdflatex'}
let g:quickrun_config.markdown = {
  \ 'type': 'markdown/pandoc',
  \ 'cmdopt': '-s',
  \ 'outputter': 'browser'
  \ }


"supertab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"DoxygenToolkit
let g:DoxygenToolkit_authorName="Mocker, http://zuckonit.github.com"
let s:licenseTag = "Copyright(C)\<enter>"
"let s:licenseTag = s:licenseTag . "For free\<enter>"
"let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
"let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1



"zencoding
let g:user_zen_settings = {
            \  'indentation' : '  ',
            \  'perl' : {
            \    'aliases' : {
            \      'req' : 'require '
            \    },
            \    'snippets' : {
            \      'use' : "use strict\nuse warnings\n\n",
            \      'warn' : "warn \"|\";",
            \    }
            \  }
            \}

let g:user_zen_expandabbr_key = '<c-e>'   "set hotkey
let g:use_zen_complete_tag = 1


"winmanager
let g:winManagerWindowLayout='FileExplorer|BufExplorer'
let g:persistentBehaviour=0
let g:winManagerWidth=20
let g:defaultExplorer=1
nmap <silent> <F8> :WMToggle<cr>
imap <silent> <F8> :<esc>:WMToggle<cr>
nmap <silent> <leader>fir :FirstExplorerWindow<cr>
nmap <silent> <leader>bot :BottomExplorerWindow<cr>


"tagbar
nmap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 25


"ctags
set tags=tags
"set tags+=./../tags,./../../tags,./../../../tags
set tags+=~/.vim/systags


"autocmd FileType javascript inoremap . .<C-X><C-O>
"autocmd FileType html,htm,xhtml inoremap . .<C-X><C-O>
"autocmd FileType python inoremap . .<C-X><C-O>
"autocmd FileType python compiler pylint
"autocmd FileType c,cpp,h,hpp inoremap . .<C-X><C-O>
"autocmd FileType c,cpp,h,hpp inoremap -> -><C-X><C-O>


"pydiction
let g:py_local="~/.vim/bundle/Pydiction/after/ftplugin/python/complete-dict"
let g:pydiction_location=g:py_local
let g:pydiction_menu_height=10


"voom
let g:vimroom_navigation_keys = 0
let g:vimroom_sidebar_height = 0
let g:vimroom_guibackground = '#002b36'
let g:vimroom_ctermbackground = 8
nmap <silent> <leader>v <Plug>VimroomToggle


"AuthorInfo
let g:vimrc_author='Mocker'
let g:vimrc_email='Zuckerwooo@gmail.com'
let g:vimrc_homepage='zuckonit.github.com'
nmap <F4> :AuthorInfoDetect<cr>


"calendar
let g:calendar_diary= '~/文档/diary/'
map ca :Calendar<cr>


"cscope && tags
map <F10> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hpp,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction



"-------------------------------------------
"            self-plugins
"-------------------------------------------
"weather.vim
map <leader>we :call Weather()<CR>

"google.vim
map <leader>ggw :call GoogleByWord()<CR>
map <leader>ggl :call GoogleByLine()<CR>
map <leader>ggs :call GoogleBySelect()<CR>

"gnote.vim
let g:gnote_gmail_username=""
let g:gnote_gmail_password=""
