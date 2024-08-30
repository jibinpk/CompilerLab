%{
#include <stdio.h>
%}

/* Define patterns for character classes */
lower [a-z]
upper [A-Z]

%%

{lower}   { printf("%c", yytext[0]-32); }  // Convert lowercase to uppercase
{upper}   { printf("%c", yytext[0]+32); }  // Convert uppercase to lowercase
[\t\n]    { printf("%c", yytext[0]); }          // Copy tabs and newlines as is
.         { printf("%c", yytext[0]); }          // Copy any other character as is

%%

int main() {
    yylex();  // Call the lexer
    return 0;
}
