syntax keyword typescriptGlobal RegExp nextgroup=typescriptGlobalRegExpDot,typescriptFuncCallArg
syntax match   typescriptGlobalRegExpDot /\./ contained nextgroup=typescriptRegExpStaticProp
syntax keyword typescriptRegExpStaticProp contained lastIndex
if exists("did_typescript_hilink") | HiLink typescriptRegExpStaticProp Keyword
endif
syntax keyword typescriptRegExpProp contained global ignoreCase multiline source sticky
syntax cluster props add=typescriptRegExpProp
if exists("did_typescript_hilink") | HiLink typescriptRegExpProp Keyword
endif
syntax keyword typescriptRegExpMethod contained exec test nextgroup=typescriptFuncCallArg
syntax cluster props add=typescriptRegExpMethod
if exists("did_typescript_hilink") | HiLink typescriptRegExpMethod Keyword
endif
