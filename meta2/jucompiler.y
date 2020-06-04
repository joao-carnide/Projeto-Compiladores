%{
	/*
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
    void yyerror(const char *s);

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
	char * id;
	struct node * node;
}

%token AND ASSIGN STAR COMMA DIV EQ GE GT LBRACE LE LPAR LSQ LT MINUS MOD NE NOT OR PLUS RBRACE RPAR RSQ SEMICOLON ARROW LSHIFT RSHIFT XOR CLASS DOTLENGTH ELSE IF PRINT PARSEINT PUBLIC RETURN STATIC STRING VOID WHILE INT DOUBLE BOOL RESERVED

%token <id> ID
%token <id> INTLIT
%token <id> REALLIT
%token <id> BOOLLIT
%token <id> STRLIT

%type <node> Program ProgramScript MethodDecl FieldDecl FieldDecl2 Type MethodHeader MethodHeader2 FormalParams FormalParams2 MethodBody MethodBody2 VarDecl VarDecl2 Statement Statement2 ExprReturn Statement3 StatementPrint MethodInvocation MethodInvocation2 MethodInvocationExpr Assignment ParseArgs Expr ExprOperations Expr2 ExprLit

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
%left LPAR RPAR LSQ RSQ

%right ELSE

%%

Program:	CLASS ID LBRACE ProgramScript RBRACE					{raiz = cria_node(node_raiz, "", "Program");
																	aux = cria_node(node_id, $2, "Id");
																	adicionar_node(raiz, aux);
																	adicionar_irmao(aux, $4);
																	$$ = raiz;
																	if (flag == 2 && flag_erro == 0) {
																		arvore($$, 0);
																	}}
		;

ProgramScript: 	/* empty */											{$$ = NULL;}
			|	MethodDecl ProgramScript							{$$ = $1;
																	adicionar_irmao($$, $2);}
			|	FieldDecl ProgramScript								{$$ = $1;
																	adicionar_irmao($$, $2);}
			|	SEMICOLON ProgramScript								{$$ = $2;}
			;

MethodDecl:	PUBLIC STATIC MethodHeader MethodBody					{$$ = cria_node(node_metodos, "", "MethodDecl");
																	adicionar_node($$, $3);
																	adicionar_irmao($3, $4);}
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

FieldDecl2:	/* empty */												{$$ = NULL;}
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
																	aux = cria_node(node_terminais, "", "Void");
																	adicionar_node($$, aux);
																	adicionar_irmao(aux, cria_node(node_id, $2, "Id"));
																	no aux2 = cria_node(node_metodos, "", "MethodParams");
																	adicionar_irmao(aux, aux2);
																	adicionar_node(aux2, $4);}
			;

MethodHeader2:	/* empty */											{$$ = NULL;}
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

FormalParams2:	/* empty */											{$$ = NULL;}
			|	COMMA Type ID FormalParams2 						{$$ = cria_node(node_metodos, "", "ParamDecl");
																	aux = cria_node(node_id, $3, "Id");
																	adicionar_node($$, $2);
																	adicionar_irmao($2, aux);
																	adicionar_irmao($$, $4);}
			;

MethodBody:	LBRACE MethodBody2 RBRACE								{$$ = cria_node(node_metodos, "", "MethodBody");
																	adicionar_node($$, $2);}
		;

MethodBody2: 	/* empty */											{$$ = NULL;}
			|	Statement MethodBody2								{if ($1 != NULL){
																		$$ = $1;
																		adicionar_irmao($$, $2);
																		}
																	else {
																		$$ = $2;
																	}}
			|	VarDecl MethodBody2									{$$ = $1;
																	adicionar_irmao($$, $2);}
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

VarDecl2:	/* empty */												{$$ = NULL;}
		|	COMMA ID VarDecl2										{$$ = cria_node(node_id, $2, "Id");
																	adicionar_irmao($$, $3);}
		;

