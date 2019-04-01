" VIM CONFIGURATIONS
" Author: valsorym <i@valsorym.com>
" Date: 2012-12-12 - 2019-03-30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" BASE
"""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" MAIN
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" INCOMPATIBILITY WITH VI
""" Use the full capabilities of vim without compatibility with vi.
set nocompatible      " Turn arrows in the mode of INSERT.

nnoremap <silent> <ESC>OA <UP>
nnoremap <silent> <ESC>OB <DOWN>
nnoremap <silent> <ESC>OC <RIGHT>
nnoremap <silent> <ESC>OD <LEFT>
inoremap <silent> <ESC>OA <UP>
inoremap <silent> <ESC>OB <DOWN>
inoremap <silent> <ESC>OC <RIGHT>
inoremap <silent> <ESC>OD <LEFT>

""" Disable beeping (aka 'bell') and window flashing, it is work in terminal
""" and GUI Vim.
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

""" ENCODING SETTINGS
""" UTF8 and type ending of line.
set termencoding=utf-8
set fileencodings=usc-bom,utf-8mdefault,cp1251
set ffs=unix,dos,mac
if has('multi_byte')
    set encoding=utf-8
    set fileencodings=utf-8,ucs-bom,latin1
    setglobal fileencoding=utf-8
    if &termencoding == ''
        let &termencoding = &encoding
    endif
endif

""" SEARCH
""" Ignore upper/lower case when searching.
set ignorecase
set smartcase

""" Highlight searched words.
if has("unix")
    """ The console vim in MacOS has a problem with this solution.
    if system('uname -s') == "Linux\n"
        set hlsearch
        nnoremap <Esc> :noh<return><Esc>
    endif
endif


""" SYNTAX HIGHLIGHTING RULES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" COLOR SCHEME
""" Highlight syntax and editor color scheme.
syntax on
colorscheme geek_term
set background=dark

""" TAB KEY SETTING
""" Setting indentation when press the Tab key.
"""     smarttab    when on, a <Tab> in front of a line inserts blanks
"""                 according to 'shiftwidth'.  'tabstop' or 'softtabstop' is
"""                 used in other places. A <BS> will delete a 'shiftwidth'
"""                 worth of space at the start of the line;
"""     expandtab   In Insert mode, use the appropriate number of spaces to
"""                 insert a <Tab>. Spaces are used in indents with the '>' and
"""                 '<' commands and when 'autoindent' is on. To insert a real
"""                 tab when 'expandtab' is on, use CTRL-V<Tab>;
"""     tabstop     magnitude of the indentation for Tab style;
"""     softtabstop magnitude of the indentation for Space style;
"""     shiftwidth  the number of spaces used in the indentation
"""                 commands, such as >> or <<.
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

""" FILE ASSOCIATION
""" Correct syntax highlighting for certain file types.
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.html set filetype=htmldjango
autocmd BufNewFile,BufRead *.tmpl set filetype=html.tornadotmpl
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd BufNewFile,BufRead *.css set filetype=css
autocmd BufNewFile,BufRead *.scss set filetype=scss
autocmd BufNewFile,BufRead *.po set filetype=po
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.jinja set filetype=jinja
autocmd BufNewFile,BufRead *.json set filetype=json
autocmd BufNewFile,BufRead *.template set filetype=txt

""" ... for typescript and html/css files set 2 spaces.
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType html.tornadotmpl setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType jinja setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab
autocmd FileType sh setlocal shiftwidth=2 tabstop=2

""" TypeScript: see TYPESCRIPT PLUGIN section
" autocmd BufNewFile,BufRead *.ts set filetype=typescript

""" GoLang: see VIM-GO PLUGIN section
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

""" When updated the buffer need update syntax highlighting too. This is
""" important when searching in large files.
autocmd BufEnter * :syntax sync fromstart


""" BACKUP AND SWAP SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set undodir=/tmp//
set backupdir=/tmp//
set directory=/tmp//


""" EDITOR OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" COMMAND LINE
""" Base settings.
set cmdheight=2
set completeopt+=menuone
set completeopt-=preview

""" LINE NUMBERING
""" Show line numbers in the file.
set number
set numberwidth=5

""" STATUSBAR SETTINGS
""" Show pressed keys in normal mode.
set showcmd

