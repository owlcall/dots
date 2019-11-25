" Color palette
let s:transparent = ''
let s:gui_white = '#ffffff'
let s:cterm_white = 255
let s:gui_black = '#000000'
let s:cterm_black = 0
let s:gui_dark_gray = '#303030'
let s:cterm_dark_gray = 236
let s:gui_med_gray_hi = '#444444'
let s:cterm_med_gray_hi = 238
let s:gui_med_gray_lo = '#3a3a3a'
let s:cterm_med_gray_lo = 237
let s:gui_light_gray = '#b2b2b2'
let s:cterm_light_gray = 249
let s:gui_back_green = '#afd787'
let s:cterm_back_green = 238
let s:gui_green = '#afd787'
let s:cterm_green = 34
let s:gui_dark_green = '#afd787'
let s:cterm_dark_green = 22
let s:gui_blue = '#87afd7'
let s:cterm_blue = 39
let s:gui_purple = '#afafd7'
let s:cterm_purple = 146
let s:gui_orange = '#d7af5f'
let s:cterm_orange = 179
let s:gui_orange2 = '#d7af5f'
let s:cterm_orange2 = 130
let s:gui_red = '#d78787'
let s:cterm_red = 124
let s:gui_bright_red = '#af0000'
let s:cterm_bright_red = 197
let s:gui_pink = '#d7afd7'
let s:cterm_pink = 182

let s:gui_borders = '#cccccc'
let s:cterm_borders = s:cterm_med_gray_hi

let s:_term_bright_grey = 248
let s:_term_light_grey = 246
let s:_term_medium_grey = 241
let s:_term_dark_grey = 235       " Divider background
let s:_term_dim_grey = 237        " Divider background
let s:_term_blue = 38
let s:_term_red = 196
let s:_term_orange = 178

let g:airline#themes#airtheme#palette = {}

" Normal mode
"let s:N1 = [s:gui_dark_gray,  s:gui_green,        s:cterm_black, s:cterm_green]               " Normal mode, unchanged
"let s:N2 = [s:gui_light_gray, s:gui_med_gray_lo,  s:cterm_light_gray, s:cterm_med_gray_lo]    " Normal mode, 
"let s:N3 = [s:gui_green,      s:gui_med_gray_hi,  s:cterm_pink, s:cterm_dark_gray]            " Normal mode, edited
"let g:airline#themes#airtheme#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)


let s:NORMAL_TAB =          ['', '', s:_term_blue,      s:_term_dim_grey]        " Tab and bottom-right
let s:NORMAL_STATUS_LEFT =  ['', '', s:_term_light_grey, s:_term_dark_grey]       " Both top and bottom status bar background + text color
let s:NORMAL_STATUS_RIGHT = ['', '', s:_term_bright_grey,      s:_term_dim_grey]                  " Normal inactive tab

let s:NORMAL_MODIFIED_STATUS_LEFT = ['', '', s:_term_orange, s:_term_dark_grey,     '']

let g:airline#themes#airtheme#palette.normal = airline#themes#generate_color_map (s:NORMAL_TAB, s:NORMAL_STATUS_RIGHT, s:NORMAL_STATUS_LEFT)
let g:airline#themes#airtheme#palette.normal_modified = { 'airline_c': s:NORMAL_MODIFIED_STATUS_LEFT }



let s:INSERT_TAB =          ['', '', s:cterm_white, s:cterm_red]                " Bottom right in mode, and tab (if modified)
let s:INSERT_STATUS_LEFT =  ['', '', s:_term_red, s:_term_dark_grey]   " Bottom left
let s:INSERT_STATUS_RIGHT = ['', '', s:cterm_white, s:cterm_red]                " Unused/Unidentified

let s:INSERT_MODIFIED_STATUS_LEFT = ['', '', s:_term_orange, s:_term_dark_grey, ''] " Bottom left, modified buffer
let s:INSERT_PASTE_TAB    = ['', '', s:cterm_dark_gray, s:_term_orange, '']

let g:airline#themes#airtheme#palette.insert = airline#themes#generate_color_map(s:INSERT_TAB, s:INSERT_STATUS_RIGHT, s:INSERT_STATUS_LEFT)
let g:airline#themes#airtheme#palette.insert_modified = { 'airline_c': s:INSERT_MODIFIED_STATUS_LEFT }
let g:airline#themes#airtheme#palette.insert_paste = { 'airline_a': s:INSERT_PASTE_TAB }



let s:REPLACE_RIGHT =        ['', '', s:cterm_white, s:cterm_red]
let s:REPLACE_STATUS_LEFT =  ['', '', s:cterm_bright_red, s:cterm_dark_gray]
let s:REPLACE_STATUS_RIGHT = ['', '', s:cterm_light_gray, s:cterm_med_gray_lo]

