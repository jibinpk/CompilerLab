%option noyywrap

digit [0-9]+
string [a-zA-Z]+
special [^a-zA-Z0-9 \t\r\n\f]+

%%

{digit} { printf("\n%s is a digit", yytext); }
{string} { printf("\n%s is a string", yytext); }
{special} { printf("\n%s is a special character", yytext); }

%%

int main() {
    printf("\nEnter input. Press Ctrl+C to stop.\n\n");
    yylex();
    return 0;
}
