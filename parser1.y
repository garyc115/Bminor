/*
 * B-minor langauge parser
 * see 'Introduction to Compilers and Language Design', Douglas Thain
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <math.h>
extern int yylex();
extern int yylineno;
void yyerror(char *s, ...);
%}

%union {
    int i;
    char ch;
    char s[20];
}

 /* declare tokens */
%token ARRAY BOOLEAN CHAR ELSE FOR FUNCTION
%token IF INTEGER RETURN STRING VOID WHILE
%token <i> INTEGER_LITERAL
%token <ch> CHAR_LITERAL
%token <i> BOOLEAN_LITERAL
%token <s> STRING_LITERAL
%token <i> FALSE TRUE
%token <s> IDENTIFIER

%nonassoc <i> CMP
%right '='
%left '+' '-'
%left '*' '/' '%'

%type <i> iexp iexplist

%start program

%%

program: statements

statements:
  | statements statement
  | statement
  ;

statement:
  | iexp                                        { printf("%d\n", $1); }
  ;

iexp: iexp CMP iexp                             {  }
  | iexp '+' iexp                               { $$ = $1 + $3; }
  | iexp '-' iexp                               { $$ = $1 - $3; }
  | iexp '*' iexp                               { $$ = $1 * $3; }
  | iexp '/' iexp                               { $$ = $1 / $3; }
  | iexp '%' iexp                               { $$ = $1 % $3; }
  | '(' iexp ')'                                { $$ = $2; }
  | INTEGER_LITERAL                             {  }
  | BOOLEAN_LITERAL                             {  }
  | IDENTIFIER                                  {  }
  | FALSE                                       {  }
  | TRUE                                        {  }
  | IDENTIFIER '=' iexp ';'                     { $$ = $3; }
  | IDENTIFIER ':' INTEGER '=' iexp ';'         {  }
  | IDENTIFIER ':' INTEGER ';'                  {  }
  | IDENTIFIER ':' BOOLEAN '=' iexp ';'         {  }
  | IDENTIFIER ':' BOOLEAN ';'                  {  }
  | IDENTIFIER '(' iexplist ')'                 {  }
  ;

iexplist: iexp
  | iexp ',' iexplist                           {  }
  ;


%%

void yyerror(char *s, ...)
{
  va_list ap;
  va_start(ap, s);

  fprintf(stderr, "%d: error: ", yylineno);
  vfprintf(stderr, s, ap);
  fprintf(stderr, "\n");
}

int main()
{
  int ans = (2 + 3) * (10 / 5) - (10 % 3) ;
  printf("> Compare: ans = %d\n", ans);
  printf(">          ans = ");
  return yyparse();
}
