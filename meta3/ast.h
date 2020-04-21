#include <stdlib.h>
#include <stdio.h>
#include <string.h>

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

int yylex(void);
void yyerror(const char *s);

no cria_node(node_type type, char * valor, char * s_type);
void adicionar_node(no pai, no novo);
void adicionar_irmao(no node_a, no node_b);
int conta_irmaos(no raiz);
void arvore(no raiz, int pontos);