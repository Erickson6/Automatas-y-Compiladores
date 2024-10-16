%{
#include <stdio.h>
%}

%%
/* Verbos de la categoría analizar */
analizar|comparar|diferenciar|organizar|examinar { printf("Verbo de análisis: %s\n", yytext); }
/* Adjetivos calificativos positivos */
bueno|excelente|maravilloso|fantástico            { printf("Adjetivo positivo: %s\n", yytext); }
/* Conjunciones */
y|o|pero|aunque|sin embargo                      { printf("Conjunción: %s\n", yytext); }
/* Preposiciones */
a|ante|bajo|cabe|con|contra|de|desde|en|entre    { printf("Preposición: %s\n", yytext); }
/* Pronombres */
yo|tú|él|ella|nosotros|vosotros|ellos|ellas      { printf("Pronombre: %s\n", yytext); }
[a-zA-Z]+                                        { /* Ignorar otras palabras */ }
%%

int main() {
    yylex();
    return 0;
}

