%{
#include <stdio.h>
%}

%%
/* Comentarios estilo C */
"//".*                   { printf("Comentario: %s\n", yytext); }
"/*"(.|\n)*"*/"           { printf("Comentario: %s\n", yytext); }

/* Texto que se presenta en pantalla (dentro de printf o puts) */
"printf"\"(".*"\")"       { printf("Texto de salida: %s\n", yytext); }
"puts"\"(".*"\")"         { printf("Texto de salida: %s\n", yytext); }

/* Ignorar otros tokens */
.                         { /* ignorar */ }
%%

int main() {
    yylex();
    return 0;
}

