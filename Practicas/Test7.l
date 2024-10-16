%{
#include <stdio.h>
%}

%%
[a-z]    { putchar(yytext[0]); }  /* Si es minúscula, la imprime tal cual */
[A-Z]    { putchar(yytext[0] + 'a' - 'A'); }  /* Convierte a minúscula */
.        { putchar(yytext[0]); }  /* Para cualquier otro carácter */
\n       { putchar('\n'); }  /* Para las nuevas líneas */
%%

int main() {
    yylex();
    return 0;
}
