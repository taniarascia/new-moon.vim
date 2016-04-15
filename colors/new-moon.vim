" ------------------------------------------------------------------------------
" File: newmoon.vim
" Description: port of newmoon by Tania Rascia (github.com/taniarascia)
" Author: Timm Stelzer <timmstelzer@gmail.com>
" Source: https://github.com/tstelzer/new-moon.vim
" ------------------------------------------------------------------------------

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "new-moon"

" if has('gui_running')
"     function! s:H(group,fg,bg,style)

"         if !empty(a:fg)
"             let l:gfg = a:fg[0]
"         else
"             let l:gfg = 'NONE'
"         endif

"         if !empty(a:bg)
"             let l:gbg = a:bg[0]
"         else
"             let l:gbg = 'NONE'
"         endif

"         if !empty(a:style)
"             ' TODO check if style works in TERM
"             let l:gstyle = a:style
"         else
"             let l:gstyle = 'NONE'
"         endif

"         exec 'hi '.a:group.' guifg='.l:gfg.' guibg='.l:gbg.' gui='.l:gstyle

"     endfun
" else
function! s:H(group,fg,bg,style)

    if !empty(a:fg)
        let l:gfg = a:fg[0]
        let l:cfg = a:fg[1]
    else
        let l:gfg = "NONE"
        let l:cfg = "NONE"
    endif

    if !empty(a:bg)
        let l:gbg = a:bg[0]
        let l:cbg = a:bg[1]
    else
        let l:gbg = "NONE"
        let l:cbg = "NONE"
    endif

    if !empty(a:style)
        " TODO check if style works in TERM
        let l:gstyle = a:style
        let l:cstyle = a:style
    else
        let l:gstyle = "NONE"
        let l:cstyle = "NONE"
    endif

    exec "hi ".a:group." guifg=".l:gfg." ctermfg=".l:cfg." guibg=".l:gbg." ctermbg=".l:cbg." gui=".l:gstyle." term=".l:cstyle

endfun
" endif

let s:black =     [ '#000000', 0   ]
let s:blackish =  [ '#101010', 16  ]
let s:grey1 =     [ '#2a2c2d', 16  ] " TODO, needs differenciation
let s:grey2 =     [ '#3C3F41', 236  ]
let s:grey3 =     [ '#4F5254', 59  ] " TODO, needs differenciation
let s:grey4 =     [ '#b3b3b3', 145 ]
let s:grey5 =     [ '#c4c5c6', 188 ]
let s:whiteish =  [ '#f7f7f7', 231 ] " TODO, term too close to white
let s:white =     [ '#ffffff', 231 ]
let s:jade =      [ '#94C7B5', 115 ]
let s:darkblue =  [ '#63A1C2', 73  ]
let s:aqua =      [ '#8ADDF4', 117 ] " TODO, term too close to s:jade
let s:orangered = [ '#FF9B62', 215 ]
let s:lightblue = [ '#8FBBD2', 110 ]
let s:moccasin =  [ '#ffeead', 229 ]
let s:beige =     [ '#cda869', 179 ]
let s:lilac =     [ '#cc99cc', 176 ]
let s:maize =     [ '#e3c485', 186 ]
let s:palerose =  [ '#F4E1E1', 224 ]
let s:salmon =    [ '#F57878', 210 ]
let s:emerald =   [ '#49C698', 78  ]

" ------------------------------------------------------------------------------
" --- Background Tints TODO RENAME 
" ------------------------------------------------------------------------------

let s:bg0 = s:blackish " darkest color
let s:bg1 = s:grey1
let s:bg2 = s:grey2
let s:bg3 = s:grey3 " medium tone
" ------------------------------------------------------------------------------
" --- Foreground Shades TODO RENAME
" ------------------------------------------------------------------------------

let s:fg2 = s:grey4
let s:fg1 = s:grey5
let s:fg0 = s:whiteish " lightest color

" ------------------------------------------------------------------------------
" --- Syntax groups
" ------------------------------------------------------------------------------

