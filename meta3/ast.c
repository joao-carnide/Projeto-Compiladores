#include <stdlib.h>
#include "ast.h"

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