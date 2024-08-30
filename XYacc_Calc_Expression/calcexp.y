%{
    #include <stdio.h>
    int valid = 1;
%}

%token num id op

%%

start: id '=' s { printf("Assignment processed\n"); }
     | s        { printf("Expression processed\n"); }
     ;

s: id x
  | num x
  | '-' num x
  | '(' s ')' x
  ;

x: op s
  | '-' s
  | /* Empty production */
  ;

%%

int yyerror(const char *s) {
    valid = 0;
    printf("\nInvalid expression: %s\n", s);
    return 0;
}

int main() {
    printf("\nEnter the expression:\n");
    yyparse();
    if (valid) {
        printf("\nValid expression!\n");
    }
    return 0;
}
