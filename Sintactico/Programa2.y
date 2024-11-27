%{
#include <stdio.h>
#include <stdlib.h>

FILE *yyin;
%}

IZQ [a-zA-Z0-9._%+-]
DER [a-zA-Z0-9.-]
ARROBA @
DOMINIO \.[a-zA-Z]{2,}

%%
{IZQ}+{ARROBA}{DER}+{DOMINIO} {
    printf("Correo electrónico válido: %s\n", yytext);
}
.|\n {
    /* Ignorar otros caracteres */
}
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
