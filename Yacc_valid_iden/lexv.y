%{
    #include<stdio.h>
    int valid= 1;
%}
%token digit letter
%%
start: letter s

s: letter s
 | digit 
 |
 ;

%%
int yyerror(){
    printf("\n It is not a identifier\n ");
    valid=0;
    return 0;
}
int main(){
    printf("\n enter a name to tested for identifier : \n" );
    yyparse();
    if(valid){
        printf("\n It is an identifier \n");
    }
}