Statement:	LBRACE Statement2 RBRACE								{if (conta_irmaos($2) > 1) {
																		aux = cria_node(node_statements, "", "Block");
																		$$ = aux;
																		adicionar_node(aux, $2);
																	}
																	else {
																		$$ = $2;
																	}}
		|	IF LPAR Expr RPAR Statement %prec ELSE					{$$ = cria_node(node_statements, "", "If");
																	adicionar_node($$,$3);
																	aux = cria_node(node_statements, "", "Block");
																	if (conta_irmaos($5) == 1 && $5 != NULL) {
																		adicionar_irmao($3, $5);
																		adicionar_irmao($5, aux);
																	}
																	else {
																		adicionar_irmao($3, aux);
																		adicionar_node(aux, $5);
																		adicionar_irmao(aux, cria_node(node_statements, "", "Block"));
																	}}
		|	IF LPAR Expr RPAR Statement ELSE Statement				{$$ = cria_node(node_statements, "", "If");
																	adicionar_node($$,$3);
																	aux = cria_node(node_statements, "", "Block");
																	if (conta_irmaos($5) == 1 && $5 != NULL) {
																		adicionar_irmao($3, $5);
																		if (conta_irmaos($7) == 1 && $7 != NULL) {
																			adicionar_irmao($5, $7);
																		}
																		else {
																			adicionar_irmao($5, aux);
																			adicionar_node(aux, $7);
																		}
																	}
																	else {
																		adicionar_irmao($3, aux);
																		adicionar_node(aux, $5);
																		if (conta_irmaos($7) == 1 && $7 != NULL) {
																			adicionar_irmao(aux, $7);
																		}
																		else {
																			no aux2 = cria_node(node_statements, "", "Block");
																			adicionar_irmao(aux, aux2);
																			adicionar_node(aux2, $7);
																		}
																	}}
		|	WHILE LPAR Expr RPAR Statement							{$$ = cria_node(node_statements, "", "While");
																	adicionar_node($$, $3);
																	if (conta_irmaos($5) == 1 && $5 != NULL) {
																		adicionar_irmao($3, $5);
																	}
																	else {
																		aux = cria_node(node_statements, "", "Block");
																		adicionar_irmao($3, aux);
																		adicionar_node(aux, $5);
																	}}
		|	RETURN ExprReturn SEMICOLON								{$$ = cria_node(node_statements, "", "Return");
																	adicionar_node($$, $2);}
		|	Statement3 SEMICOLON									{$$ = $1;}
		|	PRINT LPAR StatementPrint RPAR SEMICOLON				{$$ = cria_node(node_statements, "", "Print");
																	adicionar_node($$, $3);}
		|	error SEMICOLON											{$$ = NULL; flag_erro = 1;}
		;

Statement2:	/* empty */												{$$ = NULL;}
		|	Statement Statement2									{if ($1 != NULL) {
																		$$ = $1;
																		adicionar_irmao($$, $2);
																	}
																	else {
																		$$ = $2;
																	}}
		;

ExprReturn:	/* empty */												{$$ = NULL;}
		|	Expr													{$$ = $1;}
		;

Statement3:	/* empty */												{$$ = NULL;}
		|	MethodInvocation										{$$ = $1;}
		|	Assignment												{$$ = $1;}
		|	ParseArgs												{$$ = $1;}
		;

StatementPrint:	Expr												{$$ = $1;}
			|	STRLIT												{$$ = cria_node(node_terminais, $1, "StrLit");}
			;

MethodInvocation:	ID LPAR MethodInvocation2 RPAR					{$$ = cria_node(node_operators, "", "Call");
																	aux = cria_node(node_id, $1, "Id");
																	adicionar_node($$, aux);
																	adicionar_irmao(aux, $3);}
				|	ID LPAR error RPAR								{$$ = NULL;
																	flag_erro = 1;}
				;

MethodInvocation2:	/* empty */										{$$ = NULL;}
				|	Expr MethodInvocationExpr						{$$ = $1;
																	adicionar_irmao($$, $2);}
				;

