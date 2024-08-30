%{
    #include<stdio.h>
    int flag=0;
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
E:  T {
    printf("Result = %d \n ", $$);
    return 0;
}
T: T'+'T {$$ = $1 + $3 ; }
 | T'-'T { $$ = $1 - $3 ; }
 | T'*'T { $$ = $1 * $3 ;}
 | T'/'T { $$ = $1 / $3 ;}
 | T'%'T { $$ = $1 % $3 ;}
 | '('T')' { $$ = $2 ;}
 | NUMBER { $$ = $1 ;}
 ;
%%
int main(){
    printf("enter the expression \n");
    yyparse();
    if(flag == 0)
        printf("\nEntered Arithmetic expression is valid\n");
}
void yyerror(){
    printf("Arithmetic expression is invalid \n" );
    flag=1;
}