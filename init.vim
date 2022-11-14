""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 调用插件

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$HOME/.config/nvim/plugged')

" === 必备插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" 全能插件
Plug 'preservim/nerdtree'							" 文件浏览插件
"Plug 'scrooloose/nerdtree'							" 文件浏览插件(已换源)

" === 界面美化
Plug 'vim-airline/vim-airline'			" 底部状态栏插件
Plug 'vim-airline/vim-airline-themes'	" airline主题插件: https://github.com/vim-airline/vim-airline/wiki/Screenshots

" === 文件查找
Plug 'junegunn/fzf'										" fzf 是一个通用的命令行模糊查找器
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	" 每次打开时保持最新
Plug 'Junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }		" 模糊查找(全局查找):有助于动态定位文件、缓冲区、mrus、gtags 等

" === 代码浏览与注释
"Plug 'vim-scripts/FastFold'			" 快速折叠插件(试过，没用)
"Plug 'vim-scripts/taglist.vim'			" 源代码浏览器插件: 提供源代码文件结构的概述
Plug 'yegappan/taglist'					" 源代码浏览器插件(上面已经很久没更新)
Plug 'preservim/nerdcommenter'			" 代码注释

" === 代码补全与语法检查
"Plug 'ycm-core/YouCompleteMe'					" 自动补全插件(很难配置,coc替代)
Plug 'jiangmiao/auto-pairs'						" 自动补全插件: 在输入/删除(时，能自动补上/删除)
Plug 'theniceboy/vim-snippets'					" 代码补全插件
Plug 'dense-analysis/ale'						" 语法检查和语义错误（linting）插件

" === 代码调试器——Debugger
Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" === Git相关插件
Plug 'tpope/vim-fugitive'												" Git插件：支持git commit/add/push/pull 等命令
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }	" Git相关插件
Plug 'cohama/agit.vim'													" Git相关插件——gitk克隆 (用法:Agit)

" === Python相关插件
Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }

" === Markdown相关插件
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}					" Markdown预览 (需要依赖)
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}   " Markdown预览插件(预览没用)
Plug 'dkarter/bullets.vim'																					" Markdown对齐插件
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }		" Markdown表格Tool(很好用!)
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }							" Markdown目录管理插件


call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""  插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === 1
" === vim-instant-markdown (有个更好的 markdown-preview.nvim)
" ===
"let g:instant_markdown_slow = 0
"let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
"let g:instant_markdown_autoscroll = 1



" === 2
" === NERDTree
" ===
" 在没有文件参数的情况下启动 Vim 时启动 NERDTree
"autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" 启动 NERDTree 并将光标放回另一个窗口
autocmd VimEnter * NERDTree | wincmd p

"启动 NERDTree 并将光标留在其中
"autocmd VimEnter * NERDTree


" === 3
" === coc.nvim
" ===
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-diagnostic',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-explorer',
	\ 'coc-flutter-tools',
	\ 'coc-gitignore',
	\ 'coc-html',
	\ 'coc-import-cost',
	\ 'coc-java',
	\ 'coc-jest',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-prettier',
	\ 'coc-prisma',
	\ 'coc-pyright',
	\ 'coc-snippets',
	\ 'coc-sourcekit',
	\ 'coc-stylelint',
	\ 'coc-syntax',
	\ 'coc-tailwindcss',
	\ 'coc-tasks',
	\ 'coc-translator',
	\ 'coc-tsserver',
	\ 'coc-vetur',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
	\ 'coc-yank']

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()

function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

nnoremap <LEADER>h :call Show_documentation()<CR>
set runtimepath^=~/.config/nvim/coc-extensions/coc-flutter-tools/
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
let $NVIM_COC_LOG_LEVEL = 'debug'
" let $NVIM_COC_LOG_FILE = '/Users/david/Desktop/log.txt'

nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>

" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>									" 列出剪贴板内容(coc-lists)
nnoremap <silent> <space>w  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>	" grep 当前缓冲区中的当前单词
nmap <silent> gd <Plug>(coc-definition)					" 定位到函数定义明处
nmap <silent> gD :tab sp<CR><Plug>(coc-definition)		" 定位到函数定义文件
nmap <silent> gy <Plug>(coc-type-definition)			" 定位到函数类型定义处
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)					" 转到函数原型处 
"nmap <leader>rn <Plug>(coc-rename)
"nmap tt :CocCommand explorer<CR>

" coc-translator
nmap ts <Plug>(coc-translator-p)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>aw  <Plug>(coc-codeaction-selected)w

" coctodolist
" nnoremap <leader>tn :CocCommand todolist.create<CR>
" nnoremap <leader>tl :CocList todolist<CR>
" nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>

" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>

