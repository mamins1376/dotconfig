let g:lightline = { 'colorscheme': 'srcery' }
let g:lightline.tabline = { 'left': [['tabnum', 'buffers']],
\	'right': [['tabs']]}
let g:lightline.active = { 'left': [
\	['mode', 'paste'],
\	['cocstatus', 'gitbranch', 'readonly', 'filename', 'modified']
\]}
let g:lightline.component = { 'lineinfo': ' %3l:%-2v' }
let g:lightline.component_function = {
\	'readonly': 'LightlineReadonly',
\	'gitbranch': 'LightlineFugitive',
\	'filetype': 'LightlineFiletype',
\	'fileformat': 'LightlineFileformat',
\	'cocstatus': 'coc#status'
\}
let g:lightline.component_expand =  { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type =  { 'buffers': 'tabsel' }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction
function! LightlineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! LightlineFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
