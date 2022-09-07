/*
 * B-minor langauge scanner
 * see 'Introduction to Compilers and Language Design', Douglas Thain
 */

%option noyywrap nodefault yylineno

%x COMMENT

%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>
#include "parser1.tab.h"
extern void yyerror(char *s, ...);
int yylineno;
%}

%%
 /* multi-line comments */
"/*"                          { BEGIN(COMMENT); }
<COMMENT>"*/"                 { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|.
<COMMENT><<EOF>>              { fprintf(stderr, "Unterminated comment\n"); return 0; }

 /* C++ style comments */
"//".*

 /* assorted delimiters */
"," |
":" |
";" |
"}" |
"{" |
"(" |
")"                         { return yytext[0]; }

  /* arithmetic operators */
"+" |
"-" |
"*" |
"/" |
"%"                         { return yytext[0]; }

 /* assignment operator */
"="                         { return yytext[0]; }

 /* comparison operators */
">"                         { yylval.i = 1; return CMP; }
"<"                         { yylval.i = 2; return CMP; }
"<>"                        { yylval.i = 3; return CMP; }
"=="                        { yylval.i = 4; return CMP; }
">="                        { yylval.i = 5; return CMP; }
"<="                        { yylval.i = 6; return CMP; }

  /* keywords */
"array"                     { return ARRAY; }
"boolean"                   { return BOOLEAN; }
"char"                      { return CHAR; }
"else"                      { return ELSE; }
"false"                     { yylval.i = 0; return FALSE; }
"for"                       { return FOR; }
"function"                  { return FUNCTION; }
"if"                        { return IF; }
"integer"                   { return INTEGER; }
"return"                    { return RETURN; }
"string"                    { return STRING; }
"true"                      { yylval.i = 1; return TRUE; }
"void"                      { return VOID; }
"while"                     { return WHILE; }

  /* integer literal */
0|[1-9][0-9]*               { yylval.i = atoi(yytext); return INTEGER_LITERAL; }

  /* char literal */
\'[a-zA-Z0-9]\'             { strncpy(yylval.s, yytext, 20); return CHAR_LITERAL; }

  /* string literal */
\"([^"\\]|\\['"?\\abfnrtv])*\"  { strncpy(yylval.s, yytext, 20); return STRING_LITERAL; }

  /* identifiers */
[a-zA-Z_][a-zA-Z0-9_]*      { strncpy(yylval.s, yytext, 20); return IDENTIFIER; }


[ \t\n]                      /* ignore whitespace */

.                           { yyerror("Unknown character %c\n", *yytext); }

%%