" VIM classifes MAJOR and MINOR syntax groups
" by default, every MINOR inherits its MAJORS values
" see :help <group> for more information on the individual groups

let s:comment = s:fg2

let s:constant = s:aqua
let s:string = s:jade           " MINOR of Constant
let s:character = s:constant     " MINOR of Constant
let s:number = s:orangered       " MINOR of Constant
let s:boolean = s:constant       " MINOR of Constant
let s:float = s:constant         " MINOR of Constant

let s:identifier = s:aqua
let s:function = s:identifier    " MINOR of Identifier

let s:statement = s:darkblue
let s:conditional = s:statement  " MINOR of Statement
let s:repeat = s:statement       " MINOR of Statement
let s:label = s:statement        " MINOR of Statement
let s:operator = s:beige         " MINOR of Statement
let s:keyword = s:statement      " MINOR of Statement
let s:exception = s:statement    " MINOR of Statement

let s:preproc = s:lightblue
let s:include = s:preproc        " MINOR of PreProc
let s:define = s:preproc         " MINOR of PreProc
let s:macro = s:preproc          " MINOR of PreProc
let s:precondit = s:preproc      " MINOR of PreProc

let s:type = s:white
let s:storageclass = s:type      " MINOR of Type
let s:structure = s:type         " MINOR of Type
let s:typedef = s:type           " MINOR of Type

let s:special = s:orangered
let s:specialchar = s:salmon    " MINOR of Special
let s:tag = s:special " MINOR of Special
let s:delimiter = s:white      " MINOR of Special
let s:specialcomment = s:special " MINOR of Special
let s:debug = s:special         " MINOR of Special

let s:underlined = s:orangered

let s:ignore = s:orangered

let s:error = s:salmon

let s:todo = s:white

" ------------------------------------------------------------------------------
" --- Custom
" ------------------------------------------------------------------------------

let s:foreground = s:fg0
let s:background = s:bg2

let s:positive = s:jade
let s:neutral = s:aqua
let s:negative = s:palerose

" let s:definition = s:lightblue
" let s:meta = s:bg0
" let s:metacolor = s:fg0
" let s:id = s:lilac
" let s:attribute = s:maize
" let s:property = s:fg1
" let s:qualifier = s:maize


" ------------------------------------------------------------------------------
" --- Vim Defaults
" ------------------------------------------------------------------------------

call s:H("Normal",          s:foreground,     s:background, "")

call s:H("ColorColumn",     s:comment,        s:bg0,        "")
call s:H("Conceal",         s:fg2,            "",           "")
call s:H("Cursor",          s:background,     s:foreground, "")
call s:H("CursorColumn",    "",               "",           "")
call s:H("CursorIM",        s:background,     s:foreground, "")
call s:H("CursorLine",      "",               s:bg1,        "")
call s:H("CursorLineNr",    "",               s:bg1,        "bold")

call s:H("DiffAdd",         "",               s:positive,   "")
call s:H("DiffChange",      "",               s:neutral,    "")
call s:H("DiffDelete",      "",               s:negative,   "")
call s:H("Directory",       s:special,        "",           "")

call s:H("ErrorMsg",        s:error,          s:negative,   "")

call s:H("FoldColumn",      "",               s:bg3,        "")
call s:H("Folded",          "",               s:bg3,        "")

call s:H("IncSearch",       s:background,     s:foreground, "")

call s:H("LineNr",          s:comment,        "",           "")

call s:H("MatchParen",      s:background,     s:foreground, "bold")
call s:H("ModeMsg",         s:special,        s:bg1,        "bold")
call s:H("MoreMsg",         s:special,        s:bg1,        "")

call s:H("NonText",         s:operator,       "",           "")

call s:H("Pmenu",           "",               "",           "")
call s:H("PmenuSbar",       "",               "",           "")
call s:H("PmenuSel",        s:special,        s:bg1,        "")

