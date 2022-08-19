/*
 * B-minor langauge scanner
 * see 'Introduction to Compilers and Language Design', Douglas Thain
 */

%option noyywrap nodefault yylineno

%x COMMENT

%{
#include <stdio.h>
#include <stdlib.h>
int yylineno, yylval;
void yyerror(char *s);
%}

%%
 /* multi-line comments */
"/*"                          { BEGIN(COMMENT); }
<COMMENT>"*/"                 { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|.
<COMMENT><<EOF>>              { printf("Unterminated comment\n"); return 0; }

 /* C++ style comments */
"//".*

 /* assorted delimiters */
"," |
":" |
";" |
"}" |
"{" |
"(" |
")"                         { printf("[ DELIMITER: %s ]\n", yytext); }

  /* arithmetic operators */
"+" |
"-" |
"*" |
"/" |
"%"                         { printf("[ ARITHMETIC: %s ]\n", yytext); }

 /* assignment operator */
"="                         { printf("[ ASSIGNMENT: %s ]\n", yytext); }

 /* comparison operators */
">"
"<"  |
"<>" |
"==" |
">=" |
"<="                       { printf("[ COMPARISON: %s ]\n", yytext); }

  /* keywords */
"array"     |
"boolean"   |
"char"      |
"else"      |
"false"     |
"for"       |
"function"  |
"if"        |
"integer"   |
"return"    |
"string"    |
"true"      |
"void"      |
"while"                     { printf("[ KEYWORD: %s ]\n", yytext); }

  /* integer literal */
0|[1-9][0-9]*                   { yylval = atoi(yytext); printf("[ INTEGER: %d ]\n", yylval); }
  /* char literal */
\'[a-zA-Z0-9]\'                 { printf("[ CHARACTER: %s ]\n", yytext); }
  /* string literal */
\"([^"\\]|\\['"?\\abfnrtv])*\"  { printf("[ STRING: %s ]\n", yytext); }

  /* identifiers */
[a-zA-Z_][a-zA-Z0-9_]*          { printf("[ IDENTIFIER: %s ]\n", yytext); }


[ \t\n]                      /* ignore whitespace */

.                               { printf("[ UNKNOWN: %s ]\n", yytext); }

%%

void yyerror(char *s)
{
    fprintf(stderr, "Error: %s", s);
}
