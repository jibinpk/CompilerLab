%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

void printToken(char* token, char* type) {
    printf("%s is a %s\n", token, type);
}

%}

%%
"int"|"float"|"if"|"else"|"while"|"do"|"break"|"continue"|"double"|"return"|"char"|"case"|"sizeof"|"long"|"short"|"typedef"|"switch"|"unsigned"|"void"|"static"|"struct"|"goto" { printToken(yytext, "keyword"); }
[0-9]+ { printToken(yytext, "integer"); }
[a-zA-Z_][a-zA-Z0-9_]* { printToken(yytext, "identifier"); }
"+"|"-"|"*"|"/"|">"|"<"|"=" { printToken(yytext, "operator"); }
" "|"\t"|"\n" { /* Ignore whitespace */ }
. { printToken(yytext, "delimiter"); }
%%

int main() {
    FILE *file = fopen("var.c", "r");
    if (file == NULL) {
        printf("Could not open file var.c\n");
        return 1;
    }
    yyin = file;
    yylex();
    fclose(file);
    return 0;
}

int yywrap() {
    return 1;
}