" coc-snippets
"imap <C-l> <Plug>(coc-snippets-expand)
"vmap <C-e> <Plug>(coc-snippets-select)
"let g:coc_snippet_next = '<c-e>'
"let g:coc_snippet_prev = '<c-n>'
"imap <C-e> <Plug>(coc-snippets-expand-jump)
"let g:snips_author = 'codebug'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


" === 4
" === FZF (功能和NERDTree差不多，暂时不启用)
" ===
"nnoremap <c-p> :Leaderf file<CR>
" noremap <silent> <C-p> :Files<CR>
"noremap <silent> <C-f> :Rg<CR>
"noremap <silent> <C-h> :History<CR>
" noremap <C-t> :BTags<CR>
" noremap <silent> <C-l> :Lines<CR>
"noremap <silent> <C-w> :Buffers<CR>
"noremap <leader>; :History:<CR>

"let g:fzf_preview_window = 'right:60%'
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"function! s:list_buffers()
"  redir => list
"  silent ls
"  redir END
"  return split(list, "\n")
"endfunction

"function! s:delete_buffers(lines)
"  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
"endfunction

"command! BD call fzf#run(fzf#wrap({
"  \ 'source': s:list_buffers(),
"  \ 'sink*': { lines -> s:delete_buffers(lines) },
"  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
"  \ }))

"noremap <c-d> :BD<CR>

"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" This is the default extra key bindings
"let g:fzf_action = {
"  \ 'ctrl-t': 'tab split',
"  \ 'ctrl-x': 'split',
"  \ 'ctrl-v': 'vsplit' }



" === 5
" === fastfold		" 试过，没用
" ===
"nmap zuz <Plug>(FastFoldUpdate)
"let g:fastfold_savehook = 1
"let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
"let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
"let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
"let g:vimsyn_folding = 'af'
"let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
"let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1

" === 5
" === NERDTree —— 文件浏览器
" ===
map <C-n> :NERDTreeToggle<CR>


" === 6
" === NerdCommenter—代码注释
" ===
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } 

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" === 7
" === Bullets.vim —— Markdown对齐
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]



" === 8
" === markdown-preview.nvim (Markdown预览插件)
" ===
" 默认配置(官方)
" 设置为1，nvim进入markdown缓冲区后会打开预览窗口,默认为0
let g:mkdp_auto_start = 0

" 设置为 1，当从 markdown 缓冲区更改为另一个缓冲区时，nvim 将自动关闭当前预览窗口
let g:mkdp_auto_close = 1

" 设置为 1，vim 将在保存缓冲区或退出插入模式时刷新 markdown，默认 0 是在编辑或移动光标时自动刷新 markdown
let g:mkdp_refresh_slow = 0

" 设置为 1，MarkdownPreview 命令可以用于所有文件，默认可以在 markdown 文件中使用,默认0
let g:mkdp_command_for_global = 0

" 设置为 1，默认情况下预览服务器可供网络中的其他人使用，服务器侦听 localhost(127.0.0.1) ，default: 0
let g:mkdp_open_to_the_world = 0

" 使用自定义IP打开预览页面更多详情见：https://github.com/iamcco/markdown-preview.nvim/pull/9，默认为空
let g:mkdp_open_ip = ''

" 指定浏览器打开预览页面，默认：''
let g:mkdp_browser = ''

" 设置为1，打开预览页面时在命令行中回显预览页面url，默认为0
let g:mkdp_echo_preview_url = 0

" 用于打开预览页面的自定义 vim 函数名称 此函数将接收 url 作为参数，默认为空
let g:mkdp_browserfunc = ''

" options for markdown render (渲染配置)
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }


" 使用自定义 markdown 样式必须是绝对路径，例如 '/Users/username/markdown.css' 或 expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" 使用自定义高亮样式必须是绝对路径，例如 '/Users/username/highlight.css' 或 expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" 使用自定义端口启动服务器或随机为空
let g:mkdp_port = ''

" 预览页面标题 ${name} 将替换为文件名
let g:mkdp_page_title = '「${name}」'

" 识别的文件类型，这些文件类型将具有 MarkdownPreview... 命令
let g:mkdp_filetypes = ['markdown']

" 快捷键配置
" F8-实时预览 F9-停止预览
"nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode F8 实时预览 - 普通模式下（n）
"imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode F8 实时预览 - 插入模式下（i) 
"nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode F9 停止预览
"imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode F9 停止预览

" example(官方)
nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle


" === 9
" === vim-table-mode —— Markdown表格Tool
" ===
" 设置表格样式
let g:table_mode_corner='|'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
 
"
" 说明: 详见 (https://github.com/dhruvasagar/vim-table-mode)
" :TableModeToggle = <Leader>tm = \tm  " 启用插件
" :TableModeRealign = <Leader>tr = \tr " 错乱表格自动对齐
" 


