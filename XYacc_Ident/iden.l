%{
#include "y.tab.h"
%}

DIGIT   [0-9]
LETTER  [a-zA-Z_]
IDENT   {LETTER}({LETTER}|{DIGIT})*

%%

{IDENT}  { return IDENTIFIER; }
[ \t\n]  ; /* ignore whitespace */
.       { printf("Invalid character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}