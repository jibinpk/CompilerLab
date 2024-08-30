%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex(void);
extern int yylineno;
extern char *yytext;

void yyerror(char *s) {
    fprintf(stderr, "Error at line %d: %s\n", yylineno, s);
}

%}

%token IDENTIFIER

%%

program: IDENTIFIER
       ;

%%

int main() {
    if (yyparse() == 0) {
        printf("Valid identifier\n");
    }
    return 0;
}