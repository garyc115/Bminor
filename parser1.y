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

%type <i> iexp iexplist assignment_statement

%start program

%%

program: statements                             { printf("Done!\n"); }

statements: statements statement                {  }
  | statement                                   {  }
  ;

statement: assignment_statement ';'             { printf("statement: assignment_statement %d\n", $1); } 
  | iexplist ';'                                { printf("statement: iexplist %d\n", $1); }
  ;

assignment_statement: IDENTIFIER '=' iexp       { $$ = $3; printf("assignment_statement: IDENTIFIER = %d\n", $$); }

iexplist: iexplist ',' iexp                     {  }
  | iexp                                        { $$ = $1; }
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
  | FALSE                                       {  }
  | TRUE                                        {  }
  | IDENTIFIER ':' INTEGER '=' iexp             {  }
  | IDENTIFIER ':' INTEGER                      {  }
  | IDENTIFIER ':' BOOLEAN '=' iexp             {  }
  | IDENTIFIER ':' BOOLEAN                      {  }
  | IDENTIFIER '(' iexplist ')'                 {  }
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
  printf(">\n");
  return yyparse();
}
