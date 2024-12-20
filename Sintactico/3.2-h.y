%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int keywords = 0;
int comments = 0;
int variables = 0;
int numbers = 0;
int arithmetic_operators = 0;
int logical_operators = 0;
int special_symbols = 0;

FILE *yyin;

void count_keyword(const char *word);
void count_comment(const char *comment);
void count_variable(const char *variable);
void count_number(const char *number);
void count_arithmetic_operator(const char *operator);
void count_logical_operator(const char *operator);
void count_special_symbol(const char *symbol);
%}

KEYWORD (alignas|alignof|and|and_eq|asm|auto|bitand|bitor|bool|break|case|catch|char|char16_t|char32_t|class|compl|const|constexpr|const_cast|continue|decltype|default|delete|do|double|dynamic_cast|else|enum|explicit|export|extern|false|float|for|friend|goto|if|inline|int|long|mutable|namespace|new|noexcept|not|not_eq|nullptr|operator|or|or_eq|private|protected|public|register|reinterpret_cast|return|short|signed|sizeof|static|static_assert|static_cast|struct|switch|template|this|thread_local|throw|true|try|typedef|typeid|typename|union|unsigned|using|virtual|void|volatile|wchar_t|while|xor|xor_eq)
COMMENT (\/\/[^\n]*|\/\*([^*]|\*[^\/])*\*\/)
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
NUMBER [0-9]+(\.[0-9]+)?
ARITHMETIC_OPERATOR (\+|\-|\*|\/|\%)
LOGICAL_OPERATOR (\&\&|\|\||\!)
SPECIAL_SYMBOL (\{|\}|

\[|\]

|\(|\)|\<|\>|\=|\;|\,|\.)

%%
{KEYWORD} {
    count_keyword(yytext);
}
{COMMENT} {
    count_comment(yytext);
}
{IDENTIFIER} {
    count_variable(yytext);
}
{NUMBER} {
    count_number(yytext);
}
{ARITHMETIC_OPERATOR} {
    count_arithmetic_operator(yytext);
}
{LOGICAL_OPERATOR} {
    count_logical_operator(yytext);
}
{SPECIAL_SYMBOL} {
    count_special_symbol(yytext);
}
.|\n { /* Ignorar otros caracteres */ }
%%

void count_keyword(const char *word) {
    keywords++;
    printf("Palabra reservada: %s\n", word);
}

void count_comment(const char *comment) {
    comments++;
    printf("Comentario: %s\n", comment);
}

void count_variable(const char *variable) {
    variables++;
    printf("Variable: %s\n", variable);
}

void count_number(const char *number) {
    numbers++;
    printf("N�mero: %s\n", number);
}

void count_arithmetic_operator(const char *operator) {
    arithmetic_operators++;
    printf("Operador aritm�tico: %s\n", operator);
}

void count_logical_operator(const char *operator) {
    logical_operators++;
    printf("Operador l�gico: %s\n", operator);
}

void count_special_symbol(const char *symbol) {
    special_symbols++;
    printf("S�mbolo especial: %s\n", symbol);
}

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
    printf("Comentarios: %d\n", comments);
    printf("Variables: %d\n", variables);
    printf("N�meros: %d\n", numbers);
    printf("Operadores aritm�ticos: %d\n", arithmetic_operators);
    printf("Operadores l�gicos: %d\n", logical_operators);
    printf("S�mbolos especiales: %d\n", special_symbols);

    return 0;
}