""" To display the status line always.
set laststatus=2

""" Display typed commands in the statsubar and make autocompletion using
""" the <Tab> key. Always show the status of open file in the status bar.
set wildmenu
set statusline=%<%f\%{(&modified)?'\*\ ':''}%*%=C:%c%V,R:%l\ %P\ \[%{&encoding}\]

""" BACKSPACE
""" Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode:
"""     indent  allow backspacing over autoindent;
"""     eol     allow backspacing over line breaks (join lines);
"""     start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"""             stop once at the start of insert.
set backspace=indent,eol,start

""" WORKSPACE SIZE
""" Maximum width of text that is being inserted and horizontal line (marker)
""" for the 'tw' position. And set the wrap method of words that go beyond
""" these boundaries in width.
set colorcolumn=80
set nowrap
" set textwidth=79
" set wrap
" set linebreak
" set dy=lastline
" set sidescroll=5
" set sidescrolloff=5
" set listchars+=precedes:<,extends:>

""" INDENT SETTINGS
""" Automatic indentation of newline:
"""     autoindent  copy indent from current line when starting a new line
"""                 (typing <CR> in Insert mode or when using the "o" or "O"
"""                 command);
"""     cindent     enables automatic C program indenting.
set autoindent

""" SPECIAL CHAR SETTINGS
"""  Display wildcards: tabs and spaces at the end.
set list listchars=tab:»·,trail:·

""" BUFFER/TAB SETTINGS
""" Show panel of tabs and limit the number of open tabs.
set tabpagemax=55 " for use -p flag: vim -p file_1 file_2 ... file_N
set showtabline=2


""" KEY MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Mapping helps
"""     :nmap   display normal mode maps;
"""     :imap   display insert mode maps;
"""     :vmap   display visual and select mode maps;
"""     :smap   display select mode maps;
"""     :xmap   display visual mode maps;
"""     :cmap   display command-line mode maps;
"""     :omap   display operator pending mode maps.

""" RUSSIAN
""" Including support for Russian keyboard.
"""     *** Activate INSERT MODE and change language use Ctrl+^ (Ctrl+Shift+6).
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" MAPLEADER
" Set leader shortcut to a comma ',' (by default it's the backslash).
let mapleader="."

""" EDIT
""" Undo/Redo.
""" USAGE: Ctrl+u and Ctrl+r
nmap u :For use the `Undo` and `Redo` clik `C-u` and `C-r` respectively!
imap <C-u> <Esc>:undo<CR>
nmap <C-u> :undo<CR>
imap <C-r> <Esc>:redo<CR>
nmap <C-r> :redo<CR>

""" Copy/Paste.
""" USAGE: Ctrl+Insert, Shift+Insert or Ctrl+C, Ctrl+V
""" ** Install the `vim-gtk` package, and use `select-editor` to select the
""" vim-gtk by default.
vmap <C-Insert> "+y
vmap <S-Insert> "+p
vmap <C-c> "+y
imap <C-c> <ESC> "+y
vmap <C-v> "+p
imap <C-v> <ESC> "+p

"""  ** In MacOs you can change the keymapping `System Preferences` ->
"""  `Keyboard` -> `Modifier Keys ...` and select `Cmd` as `Ctrl`. Or use
"""  MacVim, which can be installed using MacPorts (www.macports.org).
"""  Im MacVim the Cmd+C and Cmd+V working without additional
"""  configuration, or uncomment this settings:
" vmap <D-c> "+y
" imap <D-c> <ESC> "+y
" vmap <D-v> "+p
" imap <D-v> <ESC> "+p

""" FILES
""" Open file.
""" USAGE: Ctrl+O
imap <C-o> <Esc>:e<Space>
nmap <C-o> :e<Space>

""" Save current tab.
""" USAGE: F2
imap <F2> <Esc>:w!<CR>
nmap <F2> :w!<CR>

""" TABS
""" Open buffer/tab list.
""" USAGE: Ctrl+t
imap <C-t> <Esc>\bs
nmap <C-t> \bs

""" Move tab in N position.
""" USAGE: F3
imap <F3> <Esc>:tabm<Space>
nmap <F3> :tabm<Space>

""" Go to N tab.
""" USAGE: F4
imap <F4> <Esc>:tabn<Space>
nmap <F4> :tabn<Space>