MethodInvocationExpr:	/* empty */									{$$ = NULL;}
					|	COMMA Expr MethodInvocationExpr				{if($2!=NULL) {
																		$$=$2;
																		adicionar_irmao($$, $3);
																	}
																	else {
																		$$=$2;
																	}}
					;

Assignment:	ID ASSIGN Expr											{$$ = cria_node(node_operators, "", "Assign");
																	aux = cria_node(node_id, $1, "Id");
																	adicionar_node($$, aux);
																	adicionar_irmao(aux, $3);}
		;

ParseArgs:	PARSEINT LPAR ID LSQ Expr RSQ RPAR						{$$ = cria_node(node_operators, "", "ParseArgs");
																	aux = cria_node(node_id, $3, "Id");
																	adicionar_node($$, aux);
																	adicionar_irmao(aux, $5);}
		|	PARSEINT LPAR error RPAR								{$$ = NULL;
																	flag_erro = 1;}
		;

Expr:	Assignment													{$$ = $1;}
	|	ExprOperations												{$$ = $1;}
	;

ExprOperations:	ExprOperations PLUS ExprOperations					{$$ = cria_node(node_operators, "", "Add");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations MINUS ExprOperations					{$$ = cria_node(node_operators, "", "Sub");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations STAR ExprOperations					{$$ = cria_node(node_operators, "", "Mul");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations DIV ExprOperations					{$$ = cria_node(node_operators, "", "Div");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations MOD ExprOperations					{$$ = cria_node(node_operators, "", "Mod");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations AND ExprOperations					{$$ = cria_node(node_operators, "", "And");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations OR ExprOperations					{$$ = cria_node(node_operators, "", "Or");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations XOR ExprOperations					{$$ = cria_node(node_operators, "", "Xor");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations LSHIFT ExprOperations				{$$ = cria_node(node_operators, "", "Lshift");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations RSHIFT ExprOperations				{$$ = cria_node(node_operators, "", "Rshift");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations EQ ExprOperations					{$$ = cria_node(node_operators, "", "Eq");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations GE ExprOperations					{$$ = cria_node(node_operators, "", "Ge");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations GT ExprOperations					{$$ = cria_node(node_operators, "", "Gt");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations LE ExprOperations					{$$ = cria_node(node_operators, "", "Le");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations LT ExprOperations					{$$ = cria_node(node_operators, "", "Lt");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	ExprOperations NE ExprOperations					{$$ = cria_node(node_operators, "", "Ne");
																	adicionar_node($$, $1);
																	adicionar_irmao($1, $3);}
			|	PLUS ExprOperations %prec NOT						{$$ = cria_node(node_operators, "", "Plus");
																	adicionar_node($$, $2);}
			|	MINUS ExprOperations %prec NOT						{$$ = cria_node(node_operators, "", "Minus");
																	adicionar_node($$, $2);}
			|	NOT ExprOperations									{$$ = cria_node(node_operators, "", "Not");
																	adicionar_node($$, $2);}
			|	LPAR Expr RPAR										{$$ = $2;}
			|	LPAR error RPAR										{$$ = NULL;
																	flag_erro = 1;}
			|	Expr2												{$$ = $1;}
			|	ID													{$$ = cria_node(node_id, $1, "Id");}
			|	ID DOTLENGTH										{$$ = cria_node(node_operators, "", "Length");
																	adicionar_node($$, cria_node(node_id, $1, "Id"));}
			|	ExprLit												{$$ = $1;}
	;

Expr2:	MethodInvocation											{$$ = $1;}
	|	ParseArgs													{$$ = $1;}
	;

ExprLit:	INTLIT													{$$ = cria_node(node_terminais, $1, "DecLit");}
		|	REALLIT													{$$ = cria_node(node_terminais, $1, "RealLit");}
		|	BOOLLIT													{$$ = cria_node(node_terminais, $1, "BoolLit");}
		;

%%