let s:REPLACE_TAB_MODIFIED = ['', '', s:_term_orange, s:_term_dark_grey, '']

let g:airline#themes#airtheme#palette.replace = airline#themes#generate_color_map(s:REPLACE_RIGHT, s:REPLACE_STATUS_RIGHT, s:REPLACE_STATUS_LEFT)
let g:airline#themes#airtheme#palette.replace_modified = { 'airline_c': s:REPLACE_TAB_MODIFIED }



let s:VISUAL_TAB =          ['', '', s:cterm_black, s:cterm_blue]
let s:VISUAL_STATUS_LEFT =  ['', '', s:cterm_light_gray, s:cterm_med_gray_lo]
let s:VISUAL_STATUS_RIGHT = ['', '', s:cterm_blue, s:cterm_med_gray_hi]
let s:VISUAL_MODIFIED_STATUS_LEFT = ['', '', s:cterm_black, s:cterm_orange, '']

let g:airline#themes#airtheme#palette.visual = airline#themes#generate_color_map(s:VISUAL_TAB, s:VISUAL_STATUS_LEFT, s:VISUAL_STATUS_RIGHT)
let g:airline#themes#airtheme#palette.visual_modified = { 'airline_c': s:VISUAL_MODIFIED_STATUS_LEFT }



let s:INACTIVE_TAB =          []
let s:INACTIVE_STATUS_LEFT =  []
let s:INACTIVE_STATUS_RIGHT = []

let s:INACTIVE_TAB =          ['', '', s:_term_medium_grey, s:_term_dark_grey, '']
let s:INACTIVE_MODIFIED_TAB = ['', '', s:_term_orange, s:_term_dark_grey]

let g:airline#themes#airtheme#palette.inactive = airline#themes#generate_color_map(s:INACTIVE_TAB, s:INACTIVE_TAB, s:INACTIVE_TAB)
let g:airline#themes#airtheme#palette.inactive_modified = { 'airline_c': s:INACTIVE_MODIFIED_TAB }

" Insert mode
"let s:I1 = [s:gui_light_gray, s:gui_red, s:cterm_white, s:cterm_red]
"let s:I3 = [s:gui_red, s:gui_light_gray, s:cterm_white, s:cterm_red]
"let g:airline#themes#airtheme#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:I3)
"let g:airline#themes#airtheme#palette.insert_modified = {
      "\ 'airline_c': [s:gui_dark_gray, s:gui_orange, s:cterm_black, s:cterm_orange, ''],
		"\ }
"let g:airline#themes#airtheme#palette.insert_paste = {
      "\ 'airline_a': [s:gui_dark_gray, s:gui_orange, s:cterm_dark_gray, s:cterm_orange, ''],
      "\ }

" Replace mode
"let g:airline#themes#airtheme#palette.replace = {
      "\ 'airline_a': [s:gui_dark_gray, s:gui_red, s:cterm_white, s:cterm_red, ''],
      "\ 'airline_c': [s:gui_red, s:gui_med_gray_hi, s:cterm_bright_red, s:cterm_dark_gray, ''],
      "\ }
"let g:airline#themes#airtheme#palette.replace_modified = copy(g:airline#themes#airtheme#palette.insert_modified)

" Visual mode
"let s:V1 = [s:gui_dark_gray, s:gui_blue, s:cterm_black, s:cterm_blue]
"let s:V3 = [s:gui_blue, s:gui_med_gray_hi, s:cterm_blue, s:cterm_med_gray_hi]
"let g:airline#themes#airtheme#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:V3)
"let g:airline#themes#airtheme#palette.visual_modified = copy(g:airline#themes#airtheme#palette.insert_modified)

" Inactive window
"let s:IA = [s:gui_light_gray, s:transparent, s:cterm_light_gray, s:cterm_med_gray_hi, '']
"let g:airline#themes#airtheme#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
"let g:airline#themes#airtheme#palette.inactive_modified = {
      "\ 'airline_c': [s:gui_orange, '', s:cterm_orange, '', ''],
      "\ }

" CtrlP
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#airtheme#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui_orange, s:gui_med_gray_hi, s:cterm_orange, s:cterm_med_gray_hi, '' ] ,
      \ [ s:gui_orange, s:gui_med_gray_lo, s:cterm_orange, s:cterm_med_gray_lo, '' ] ,
      \ [ s:gui_dark_gray, s:gui_green, s:cterm_dark_gray, s:cterm_green, 'bold' ] )

