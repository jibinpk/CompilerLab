#include <stdio.h>
#include <ctype.h>
#include <string.h>

// Function to check if a character is a valid identifier character
int is_valid_identifier_char(char c) {
    return isalnum(c) || c == '_';
}

// Function to check if a string is a keyword
int is_keyword(char *str) {
    char *keywords[] = {"if", "else", "while", "for", "int", "float", "char", "return"};
    int num_keywords = sizeof(keywords) / sizeof(keywords[0]);
    for (int i = 0; i < num_keywords; ++i) {
        if (strcmp(keywords[i], str) == 0) {
            return 1;
        }
    }
    return 0;
}

// Function to classify a token
char *classify_token(char *token) {
    if (is_keyword(token)) {
        return "Keyword";
    } else if (isdigit(token[0])) {
        return "Constant";
    } else if (token[0] == '#') {
        return "Preprocessor Directive";
    } else if (strlen(token) == 1 && (token[0] == '(' || token[0] == ')' || token[0] == '{' ||
                                      token[0] == '}' || token[0] == '[' || token[0] == ']' ||
                                      token[0] == ';' || token[0] == ',' || token[0] == '.')) {
        return "Special Symbol";
    } else if (strlen(token) == 1 && (token[0] == '+' || token[0] == '-' || token[0] == '*' ||
                                      token[0] == '/' || token[0] == '%' || token[0] == '=' ||
                                      token[0] == '<' || token[0] == '>' || token[0] == '&' ||
                                      token[0] == '|' || token[0] == '^' || token[0] == '~' ||
                                      token[0] == '!' || token[0] == '?' || token[0] == ':' ||
                                      token[0] == '~' || token[0] == '@' || token[0] == '`' ||
                                      token[0] == '\\' || token[0] == '$' || token[0] == '\"' ||
                                      token[0] == '\'' || token[0] == '_')) {
        return "Operator";
    } else {
        return "Identifier";
    }
}

int main() {
    char ch, token[50];
    int index = 0;

    printf("Enter the input text (press Ctrl+D or Ctrl+Z + Enter to finish):\n");

    // Read characters from standard input until EOF (Ctrl+D or Ctrl+Z in terminal)
    while ((ch = getchar()) != EOF) {
        if (is_valid_identifier_char(ch)) {
            token[index++] = ch;
        } else {
            if (index > 0) {
                token[index] = '\0';
                // Classify and print the token
                printf("%s : %s\n", token, classify_token(token));
                index = 0;
            }
            // Check for operators and special symbols
            if (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '%' || ch == '=' ||
                ch == '<' || ch == '>' || ch == '&' || ch == '|' || ch == '^' || ch == '~' ||
                ch == '!' || ch == '?' || ch == ':' || ch == '~' || ch == '@' || ch == '`' ||
                ch == '\\' || ch == '$' || ch == '\"' || ch == '\'' || ch == '_' ||
                ch == '(' || ch == ')' || ch == '{' || ch == '}' || ch == '[' || ch == ']' ||
                ch == ';' || ch == ',' || ch == '.') {
                printf("%c : %s\n", ch, classify_token(&ch));
            }
            // Check for preprocessor directives
            else if (ch == '#') {
                printf("# : %s\n", classify_token("#"));
            }
            // Ignore whitespace characters
            else if (!isspace(ch)) {
                // Error handling for unrecognized characters can be added here
                printf("%c : Unrecognized\n", ch);
            }
        }
    }

    return 0;
}
