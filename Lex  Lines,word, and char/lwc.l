%{
    #include <stdio.h>
    int line = 0;
    int word = 0;
    int chars = 0;
%}

%%
\n {line++, word++;}
[a-zA-Z0-9] {chars++;}
" " {word++;}
. {}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("enter text(end input with Ctrl+D) : \n");
    yylex();
    printf("Number of lines: %d\n", line);
    printf("Number of words: %d\n", word);
    printf("Number of characters: %d\n", chars);
    return 0;
}
