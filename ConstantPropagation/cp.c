#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h> // Include stdlib.h for atoi

void input();
void output();
void change(int p, char *res);
void constant();

struct expr {
    char op[2], op1[5], op2[5], res[5];
    int flag;
} arr[10];

int n;

int main() { // Changed void main() to int main()
    input();
    constant();
    output();
    return 0; // Added return statement
}

void input() {
    int i;
    printf("\n\nEnter the maximum number of expressions : ");
    scanf("%d", &n);
    printf("\nEnter the input : \n");
    for (i = 0; i < n; i++) {
        scanf("%s", arr[i].op);
        scanf("%s", arr[i].op1);
        scanf("%s", arr[i].op2);
        scanf("%s", arr[i].res);
        arr[i].flag = 0;
    }
}

void constant() {
    int i;
    int op1, op2, res;
    char op, res1[5];
    for (i = 0; i < n; i++) {
        // Fixed parentheses placement in the if condition
        if ((isdigit(arr[i].op1[0]) && isdigit(arr[i].op2[0])) || strcmp(arr[i].op, "=") == 0) {
            // If both digits, store them in variables
            op1 = atoi(arr[i].op1);
            op2 = atoi(arr[i].op2);
            op = arr[i].op[0];
            switch (op) {
                case '+':
                    res = op1 + op2;
                    break;
                case '-':
                    res = op1 - op2;
                    break;
                case '*':
                    res = op1 * op2;
                    break;
                case '/':
                    if (op2 != 0) { // Prevent division by zero
                        res = op1 / op2;
                    } else {
                        printf("Error: Division by zero\n");
                        return; // Exit if there's an error
                    }
                    break;
                case '=':
                    res = op1; // Assign res1 to the result of op1
                    break;
                default:
                    continue; // Skip if operator is not recognized
            }
            sprintf(res1, "%d", res);
            arr[i].flag = 1;
            change(i, res1);
        }
    }
}

void output() {
    int i = 0;
    printf("\nOptimized code is : \n");
    for (i = 0; i < n; i++) {
        printf("%s %s %s %s", arr[i].op, arr[i].op1, arr[i].op2, arr[i].res);
        if (arr[i].flag) {
            printf(" (optimized)");
        }
        printf("\n");
    }
}


void change(int p, char *res) {
    int i;
    for (i = p + 1; i < n; i++) {
        if (strcmp(arr[p].res, arr[i].op1) == 0)
            strcpy(arr[i].op1, res);
        else if (strcmp(arr[p].res, arr[i].op2) == 0)
            strcpy(arr[i].op2, res);
    }
}