""" Prev tab.
""" USAGE: F5 or Ctrl+ArrowLeft
imap <F5> <Esc>:tabprev<CR>
nmap <F5> :tabprev<CR>
map <C-Left> :tabprev<CR>

""" Next tab.
""" USAGE: F6 or Ctrl+ArrowRight
imap <F6> <Esc>:tabnext<CR>
nmap <F6> :tabnext<CR>
map <C-Right> :tabnext<CR>

""" Create new tab.
""" USAGE: F7 or Ctrl+n
imap <F7> <Esc>:tabnew<CR>
nmap <F7> :tabnew<CR>
imap <C-n> <Esc>:tabnew<CR>
nmap <C-n> :tabnew<CR>

""" EDITOR
""" On/Off display of line numbers.
""" USAGE: F12
imap <F12> <Esc>:set<Space>nu!<CR>a
nmap <F12> :set<Space>nu!<CR>

""" Open encoding menu.
""" USAGE: F8
set wildmenu
set wcm=<Tab>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""
""" PLUGINS
"""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" NERDTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" The NERD tree allows you to explore your filesystem and to open files and
""" directories. It presents the filesystem to you in the form of a tree which
""" you manipulate with the keyboard and/or mouse. It also allows you to
""" perform simple filesystem operations.
""" USAGE: F9
""" URLS:
"""     http://www.vim.org/scripts/script.php?script_id=1658
"""     https://github.com/scrooloose/nerdtree
""" Position and size.
let g:NERDTreeWinPos='left'
let g:NERDTreeWinSize=37

""" If used NERDTreeFind - find the file in the directory tree is not my root
""" directory (installed as Shift+c). But if set the autochdir the root
""" directory will be changed to the directory where stored the current file.
" set autochdir
set noautochdir
let NERDTreeChDirMode=2

""" Ignore files.
let g:NERDTreeIgnore=[
    \ "\\.pyc$",
    \ "\\.swo$",
    \ "\\.swp$",
    \ "\\.core$",
    \ "\\.o$",
    \ "^_del\\.",
    \ "^\\.del\\."
\]

""" Add bookmark.
imap <C-b> <Esc>:Bookmark<Space>
nmap <C-b> :Bookmark<Space>

""" Toggle NERDTree.
function! NERDTree_IsOpen()
    """ Return True if NERDTree is open.
    return exists('t:NERDTreeBufName') && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! NERDTree_Open()
    """ Open and synchronize or close NERDTree.
    """ I.e., custom alternative for NERDTreeToggle.
    if NERDTree_IsOpen()
        NERDTreeToggle
    else
        try
            NERDTreeFind
        catch
            NERDTreeToggle
        endtry
    endif
endfunction

" nmap <silent> <F9> :NERDTreeToggle<CR>
nmap <silent> <F9> :call NERDTree_Open()<CR>


""" TAGBAR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Tagbar is a Vim plugin that provides an easy way to browse the tags of the
""" current file and get an overview of its structure. It does this by creating
""" a sidebar that displays the ctags-generated tags of the current file,
""" ordered by their scope. This means that for example methods in C++ are
""" displayed under the class they are defined in.
""" USAGE: F10
""" URLS:
"""     https://github.com/majutsushi/tagbar
""" Must be `Exuberant Ctags` and not `ctags (GNU Emacs x.n)`.
" let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_ctags_bin='ctags'

""" Autofocus.
let g:tagbar_autofocus=1

""" Position and size of tagbar panel.
let g:tagbar_right=1
let g:tagbar_width=30
let g:tagbar_compact=1

""" Key mapp.
nmap <F10> :TagbarToggle<CR>


""" BUFEXPLORER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugin for easily browsing for buffers/tabs.
""" USAGE: Ctrl+t
""" URLS:
"""     https://github.com/andrewvc/vim-settings/blob/master/doc/bufexplorer.txt
""" Do not show default and detail help.
let g:bufExplorerDefaultHelp=0
let g:bufExplorerDetailedHelp=0

""" Don't show dirs, show relative paths and split filename with path.
let g:bufExplorerShowDirectories=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSplitOutPathName=0

"""  Split new window above current
let g:bufExplorerSplitBelow=0

""" Sort by full file path name.
let g:bufExplorerSortBy='fullpath'


