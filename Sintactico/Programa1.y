%{
#include <stdio.h>
#include <stdlib.h>

FILE *yyin;
%}

DIGIT [0-9]
OPERATOR [+*/-]

%%
{DIGIT}+    printf("N�mero: %s\n", yytext);
{OPERATOR}  printf("Operador: %s\n", yytext);
.           /* Ignorar otros caracteres */
%%

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Uso: %s <archivo>\n", argv[0]);
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        perror("No se pudo abrir el archivo");
        exit(1);
    }

    yylex();
    fclose(yyin);
    return 0;
}
