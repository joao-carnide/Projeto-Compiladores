%{
	/*
		Gonçalo Manuel Oliveira e Sousa			2016244072
		João Filipe Carnide de Jesus Nunes		2017247442
	*/
	
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <stdarg.h>

	typedef enum {
		node_raiz,
		node_var, 
		node_metodos, 
		node_statements, 
		node_operators, 
		node_terminais, 
		node_id
	} node_type;

	typedef struct node * no;
	typedef struct node {
		char * valor;
		char * s_type;
		node_type type;
		int num_node;
		no pai;
		no filho;
		no irmao;
	} node;

	int conta;
	no raiz;
	no aux;
	int flag_erro = 0;
	extern int flag;

	int yylex(void);
    void yyerror (const char *s);

	no cria_node(node_type type, char * valor, char * s_type) {
		no novo = malloc(sizeof(node));
		novo->s_type = (char *)malloc(1 + strlen(s_type) * sizeof(char));
		strcpy(novo->s_type, s_type);
		novo->valor = (char *)malloc(1 + strlen(valor) * sizeof(char));
		strcpy(novo->valor, valor);
		novo->type = type;
		novo->num_node = 0;
		novo->pai = NULL;
		novo->filho = NULL;
		novo->irmao = NULL;
		return novo;
	}

	void atribuir_tipo(no novo, char * type) {
		no aux = novo->irmao;
		while (aux != NULL) {
			aux = aux->irmao;
		}
		strcpy(aux->filho->s_type, type);
	}

	void adicionar_node(no pai, no novo) {
		if (novo == NULL) {
			return ;
		}
		pai->filho = novo;
		pai->num_node++;
		novo->pai = pai;
	}

	void adicionar_irmao(no node_a, no node_b) {
		if (node_a == NULL || node_b == NULL) {
			return ;
		}
		no aux;
		aux = node_a;
		while (aux->irmao != NULL) {
			aux = aux->irmao;
		}
		aux->irmao = node_b;
		if (node_a->pai != NULL) {
			node_b->pai = node_a->pai;
			node_b->pai->num_node++;
		}
	}

	int conta_filhos(no raiz){
		int conta = 0;
		no aux;
		aux = raiz;
		while (aux != NULL) {
			aux = aux->filho;
			conta++;
		}
		return conta;
	}

	int conta_irmaos(no raiz) {
		int conta = 0;
		no aux;
		aux = raiz;
		while (aux != NULL) {
			aux = aux->irmao;
			conta++;
		}
		return conta;
	}

	void arvore(no raiz, int pontos) {
		if (raiz == NULL) {
			return ;
		}
		int i = 0;
		no aux;
		if (raiz->type == node_raiz) {
			printf("%s\n", raiz->s_type);
		}
		else {
			while (i < pontos) {
				printf("..");
				i++;
			}
			if (strcmp(raiz->valor,"") != 0) {
				printf("%s(%s)\n", raiz->s_type, raiz->valor);
			}
			else {
				printf("%s\n", raiz->s_type);
			}
		}
		aux = raiz->filho;
		while (aux != NULL) {
			no aux_free = aux;
			arvore(aux, pontos+1);
			aux = aux->irmao;
			free(aux_free->valor);
			free(aux_free->s_type);
			free(aux_free);
		}
	}
%}