""" TABS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Styling of the tabs.
""" USAGE:
"""     Ctrl+j - move tab left;
"""     Ctrl+k - move tab right;
"""     Ctrl+h - move tab to first position;
"""     Ctrl+l - move tab to last position;
"""     Ctrl+z - open first tab.
""" URLS:
"""     https://github.com/valsorym/vim-tabs
"""
""" TAB LABEL STYLE
""" 0. Short tabs - only filename.
""" 1. Show parent folder + filename.
""" 2. Show only first and last symbol from parent folder + filename.
""" 3. Show only first symbol from parent folder + filename.
""" 4. Show only three first symbol from parent folder + filename.
""" Show only three first symbol from parent folder + filename.
set tabline=%!TabName(4)

""" Automatically move the tab to the last position.
if has('autocmd')
    " If open a lot of tabs and when the tab is editing - moved tab to last
    " position.
    autocmd InsertEnter * call AutoMoveTabLast()

    " If open new tab - move it on the last position.
    autocmd BufNew * call NewTabMoveLast()

    " Autoclose duplicate tabs.
    " + Add `CloseDuplicateTabs` - duplicate tabs closing command.
    " * If used NewTabMoveLast method - use CloseDuplicateTabs(1).
    autocmd BufEnter * call CloseDuplicateTabs(1)
    command CloseDuplicateTabs :call CloseDuplicateTabs(1)
endif " autocmd

imap <C-j> <Esc>:call MoveTabLeft()<CR>
nmap <C-j> :call MoveTabLeft()<CR>

imap <C-k> <Esc>:call MoveTabRight()<CR>
nmap <C-k> :call MoveTabRight()<CR>

imap <C-h> <Esc>:call MoveTabFirst()<CR>
nmap <C-h> :call MoveTabFirst()<CR>

imap <C-l> <Esc>:call MoveTabLast()<CR>
nmap <C-l> :call MoveTabLast()<CR>

imap <C-z> <Esc>:call OpenFirstTab()<CR>
nmap <C-z> :call OpenFirstTab()<CR>


""" RESWAP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Reswap (reconnect the swap file) - it helps when working with files through
""" SSHFS, after crash.
""" USAGE: Shift+Q (Command Mode)
function ReSwap()
    execute 'set noswapfile'
    execute 'set swapfile'
    execute ':echo "The swap file was changed!"'
endfunction

nmap <leader>q :call ReSwap()<CR>


""" CLEAR DEBRIS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Remove trailing blanks.
""" USAGE: <leader>x, a
""" URLS:
"""     https://github.com/valsorym/vim-clear
"""
""" Key mapping.
command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
"imap <C-x> <Esc>:TrimSpaces<CR>
"nmap <C-x> :TrimSpaces<CR>
nmap <leader>x :TrimSpaces<CR>


""" MOVE LINES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" USAGE:
"""     Shift-k - move current line/selections up;
"""     Shift-j - move current line/selections down.
""" URLS:
"""     https://github.com/matze/vim-move
"""
""" Key mapping.
let g:move_key_modifier = 'S'

""" Do not change of the moved block.
let g:move_auto_indent = 0


""" MULTIPLE CURSORS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" USAGE:
"""     Shift-f - start/the allocation of the next word under the cursor, and:
"""         Shift-b - the allocation of the previous word under the cursor;
"""         Shift-x - ignore the current word and move on to the next;
"""     After selecting all the words, you can start editing:
"""         c - remove word and go into edit mode;
"""         I - set the cursor in the begin of the word;
"""         A - set the cursor in the end of the word.
""" URLS:
"""     https://github.com/terryma/vim-multiple-cursors
"""
""" Disable default mapping.
let g:multi_cursor_use_default_mapping=0

""" Key mapping.
let g:multi_cursor_next_key='<S-f>'
let g:multi_cursor_prev_key='<S-b>'
let g:multi_cursor_skip_key='<S-x>'
let g:multi_cursor_quit_key='<Esc>'


""" COLORIZER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Color highlight toggle.
""" Highlights the specific color code in css,
""" for example: #fff, #efefef, red etc.
""" USAGE: Ctrl+i
""" URLS:
"""     https://github.com/valsorym/vim-colorizer
"""
""" Key mapping.
nmap <leader>i :ColorToggle<CR>


