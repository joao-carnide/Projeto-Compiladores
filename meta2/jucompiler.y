%{
	/*
		Gonçalo Manuel Oliveira e Sousa			2016244072
		João Filipe Carnide de Jesus Nunes		2017247442
	*/
	
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <stdarg.h>

	int error_flag = 0;
	extern int flag;

	int yylex(void);
    void yyerror (const char *s);

%}

%union {
	char * id;
	struct node * node;
}

%token <id> ID
%token <id> INTLIT
%token <id> REALLIT
%token <id> BOOLLIT
%token <id> STRLIT

%token AND ASSIGN STAR COMMA DIV EQ GE GT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PLUS RBRACE RPAR RSQ SEMICOLON ARROW LSHIFT RSHIFT XOR BOOL CLASS DOTLENGTH DOUBLE ELSE IF INT PRINT PARSEINT PUBLIC RETURN STATIC STRING VOID WHILE RESERVED

%type <node> Program
%type <node> ProgramScript
%type <node> MethodDecl
%type <node> FieldDecl
%type <node> FieldDecl2
%type <node> Type
%type <node> MethodHeader
%type <node> MethodHeader2
%type <node> FormalParams
%type <node> FormalParams2
%type <node> MethodBody
%type <node> MethodBody2
%type <node> VarDecl
%type <node> VarDecl2
%type <node> Statement
%type <node> StatementError
%type <node> Statement2
%type <node> ExprReturn
%type <node> Statement3
%type <node> StatementPrint
%type <node> MethodInvocation
%type <node> MethodInvocation2
%type <node> MethodInvocationExpr
%type <node> Assignment
%type <node> ParseArgs
%type <node> Expr
%type <node> ExprOperations
%type <node> Expr2
%type <node> ExprLit

%left COMMA
%right ASSIGN
%left OR
%left AND
%left XOR
%left EQ NE
%left GE GT LE LT
%left LSHIFT RSHIFT
%left PLUS MINUS
%left STAR DIV MOD
%right NOT
%left LPAR RPAR
%nonassoc ELSE


%%
Program:	CLASS ID LBRACE ProgramScript RBRACE					{;}
		;

ProgramScript: 	%empty												{$$ = NULL;}
			|	MethodDecl ProgramScript							{$$ = $1;}
			|	FieldDecl ProgramScript								{$$ = $1;}
			|	SEMICOLON ProgramScript								{$$ = $2;}
			;

MethodDecl:	PUBLIC STATIC MethodHeader MethodBody					{;}
		;

FieldDecl:	PUBLIC STATIC Type ID FieldDecl2 SEMICOLON				{;}
		|	error SEMICOLON											{$$ = NULL; error_flag = 1;}
		;

FieldDecl2:	%empty													{$$ = NULL;}
		|	COMMA ID FieldDecl2										{;}
		;

Type:	BOOL														{;}
	|	INT															{;}
	|	DOUBLE														{;}
	;

MethodHeader:	Type ID LPAR MethodHeader2 RPAR						{;}
			|	VOID ID LPAR MethodHeader2 RPAR						{;}
			;

MethodHeader2:	%empty												{$$ = NULL;}
			|	FormalParams										{$$ = $1;}
			;

FormalParams:	Type ID FormalParams2								{;}
			|	STRING LSQ RSQ ID									{;}
			;

FormalParams2:	%empty												{$$ = NULL;}
			|	COMMA Type ID										{;}
			;

MethodBody:	LBRACE MethodBody2 RBRACE								{;}
		;

MethodBody2: 	%empty												{$$ = NULL;}
			|	Statement MethodBody2								{$$ = $1;}
			|	VarDecl MethodBody2									{if ($1 != NULL){$$ = $1;}else{$$ = $2;};}
			;

VarDecl:	Type ID VarDecl2 SEMICOLON								{;}
		;

VarDecl2:	%empty													{$$ = NULL;}
		|	COMMA ID VarDecl2										{;}
		;

Statement:	LBRACE Statement2 RBRACE								{;}
		|	IF LPAR Expr RPAR StatementError						{;}
		|	IF LPAR Expr RPAR StatementError ELSE StatementError	{;}
		|	WHILE LPAR Expr RPAR StatementError						{;}
		|	RETURN ExprReturn SEMICOLON								{;}
		|	Statement3 SEMICOLON									{$$ = $1;}
		|	PRINT LPAR StatementPrint RPAR SEMICOLON				{;}
		;

StatementError:	Statement											{$$ = $1;}
			|	error SEMICOLON										{error_flag = 1;}
			;

Statement2:	%empty													{$$ = NULL;}
		|	StatementError Statement2								{if ($1 != NULL){$$ = $1;}else{$$ = $2;}}
		;

ExprReturn:	%empty													{$$ = NULL;}
		|	Expr													{$$ = $1;}
		;

Statement3:	%empty													{$$ = NULL;}
		|	MethodInvocation										{$$ = $1;}
		|	Assignment												{$$ = $1;}
		|	ParseArgs												{$$ = $1;}
		;

StatementPrint:	Expr												{$$ = $1;}
			|	STRLIT												{;}
			;

MethodInvocation:	ID LPAR MethodInvocation2 RPAR					{;}
				|	ID LPAR error RPAR								{$$ = NULL;}
				;

MethodInvocation2:	%empty											{$$ = NULL;}
				|	Expr MethodInvocationExpr						{$$ = $1;}
				;

MethodInvocationExpr:	%empty										{$$ = NULL;}
					|	COMMA Expr MethodInvocationExpr				{if($2!=NULL){$$=$2;}else{$$=$2;}}
					;

Assignment:	ID ASSIGN Expr											{;}
		;

ParseArgs:	PARSEINT LPAR ID LSQ Expr RSQ LPAR						{;}
		|	PARSEINT LPAR error RPAR								{$$ = NULL; error_flag = 1;}
		;

Expr:	Assignment													{$$ = $1;}	
	|	ExprOperations												{$$ = $1;}
	;

ExprOperations:	ExprOperations PLUS ExprOperations					{;}
			|	ExprOperations MINUS ExprOperations					{;}
			|	ExprOperations STAR	ExprOperations					{;}
			|	ExprOperations DIV ExprOperations					{;}
			|	ExprOperations MOD ExprOperations					{;}
			|	ExprOperations AND ExprOperations					{;}
			|	ExprOperations OR ExprOperations					{;}
			|	ExprOperations XOR ExprOperations					{;}
			|	ExprOperations LSHIFT ExprOperations				{;}
			|	ExprOperations RSHIFT ExprOperations				{;}
			|	ExprOperations EQ ExprOperations					{;}
			|	ExprOperations GE ExprOperations					{;}
			|	ExprOperations GT ExprOperations					{;}
			|	ExprOperations LE ExprOperations					{;}
			|	ExprOperations LT ExprOperations					{;}
			|	ExprOperations NE ExprOperations					{;}
			|	PLUS ExprOperations %prec NOT						{;}
			|	MINUS ExprOperations %prec NOT						{;}
			|	NOT ExprOperations									{;}
			|	LPAR ExprOperations RPAR							{$$ = $2;}
			|	LPAR error RPAR										{$$ = NULL; error_flag = 1;}
			|	Expr2												{$$ = $1;}
			|	ID													{;}
			|	ID DOTLENGTH										{;}
			|	ExprLit												{$$ = $1;}
			;

Expr2:	MethodInvocation											{$$ = $1;}
	|	ParseArgs													{$$ = $1;}
	;

ExprLit:	INTLIT													{;}
		|	REALLIT													{;}
		|	BOOLLIT													{;}

%%