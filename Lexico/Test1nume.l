%option noyywrap
%{
#include<stdio.h>
%}
%%
[0-9]+ {printf("Numero Entero\n");}
%%
int main(){
printf("Ingrese Numero Entero:\n");
yylex();return 0;
}