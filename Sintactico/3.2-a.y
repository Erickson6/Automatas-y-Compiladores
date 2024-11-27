%{
#include <stdio.h>
#include <stdlib.h>

int keywords = 0;
int identifiers = 0;
int operators = 0;
int comments = 0;

FILE *yyin;
%}

KEYWORD (auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|inline|int|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while)
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
OPERATOR (\+|\-|\*|\/|\%|\=\=|\!\=|\<|\>|\<\=|\>\=|\&\&|\|\||\=\>|::|\->)
COMMENT (\/\/[^\n]*|\/\*([^*]|\*[^\/])*\*\/)

%%
{KEYWORD}     { keywords++; printf("Palabra reservada: %s\n", yytext); }
{IDENTIFIER}  { identifiers++; printf("Identificador: %s\n", yytext); }
{OPERATOR}    { operators++; printf("Operador: %s\n", yytext); }
{COMMENT}     { comments++; printf("Comentario: %s\n", yytext); }
.|\n          { /* Ignorar otros caracteres */ }
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

    printf("\nResumen del archivo:\n");
    printf("Palabras reservadas: %d\n", keywords);
    printf("Identificadores: %d\n", identifiers);
    printf("Operadores: %d\n", operators);
    printf("Comentarios: %d\n", comments);

    return 0;
}