""" VIM-JSON
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" JSON for Vim.
let g:vim_json_syntax_conceal = 0 " 0 - JSON highlighting in raw mode.


""" TYPESCRIPT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


""" NEOCOMPLETE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Next generation completion framework after neocomplcache.
""" URL:
"""     https://github.com/Shougo/neocomplete.vim
""" Settings:
"""    Disable AutoComplPop;
"""    Use neocomplete;
"""    Use smartcase;
"""    Set minimum syntax keyword length.
let g:acp_enableAtStartup=0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#force_overwrite_completefunc=1
let g:neocomplete#auto_completion_start_length=3
let g:neocomplete#sources#syntax#min_keyword_length=3

""" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $CACHE.'/vimshell/command-history',
      \ 'python' : '~/.vim/dict/python.dict',
      \ 'go' : '~/.vim/dict/go.dict',
      \ }

""" """ Define keyword.
""" if !exists('g:neocomplete#keyword_patterns')
"""     let g:neocomplete#keyword_patterns={}
""" endif
""" let g:neocomplete#keyword_patterns['default']='\h\w*'

""" Completion.
""" Close popup and save indent use TAB ro CR.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>neocomplete_cr_function()<CR>
function! s:neocomplete_cr_function()
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

""" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType go setlocal omnifunc=gocomplete#Complete

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.go = '[^.[:digit:] *\t]\.'


""" VIM-GO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Go development plugin for Vim.
""" USAGE: (only for .go files)
"""     <leader>r - go run;
"""     <leader>b - go build;
"""     <leader>t - go test;
"""     <leader>i - show information about methods;
"""     <leader>d - show method declaration in the new tab;
"""     <leader>f - run go fmt.
""" URLS:
"""     https://github.com/fatih/vim-go
let g:go_list_type="quickfix"
let g:go_autodetect_gopath=1
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_extra_types=1
let g:go_highlight_generate_tags=1
let g:go_highlight_function_calls=1
let g:go_gocode_unimported_packages = 1
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command="goimports"
let g:go_fmt_fail_silently=0
let g:go_fmt_autosave=0 " 1 - for automatic formatting when saving

augroup go
    autocmd!
    " Customization .go files: show by default 4 spaces for a tab.
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <Leader>i <Plug>(go-info)
    autocmd FileType go nmap <Leader>f <Esc>:GoFmt<CR>
    autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
augroup END

" The build_go_files is a custom function that builds or compile the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction


""" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" USAGE: :PluginInstall, :PluginUpgrade
""" URLS:
"""     https://github.com/VundleVim/Vundle.vim
"""
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" Start plugin list ...
Plugin 'VundleVim/Vundle.vim'

Plugin 'valsorym/vim-highlighting'
Plugin 'valsorym/vim-colors'
Plugin 'valsorym/vim-tabs'
Plugin 'valsorym/vim-clear'

Plugin 'valsorym/vim-bufexplorer' " or original: 'jlanzarotta/bufexplorer'
Plugin 'valsorym/vim-nerdtree' " or original: 'scrooloose/nerdtree'
Plugin 'valsorym/vim-nerdtree-tabs' " or original: 'jistr/vim-nerdtree-tabs'
Plugin 'valsorym/vim-colorizer' " or original: 'chrisbra/Colorizer'
Plugin 'valsorym/vim-move' " or original: 'matze/vim-move'
Plugin 'valsorym/vim-json' " or original: 'elzr/vim-json'
Plugin 'valsorym/vim-multiple-cursors' " or original: 'terryma/vim-multiple-cursors'
Plugin 'valsorym/vim-tagbar' " or original: 'majutsushi/tagbar'
Plugin 'valsorym/vim-neocomplete' " or original 'Shougo/neocomplete.vim'
Plugin 'valsorym/vim-go' " or original: 'fatih/vim-go'

""" ... custom plugins ...
""" >

""" ... end plugin list.

call vundle#end()
filetype plugin indent on

""" Copy colors and syntax from bundle packages.
" command PluginUpgrade execute '!sh ~/.vim/bin/upgrade.sh'
command PluginUpgrade :call system('sh ~/.vim/bin/upgrade.sh')