" === 10
" === vim-markdown-toc Markdown目录管理插件
" ===
" 说明 (详见 https://github.com/mzlogin/vim-markdown-toc)
" :GenTocGFM							" 生成GFM风格的目录
let g:vmt_auto_update_on_save = 1		" 自动更新目录 = :UpdateToc
" :RemoveToc							" 删除现有目录
let g:vmt_dont_insert_fence = 0			
let g:vmt_cycle_list_item_markers = 0   " 默认0



" === 11
" === NERDCommenter -- 代码注释插件
" ===
" 创建默认映射
let g:NERDCreateDefaultMappings = 1

" 默认在注释分隔符后添加空格
let g:NERDSpaceDelims = 1

" 对美化的多行注释使用紧凑的语法
let g:NERDCompactSexyComs = 1

" 对齐逐行注释分隔符向左对齐，而不是跟随代码缩进
let g:NERDDefaultAlign = 'left'

" 设置语言以默认使用其备用分隔符
let g:NERDAltDelims_java = 1

" 添加您自己的自定义格式或覆盖默认值
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" 允许注释和反转空行（在注释区域时很有用）
let g:NERDCommentEmptyLines = 1

" 取消注释时启用尾随空格的修剪
let g:NERDTrimTrailingWhitespace = 1

" 启用 NERDCommenterToggle 以检查所有选定的行是否已注释
let g:NERDToggleCheckAllLines = 1



" === 12
" === LeaderF --模糊查找
" ===
" 启用插件：<leader>f (检索文件)  |  <leader>b (检索buffer) |
" <C-C>, <ESC> : 退出 LeaderF.
" <C-R> : 在模糊匹配和正则式匹配之间切换
" <C-F> : 在全路径搜索和名字搜索之间切换
" <Tab> : 在检索模式和选择模式之间切换
" <C-J>, <C-K> : 在结果列表里选择
" <C-X> : 在水平窗口打开
" <C-]> : 在垂直窗口打开
" <C-T> : 在新标签打开
" <C-P> : 预览结果
" 官方配置(https://github.com/Yggdroot/LeaderF)
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""Python环境"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""










