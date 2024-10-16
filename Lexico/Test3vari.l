%option noyywrap
%{
#include<stdio.h>
%}
%%
[\n\t];
[A-Za-z]+[0-9]+[_]+ {printf("Variable:\n");}
%%
int main(){
printf("Ingrese Variable:\n");
yylex();return 0;
}