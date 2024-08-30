%{
    #include<stdio.h>
    int round_count=0;
    int curly_count=0;
    int squ_count=0;
%}

%%
"(" {round_count++;}
")" {round_count--;}
"{" {curly_count++;}
"}" {curly_count--;}
"[" {squ_count++;}
"]" {squ_count--;}
. {}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("enter the code (entet Ctrl+D to enter the input): \n");
    yylex();
    if (round_count == 0){
        printf("round brackets are balanced\n");
    }
    else
        printf("round brackets are not balanced\n");
    if (curly_count == 0){
        printf("curly brackets are balanced\n");
    }
    else
        printf("curly brackets are not balanced\n");
    if (squ_count == 0){
        printf("square brackets are balanced\n");
    }
    else
        printf("square brackets are not balanced\n");        
}