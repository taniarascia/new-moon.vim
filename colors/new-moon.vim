" d8b   db d88888b db   d8b   db        .88b  d88.  .d88b.   .d88b.  d8b   db 
" 888o  88 88'     88   I8I   88        88'YbdP`88 .8P  Y8. .8P  Y8. 888o  88 
" 88V8o 88 88ooooo 88   I8I   88        88  88  88 88    88 88    88 88V8o 88 
" 88 V8o88 88~~~~~ Y8   I8I   88 C8888D 88  88  88 88    88 88    88 88 V8o88 
" 88  V888 88.     `8b d8'8b d8'        88  88  88 `8b  d8' `8b  d8' 88  V888 
" VP   V8P Y88888P  `8b8' `8d8'         YP  YP  YP  `Y88P'   `Y88P'  VP   V8P 
"
" ------------------------------------------------------------------------------
" File: new-moon.vim
" Description: new-moon by Tania Rascia (github.com/taniarascia)
" Author: Tania Rascia
" Source: https://github.com/taniarascia/new-moon.vim
" ------------------------------------------------------------------------------

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "new-moon"
if !exists('g:nm_all_bold')
    let g:nm_all_bold = 0
endif
if !exists('g:nm_use_italics')
    let g:nm_use_italics = 0
endif

function! s:H(group,fg,bg,style) "{{{
" group = Syntax Group
" :help syntax
" fg = Foreground Color
" bg = Background Color
" style = Font Style

if &t_Co == 8 && exists(a:fg[2]) && exists(a:bg[2])
    " low color & does have term8 colors

    let l:cbg = 0
    " term8 background is rendered exclusively black

    if !empty(a:fg)
        " foreground is NOT empty
        let l:cfg = a:fg[2]
    else 
        "foreground IS empty
        let l:cfg = "NONE"
    endif
    exec "hi ".a:group." ctermfg = ".l:cfg." ctermbg = ".l:cbg

else

    if !empty(a:fg)
        " foreground is NOT empty
        let l:gfg = a:fg[0]
        let l:cfg = a:fg[1]
    else
        let l:gfg = "NONE"
        let l:cfg = "NONE"
    endif

    if !empty(a:bg)
        " background is NOT empty
        let l:gbg = a:bg[0]
        let l:cbg = a:bg[1]
    else
        " background IS empty
        let l:gbg = "NONE"
        let l:cbg = "NONE"
    endif

    if g:nm_all_bold == 1
        " all text is rendered bold
        let l:gstyle = "bold"
        let l:cstyle = "bold"
    else
        if !empty(a:style)
            if a:style == "italic" && g:nm_use_italics == 0
                " no italics should be used
                let l:gstyle = "NONE"
                let l:cstyle = "NONE"
            else
                " style is NOT empty
                let l:gstyle = a:style
                let l:cstyle = a:style
                " TODO check if style works in TERM
            endif
        else
            " style IS empty
            let l:gstyle = "NONE"
            let l:cstyle = "NONE"
        endif
    endif

    " Schema:
    " hi "<Syntax group>" guifg = "<fgcolor>" guibg = "<bgcolor>" 
    " \ ctermfg = "<termfg>" ctermbg = "<termbg>" 
    " \ gui = "<guistyle>" term = "<termstyle>"
    
    exec "hi ".a:group." guifg=".l:gfg." ctermfg=".l:cfg." guibg=".l:gbg." ctermbg=".l:cbg." gui=".l:gstyle." term=".l:cstyle
endif
endfun
"}}}

" ##############################################################################
" ### #COLORPALETTE
" ##############################################################################
" DO NOT CHANGE THESE VALUES, ONLY ADD NEW ONES

