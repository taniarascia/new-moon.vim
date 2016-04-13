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

let colors_name = "newmoon"

fun! s:X(group, fg, bg, style, tfg, tbg)

    if empty(a:fg) " no gui foreground set
        let l:fg = "NONE"
    else
        let l:fg = a:fg
    endif

    if empty(a:bg) " no gui background set
        let l:bg = "NONE"
    else
        let l:bg = a:bg
    endif

    if empty(a:tfg) " no terminal foreground set
        let l:tfg = "NONE"
    else
        let l:tfg = a:tfg
    endif

    if empty(a:tbg) " no terminal background set
        let l:tbg = "NONE"
    else
        let l:tbg = a:tbg
    endif

    if empty(a:style) " no styling set
        let l:style = "NONE"
    else
        let l:style = a:style
    endif

    exec "hi ".a:group." guifg = ".l:fg." guibg = ".l:bg." gui = ".l:style." ctermfg = ".l:tfg." ctermbg = ".l:tbg
endfun

let s:black = "#000000"
let s:blackish = "#101010"
let s:grey1 = "#2a2c2d"
let s:grey2 = "#3C3F41"
let s:grey3 = "#4F5254"
let s:grey4 = "#b3b3b3"
let s:grey5 = "#c4c5c6"
let s:whiteish = "#f7f7f7"
let s:white = "#ffffff"
let s:jade = "#94C7B5"
let s:darkblue = "#63A1C2"
let s:aqua = "#8ADDF4"
let s:white = "#ffffff"
let s:orangered = "#FF9B62"
let s:lightblue = "#8FBBD2"
let s:moccasin = "#ffeead"
let s:beige = "#cda869"
let s:lilac = "#cc99cc"
let s:maize = "#e3c485"
let s:palerose = "#F4E1E1"
let s:salmon = "#F57878"
let s:emerald = "#49C698"

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
let s:fg1 = s:grey5 " 
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

let s:underlined = ""

let s:ignore = ""

let s:error = s:salmon

let s:todo = s:white

" ------------------------------------------------------------------------------
" --- Custom
" ------------------------------------------------------------------------------

let s:foreground = s:fg0
let s:background = s:bg2

" TODO temporary solution
let s:tbackground = "Grey"
let s:tforeground = "White"

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

call s:X("Normal",s:foreground,s:background,"",s:tforeground,s:tbackground)

call s:X("ColorColumn",s:comment,s:bg0,"","","")
call s:X("Conceal",s:fg2,"","","","")
call s:X("Cursor",s:background,s:foreground,"","","") " inverted normals
call s:X("CursorColumn","","","","","")
call s:X("CursorIM",s:background,s:foreground,"","","") " inverted normals
call s:X("CursorLine","",s:bg1,"","","")
call s:X("CursorLineNr","",s:bg1,"bold","","")

call s:X("DiffAdd","",s:positive,"","","")
call s:X("DiffChange","",s:neutral,"","","")
call s:X("DiffDelete","",s:negative,"","","")
call s:X("Directory",s:special,"","","","")

call s:X("ErrorMsg",s:error,s:negative,"","","")

call s:X("FoldColumn","",s:bg3,"","","")
call s:X("Folded","",s:bg3,"","","")

call s:X("IncSearch",s:background,s:foreground,"","","") " inverted normals

call s:X("LineNr",s:comment,"","","","")

call s:X("MatchParen",s:background,s:foreground,"bold","","") " inverted normals
call s:X("ModeMsg",s:special,s:bg1,"bold","","")
call s:X("MoreMsg",s:special,s:bg1,"","","")

call s:X("NonText",s:operator,"","","","")

call s:X("Pmenu","","","","","")
call s:X("PmenuSbar","","","","","")
call s:X("PmenuSel",s:special,s:bg1,"","","")

call s:X("Question",s:special,s:bg1,"bold","","")

call s:X("Search",s:background,s:foreground,"","","") " inverted normals
call s:X("SignColumn","","","","","")
call s:X("SpecialKey",s:special,"","","","")
call s:X("SpelBad",s:error,"","undercurl","","")
call s:X("SpellRare",s:neutral,"","","","")
call s:X("StatusLine",s:white,s:bg0,"","","")
call s:X("StatusLineNC",s:fg0,s:bg0,"","","")

call s:X("TabLine","",s:bg1,"","","")
call s:X("TabLineFill","","","","","")
call s:X("TabLineSel",s:fg0,s:bg0,"","","")
call s:X("Title","","","","","")

call s:X("VertSplit","","","","","")
call s:X("Visual","",s:bg1,"","","")

call s:X("WildMenu",s:special,"","","","")

" ------------------------------------------------------------------------------
" --- Syntax
" ------------------------------------------------------------------------------

call s:X("Comment",s:comment,"","","","")

" --- MAJOR
call s:X("Constant",s:constant,"","","","")
" --- MINORS of Constant
call s:X("String",s:string,"","","","")
call s:X("Character",s:character,"","","","")
call s:X("Number",s:number,"","","","")
call s:X("Boolean",s:boolean,"","","","")
call s:X("Float",s:float,"","","","")

" --- MAJOR
call s:X("Identifier",s:identifier,"","","","")
" --- MINORS of Identifier
call s:X("Function",s:function,"","","","")

" --- MAJOR
call s:X("Statement",s:statement,"","bold","","")
" --- MINORS of Identifier
call s:X("Conditional",s:conditional,"","","","")
call s:X("Repeat",s:repeat,"","","","")
call s:X("Label",s:label,"","","","")
call s:X("Operator",s:operator,"","","","")
call s:X("Keyword",s:keyword,"","","","")
call s:X("Exception",s:exception,"","","","")

" --- MAJOR
call s:X("PreProc",s:preproc,"","","","")
" --- MINORS of PreProc
call s:X("Include",s:include,"","","","")
call s:X("Define",s:define,"","","","")
call s:X("Macro",s:macro,"","","","")
call s:X("PreCondit",s:precondit,"","","","")

" --- MAJOR
call s:X("Type",s:type,"","","","")
" --- MINORS of Type
call s:X("StorageClass",s:storageclass,"","","","")
call s:X("Structure",s:structure,"","","","")
call s:X("Typedef",s:typedef,"","","","")

" --- MAJOR
call s:X("Special",s:special,"","","","")
" --- MINORS of Special
call s:X("SpecialChar",s:specialchar,"","","","")
call s:X("Tag",s:tag,"","","","")
call s:X("Delimiter",s:delimiter,"","","","")
call s:X("SpecialComment",s:specialcomment,"","","","")
call s:X("Debug",s:debug,"","","","")

call s:X("Underlined",s:underlined,"","","","")

call s:X("Ignore",s:ignore,"","","","")

call s:X("Error",s:error,s:negative,"","","")

call s:X("Todo",s:todo,"","bold","","")

" ------------------------------------------------------------------------------
" --- Filetype specific Syntax
" ------------------------------------------------------------------------------

" Vimscript
"
hi! link vimUserFunc Function

" HTML

call s:X("htmlSpecialChar",s:specialchar,"","","","")
call s:X("htmlBold","","","bold","","")
call s:X("htmlItalic","","","italic","","")
call s:X("htmlTag",s:statement,"","","","")
call s:X("htmlTagName",s:statement,"","","","")
call s:X("htmlEndTag",s:statement,"","","","")
call s:X("htmlArg",s:special,"","","","")

delf s:X