"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新建文件时插入固定标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
	" 如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: codebug") 
		call append(line(".")+2, "# mail: zhang_classmate@qq.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/bash")
		call append(line(".")+7, "export PATH")
		call append(line(".")+8, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: codebug") 
		call append(line(".")+2, "	> Mail: zhang_classmate@qq.com ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
    	call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	" 新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""智能纠错(UP主) == Compile function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap gcc :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc -ansi -Wall % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		"term g++ -std=c++11 % -Wall -o %<" 
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nmap <leader>w :w!<cr>		" S键位同样效果
"nmap <leader>f :find<cr>	" 不好用，需要参数才有用

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y


" 文件操作
map S :w<CR>				" 保存文件(不退出)
map Q :q<CR>				" 退出
map R :source $MYVIMRC<CR>	" 重新加载

" 学习UP主配置
noremap H 5h	" 往左移5个字符
noremap J 5j	" 往下移5个字符
noremap K 5k	" 往上移5个字符
noremap L 5l	" 往右移5个字符

" noremap \s :%s//g<left><left>		" find and replace



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" 分屏操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap s <nop>			" s键设置为空操作
" 分屏方向（不好用）
map sfz :set splitright<CR>:vsplit<CR>		" 右边分屏
map sfy :set nosplitright<CR>:vsplit<CR>	" 左边分屏
map sfs :set nosplitbelow<CR>:split<CR> 	" 往上分屏
map sfx :set splitbelow<CR>:split<CR>		" 往下分屏

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap ss :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>		" 上下分屏并到上分屏
noremap sx :set splitbelow<CR>:split<CR>							" 上下分屏并到下分屏
noremap sz :set nosplitright<CR>:vsplit<CR>:set splitright<CR>		" 左右分屏并到左分屏
noremap sy :set splitright<CR>:vsplit<CR>							" 左右分屏并到右分屏

" 使用<Ctrl>+hjkl快速在窗口间跳转
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" 更改分屏大小
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" vim文件及其标签切换 == Tab Management ==
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Create a new tab with tu
noremap tu :tabe<CR>		" vim切换至新建文件工作台
noremap tU :tab split<CR>

" Move around tabs with tn and ti
noremap tl :-tabnext<CR>	" 切换至左边的vim文件
noremap tr :+tabnext<CR>	" 切换至右边的vim文件

" Move the tabs with tmn and tmi
noremap tml :-tabmove<CR>	" 当前vim文件标签向左移
noremap tmr :+tabmove<CR>	" 当前vim文件标签向右移





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" Markdown设置 == Markdown Settings == 自动插入相应语法
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
"source $XDG_CONFIG_HOME/nvim/md-snippets.vim	" 会报错：打不开文件
"auto spell		" 开启自动拼写(有问题)
"autocmd BufRead,BufNewFile *.md setlocal spell		" 开启后会出现中文高亮的问题
"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)

autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>

autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

autocmd Filetype markdown inoremap <buffer> ,m - [ ] 
autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a

autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible	" 不要使用vi的键盘模式，而是vim自己的
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>			" quickfix模式

filetype on				" 侦测文件类型
filetype plugin on		" 载入文件类型插件
filetype indent on		" 为特定文件类型载入相关缩进文件
filetype plugin indent on

set autoread					" 设置当文件被改动时自动载入
set completeopt=preview,menu	" 代码补全
set clipboard=unnamed 			" 共享剪贴板
set nobackup					" 从不备份 
:set makeprg=g++\ -Wall\ \ %	" make 运行

set autowrite				" 自动保存
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
" set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\			" 设置在状态行显示的信息

set foldcolumn=0
set foldmethod=indent	" 代码折叠
set foldlevel=3 
set foldenable		" 开始折叠

set syntax=on		" 语法高亮
set noeb			" 去掉输入错误的提示声音
set confirm			" 在处理未保存或只读文件的时候，弹出确认

set autoindent		" 自动缩进
set cindent
set tabstop=4		" Tab键的宽度
set softtabstop=4	" 统一缩进为4
set shiftwidth=4
set noexpandtab		" 不要用空格代替制表符
set smarttab		" 在行和段开始处使用制表符
set number			" 显示行号

set history=1000	" 历史记录数

set nobackup		"禁止生成临时文件
" set noswapfile

set ignorecase		"搜索忽略大小写
set hlsearch		"搜索逐字符高亮
exec "nohlsearch"
" noremap <c-f> :nohlsearch<CR>
noremap // :noh<return><esc>		" 按 // 退出高亮搜索
set incsearch		"行内替换
set gdefault
set smartcase		" 智能大小写

set enc=utf-8				" 编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8	" 语言设置
set helplang=cn

" 我的状态行显示的内容（包括文件类型和解码）
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2		" 总是显示状态行
set cmdheight=2			" 命令行（在状态行下）的高度，默认为1，这里是2

set viminfo+=!			" 保存全局变量
set iskeyword+=_,$,@,%,#,-	" 带有如下符号的单词不要被换行分割
set linespace=0			" 字符间插入的像素行数目
set wildmenu			" 增强模式中的命令行自动完成操作
set backspace=2			" 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l	" 允许backspace和光标键跨越行边界

set mouse=a				" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key

set report=0			" 通过使用: commands命令，告诉我们文件的哪一行被改变过

""""Note: next line has big problem ,You should repair it by uncommit this line !""""
" set fillchars=vert:\ ,stl:\ ,stlnc:\		" 在被分割的窗口间显示空白，便于阅读

set showmatch			" 高亮显示匹配的括号
set matchtime=1			" 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3			" 光标移动到buffer的顶部和底部时保持3行距离
set smartindent			" 为C程序提供自动缩进

au BufRead,BufNewFile *  setfiletype txt			" 高亮显示普通txt文件（需要txt.vim脚本）
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif	" 打开文件时回到上次位置"(非常有用)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" 自动补全 Note: 用插件替代了
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":inoremap ( ()<ESC>i
":inoremap ) <c-r>=ClosePair(')')<CR>

":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>

":inoremap [ []<ESC>i
":inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>

":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i

"function! ClosePair(char)
"	if getline('.')[col('.') - 1] == a:char
"		return "\<Right>"
"	else
"		return a:char
"	endif
"endfunction
"filetype plugin indent on 

set completeopt=longest,menu		"打开文件类型检测, 加了这句才可以用智能补全




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""UP主:TheCW的配置（部分）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map !R :source $MYVIMRC<CR>
set wrap		" 自动换行，不需要滑动底部横条
set showcmd		" 底部显示键盘操作
set wildmenu	" 命令模式自动补全命令
set autochdir	" vim指令在当前目录下执行

silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
silent !mkdir -p $HOME/.config/nvim/tmp/sessions

set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.

if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif


" Open the vimrc file anytime(在任何时候打开vim配置文件)
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
noremap <LEADER>rv :e .vimrc<CR>

" source $XDG_CONFIG_HOME/nvim/cursor.vim

" 搜索
"noremap - N
"noremap = n

" Disable the default s key
"noremap s <nop>

" Opening a terminal window
" noremap <space>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <C-c> zz

" Auto change directory to current dir
"autocmd BufEnter * silent! lcd %:p:h

" Call figlet
"noremap tx :r !figlet

" set wrap
" noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
"function! SynGroup()
"	let l:s = synID(line('.'), col('.'), 1)
"	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
"endfun
"map <F10> :call SynGroup()<CR>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