" --- Grayscale"{{{
" ------------------------------------------------------------------------------

let s:trueblack = [ '#000000', 16,  0,  0 ]
let s:black     = [ '#080808', 232, 0,  0 ]
let s:gray1     = [ '#121212', 233, 0,  0 ]
let s:gray2     = [ '#1c1c1c', 234, 0,  0 ]
let s:gray3     = [ '#262626', 235, 0,  0 ]
let s:gray4     = [ '#303030', 236, 8,  0 ]
let s:gray5     = [ '#3a3a3a', 237, 8,  0 ]
let s:gray6     = [ '#444444', 238, 8,  0 ]
let s:gray7     = [ '#4e4e4e', 239, 8,  0 ]
let s:gray8     = [ '#606060', 241, 8,  0 ]
let s:gray9     = [ '#666666', 242, 8,  0 ]
let s:gray10    = [ '#767676', 243, 8,  0 ]
let s:gray11    = [ '#808080', 244, 8,  0 ]
let s:gray12    = [ '#8a8a8a', 245, 7,  7 ]
let s:gray13    = [ '#949494', 245, 7,  7 ]
let s:gray14    = [ '#9e9e9e', 246, 7,  7 ]
let s:gray15    = [ '#9e9e9e', 247, 7,  7 ]
let s:gray16    = [ '#a8a8a8', 248, 7,  7 ]
let s:gray17    = [ '#b2b2b2', 249, 7,  7 ]
let s:gray18    = [ '#bcbcbc', 250, 7,  7 ]
let s:gray19    = [ '#c0c0c0', 7,   7,  7 ]
let s:gray20    = [ '#c6c6c6', 251, 7,  7 ]
let s:gray21    = [ '#d0d0d0', 252, 15, 7 ]
let s:gray22    = [ '#dadada', 253, 15, 7 ]
let s:gray23    = [ '#e4e4e4', 254, 15, 7 ]
let s:white     = [ '#eeeeee', 255, 15, 7 ]
let s:truewhite = [ '#FFFFFF', 15,  15, 7 ]
"}}}
" --- Palette {{{
" ------------------------------------------------------------------------------
"  TODO add 16 and 8 colors
let s:warmgray = [ '#5f5f5f', 59 ] " TODO temporary, maybe use a grayscale color
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
" }}}

" ##############################################################################
" ### #FUNCTIONAL VARIABLES
" ##############################################################################
" --- change the assigned variables, if you want to change the presented colors
" ------------------------------------------------------------------------------

" --- Custom "{{{
" ------------------------------------------------------------------------------

let s:foreground = s:white
let s:background = s:gray4

let s:positive = s:jade
let s:neutral = s:aqua
let s:negative = s:palerose
"}}}
" --- Defaults {{{
" ------------------------------------------------------------------------------
" TODO remove redundancy
" VIM classifes MAJOR and MINOR syntax groups
" by default, every MINOR inherits its MAJORS values
" the variables are sorted and assigned in a way that reflects that
" if you dont want to deal with this, delete the MINOR groups
" see :help <group> for more information on the individual groups

let s:comment = s:gray17

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

let s:type = s:truewhite
let s:storageclass = s:type      " MINOR of Type
let s:structure = s:type         " MINOR of Type
let s:typedef = s:type           " MINOR of Type

let s:special = s:orangered
let s:specialchar = s:salmon    " MINOR of Special
let s:tag = s:special " MINOR of Special
let s:delimiter = s:truewhite      " MINOR of Special
let s:specialcomment = s:special " MINOR of Special
let s:debug = s:special         " MINOR of Special

let s:underlined = s:orangered

let s:ignore = s:orangered

let s:error = s:salmon

let s:todo = s:truewhite
" }}}

" ##############################################################################
" ### #SYNTAX
" ##############################################################################
" --- see function s:H()
" --- s:h(<SyntaxGroup>!, <foreground>, <background>, <style>)
" --- if fields are omitted, the parent syntaxgroups field will be inherited
" --- for example omitting <background> in String, the <background>-field 
" --- of Constant will be inherited
" ------------------------------------------------------------------------------

" --- Vim Defaults {{{
" ------------------------------------------------------------------------------
" TODO replace generic color vars with functional vars 
"
call s:H("Normal",          s:foreground,     s:background, "")

call s:H("ColorColumn",     s:comment,        s:gray3,        "")
call s:H("Conceal",         s:gray17,            "",           "")
call s:H("Cursor",          s:background,     s:foreground, "")
call s:H("CursorColumn",    "",               "",           "")
call s:H("CursorIM",        s:background,     s:foreground, "")
call s:H("CursorLine",      "",               s:gray3,        "")
call s:H("CursorLineNr",    "",               s:gray3,        "bold")

call s:H("DiffAdd",         "",               s:positive,   "")
call s:H("DiffChange",      "",               s:neutral,    "")
call s:H("DiffDelete",      "",               s:negative,   "")
call s:H("Directory",       s:special,        "",           "")

call s:H("ErrorMsg",        s:error,          s:negative,   "")

call s:H("FoldColumn",      "",               s:warmgray,        "")
call s:H("Folded",          "",               s:warmgray,        "")

call s:H("IncSearch",       s:background,     s:foreground, "")

call s:H("LineNr",          s:comment,        "",           "")

call s:H("MatchParen",      s:background,     s:foreground, "bold")
call s:H("ModeMsg",         s:special,        s:gray3,        "bold")
call s:H("MoreMsg",         s:special,        s:gray3,        "")

call s:H("NonText",         s:operator,       "",           "")

call s:H("Pmenu",           "",               "",           "")
call s:H("PmenuSbar",       "",               "",           "")
call s:H("PmenuSel",        s:special,        s:gray3,        "")

call s:H("Question",        s:special,        s:gray3,        "bold")

call s:H("Search",          s:background,     s:foreground, "")
call s:H("SignColumn",      "",               "",           "")
call s:H("SpecialKey",      s:special,        "",           "")
call s:H("SpelBad",         s:error,          "",           "")
call s:H("SpellRare",       s:neutral,        "",           "")
call s:H("StatusLine",      s:truewhite,          s:gray3,        "")
call s:H("StatusLineNC",    s:gray20,            s:gray3,        "")

call s:H("TabLine",         "",               s:gray3,        "")
call s:H("TabLineFill",     "",               "",           "")
call s:H("TabLineSel",      s:gray20,            s:gray3,        "")
call s:H("Title",           "",               "",           "")

call s:H("VertSplit",       "",               "",           "")
call s:H("Visual",          "",               s:gray3,        "")

call s:H("WildMenu",        s:special,        "",           "")
"}}}
" --- Syntax {{{
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
"}}}
" --- Filetype specific Syntax {{{
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
" }}}

delf s:H