%union {
	int numero;
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
Program:	CLASS ID LBRACE ProgramScript RBRACE					{raiz = cria_node(node_raiz, "", "Program");
																	aux = cria_node(node_id, $2, "Id");
																	adicionar_node(raiz, aux);
																	$$ = raiz;}
		;

ProgramScript: 	%empty												{$$ = NULL;}
			|	MethodDecl ProgramScript							{$$ = $1;
																	adicionar_irmao($$, $2);}
			|	FieldDecl ProgramScript								{$$ = $1;
																	adicionar_irmao($$, $2);}
			|	SEMICOLON ProgramScript								{$$ = $2;}
			;

MethodDecl:	PUBLIC STATIC MethodHeader MethodBody					{$$ = cria_node(node_metodos, "", "MethodDecl");
																	adicionar_node($$, $3);
																	adicionar_irmao($$, $4);}
		;

FieldDecl:	PUBLIC STATIC Type ID FieldDecl2 SEMICOLON				{$$ = cria_node(node_var, "", "FieldDecl");
																	adicionar_node($$, $3);
																	adicionar_irmao($3, cria_node(node_id, $4, "Id"));
																	if ($5 != NULL){
																		aux = $5;
																		while (aux != NULL) {
																			no aux1 = cria_node(node_var, "", "FieldDecl");
																			no aux2 = cria_node($3->type, $3->valor, $3->s_type);
																			adicionar_node(aux1, aux2);
																			adicionar_irmao(aux2, cria_node(node_id, aux->valor, "Id"));
																			adicionar_irmao($$, aux1);
																			aux = aux->irmao;
																		}
																		free(aux);
																	}}
		|	error SEMICOLON											{$$ = NULL; flag_erro = 1;}
		;

FieldDecl2:	%empty													{$$ = NULL;}
		|	COMMA ID FieldDecl2										{$$ = cria_node(node_id, $2, "Id");
																	adicionar_irmao($$, $3);}
		;

Type:	BOOL														{$$ = cria_node(node_terminais, "", "Bool");}
	|	INT															{$$ = cria_node(node_terminais, "", "Int");}
	|	DOUBLE														{$$ = cria_node(node_terminais, "", "Double");}
	;

MethodHeader:	Type ID LPAR MethodHeader2 RPAR						{$$ = cria_node(node_metodos, "", "MethodHeader");
																	adicionar_node($$,$1);
																	adicionar_irmao($1, cria_node(node_id, $2, "Id"));
																	aux = cria_node(node_metodos, "", "MethodParams");
																	adicionar_irmao($1, aux);
																	adicionar_node(aux, $4);}
			|	VOID ID LPAR MethodHeader2 RPAR						{$$ = cria_node(node_metodos, "", "MethodHeader");
																	$1 = cria_node(node_terminais, "", "Void");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, cria_node(node_id, $2, "Id"));
																	aux = cria_node(node_metodos, "", "MethodParams");
																	adicionar_irmao($1, aux);
																	adicionar_node(aux, $4);}
			;

MethodHeader2:	%empty												{$$ = NULL;}
			|	FormalParams										{$$ = $1;}
			;

FormalParams:	Type ID FormalParams2								{$$ = cria_node(node_metodos, "", "ParamDecl");
																	adicionar_node($$, $1);
																	aux = cria_node(node_id, $2, "Id");
																	adicionar_irmao($1, aux);
																	adicionar_irmao($$, $3);}
			|	STRING LSQ RSQ ID									{$$ = cria_node(node_metodos, "", "ParamDecl");
																	aux = cria_node(node_metodos, "", "StringArray");
																	adicionar_node($$, aux);
																	adicionar_irmao(aux, cria_node(node_id, $4, "Id"));}
			;

FormalParams2:	%empty												{$$ = NULL;}
			|	COMMA Type ID										{$$ = cria_node(node_metodos, "", "ParamDecl");
																	aux = cria_node(node_id, $3, "Id");
																	adicionar_node($$, $2);
																	adicionar_irmao($2,aux);
																	adicionar_irmao($$,$4);}
			;

MethodBody:	LBRACE MethodBody2 RBRACE								{$$ = cria_node(node_metodos, "", "MethodBody");
																	adicionar_node($$, $2);}
		;

MethodBody2: 	%empty												{$$ = NULL;}
			|	Statement MethodBody2								{$$ = $1;
																	adicionar_irmao($$, $2);}
			|	VarDecl MethodBody2									{if ($1 != NULL){
																		$$ = $1;
																		adicionar_irmao($$, $2);
																		}
																	else {
																		$$ = $2;
																	}}
			;

VarDecl:	Type ID VarDecl2 SEMICOLON								{$$ = cria_node(node_metodos, "", "VarDecl");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, cria_node(node_id, $2, "Id"));
																	if ($3 != NULL){
																		aux = $3;
																		while (aux != NULL) {
																			no aux1 = cria_node(node_metodos, "", "VarDecl");
																			no aux2 = cria_node($1->type, $1->valor, $1->s_type);
																			adicionar_node(aux1, aux2);
																			adicionar_irmao(aux2, cria_node(node_id, aux->valor, "Id"));
																			adicionar_irmao($$, aux1);
																			aux = aux->irmao;
																		}
																		free(aux);
																	}}
		;

VarDecl2:	%empty													{$$ = NULL;}
		|	COMMA ID VarDecl2										{$$ = cria_node(node_id, $2, "Id");
																	adicionar_irmao($$, $3);}
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

int main(int argc, char *argv[]) {
	if (argc > 1) {
		if (strcmp(argv[1],"-l") == 0) {
			flag = 1;
			yylex();
		}
		else if (strcmp(argv[1],"-e1") == 0) {
			flag = 0;
			yylex();
		}
		else if (strcmp(argv[1],"-e2") == 0) {
			flag = 0;
			error_flag = 1;
			yylex();
		}
		else if (strcmp(argv[1],"-t") == 0) {
			flag = 2;
		}
	}
	else if (argc == 1){
		flag = 0;
	}
	yyparse();
	return 0;
}