call s:H("Question",        s:special,        s:bg1,        "bold")

call s:H("Search",          s:background,     s:foreground, "")
call s:H("SignColumn",      "",               "",           "")
call s:H("SpecialKey",      s:special,        "",           "")
call s:H("SpelBad",         s:error,          "",           "")
call s:H("SpellRare",       s:neutral,        "",           "")
call s:H("StatusLine",      s:white,          s:bg0,        "")
call s:H("StatusLineNC",    s:fg0,            s:bg0,        "")

call s:H("TabLine",         "",               s:bg1,        "")
call s:H("TabLineFill",     "",               "",           "")
call s:H("TabLineSel",      s:fg0,            s:bg0,        "")
call s:H("Title",           "",               "",           "")

call s:H("VertSplit",       "",               "",           "")
call s:H("Visual",          "",               s:bg1,        "")

call s:H("WildMenu",        s:special,        "",           "")

" ------------------------------------------------------------------------------
" --- Syntax
" ------------------------------------------------------------------------------

call s:H("Comment",         s:comment,        "",           "")

" --- MAJOR
call s:H("Constant",        s:constant,       "",           "")
" --- MINORS of Constant
call s:H("String",          s:string,         "",           "")
call s:H("Character",       s:character,      "",           "")
call s:H("Number",          s:number,         "",           "")
call s:H("Boolean",         s:boolean,        "",           "")
call s:H("Float",           s:float,          "",           "")

" --- MAJOR
call s:H("Identifier",      s:identifier,     "",           "")
" --- MINORS of Identifier
call s:H("Function",        s:function,       "",           "")

" --- MAJOR
call s:H("Statement",       s:statement,      "",           "bold")
" --- MINORS of Identifier
call s:H("Conditional",     s:conditional,    "",           "")
call s:H("Repeat",          s:repeat,         "",           "")
call s:H("Label",           s:label,          "",           "")
call s:H("Operator",        s:operator,       "",           "")
call s:H("Keyword",         s:keyword,        "",           "")
call s:H("Exception",       s:exception,      "",           "")

" --- MAJOR
call s:H("PreProc",         s:preproc,        "",           "")
" --- MINORS of PreProc
call s:H("Include",         s:include,        "",           "")
call s:H("Define",          s:define,         "",           "")
call s:H("Macro",           s:macro,          "",           "")
call s:H("PreCondit",       s:precondit,      "",           "")

" --- MAJOR
call s:H("Type",            s:type,           "",           "")
" --- MINORS of Type
call s:H("StorageClass",    s:storageclass,   "",           "")
call s:H("Structure",       s:structure,      "",           "")
call s:H("Typedef",         s:typedef,        "",           "")

" --- MAJOR
call s:H("Special",         s:special,        "",           "")
" --- MINORS of Special
call s:H("SpecialChar",     s:specialchar,    "",           "")
call s:H("Tag",             s:tag,            "",           "")
call s:H("Delimiter",       s:delimiter,      "",           "")
call s:H("SpecialComment",  s:specialcomment, "",           "")
call s:H("Debug",           s:debug,          "",           "")

call s:H("Underlined",      s:underlined,     "",           "")

call s:H("Ignore",          s:ignore,         "",           "")

call s:H("Error",           s:error,          s:negative,   "")

call s:H("Todo",            s:todo,           "",           "bold")

" ------------------------------------------------------------------------------
" --- Filetype specific Syntax
" ------------------------------------------------------------------------------

" Vimscript
"
hi! link vimUserFunc Function

" HTML

call s:H("htmlSpecialChar", s:specialchar,    "",           "")
call s:H("htmlBold",        "",               "",           "bold")
call s:H("htmlItalic",      "",               "",           "italic")
call s:H("htmlTag",         s:statement,      "",           "")
call s:H("htmlTagName",     s:statement,      "",           "")
call s:H("htmlEndTag",      s:statement,      "",           "")
call s:H("htmlArg",         s:special,        "",           "")

delf s:H
