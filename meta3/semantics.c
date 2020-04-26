#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "symbol_table.h"
#include "semantics.h"

void check_program(no raiz) {
    if (raiz == NULL) {
        return;
    }
    else if (strcmp(raiz->s_type, "Program") == 0) {
        char * nome = (char*)strdup(raiz->filho->valor);
        init_class(nome);
    }
    else if (strcmp(raiz->s_type, "FieldDecl") == 0) {
        check_field_decl(raiz);
    }
    /*else if (strcmp(raiz->s_type, "MethodDecl") == 0) {
        check_method_decl(raiz->filho);
    }*/
    no aux_filho = raiz->filho;
    while (aux_filho != NULL) {
        check_program(aux_filho);
        aux_filho = aux_filho->irmao;
    }
    
}

void check_field_decl(no raiz) {
    char * s_type = check_s_type(raiz->filho->s_type);
    char * valor = (char*)strdup(raiz->filho->irmao->valor);
    insere_elem(valor, s_type, NULL, NULL, "Class");
}

char * check_s_type(char * raiz) {
    char * s_type = NULL;
    if (strcmp(raiz, "StringArray") == 0) {
        s_type = (char*)calloc((strlen("String[]")+1), sizeof(char));
        strcpy(s_type, "String[]");
    }
    else if (strcmp(raiz, "Int") == 0) {
        s_type = (char*)calloc((strlen("int")+1), sizeof(char));
        strcpy(s_type, "int");
    }
    else if (strcmp(raiz, "Double") == 0) {
        s_type = (char*)calloc((strlen("double")+1), sizeof(char));
        strcpy(s_type, "double");
    }
    else if (strcmp(raiz, "Bool") == 0) {
        s_type = (char*)calloc((strlen("boolean")+1), sizeof(char));
        strcpy(s_type, "boolean");
    }
    else if (strcmp(raiz, "Void") == 0) {
        s_type = (char*)calloc((strlen("void")+1), sizeof(char));
        strcpy(s_type, "void");
    }
    else if (strcmp(raiz, "ParseArgs") == 0) {
        s_type = (char*)calloc((strlen("int")+1), sizeof(char));
        strcpy(s_type, "int");
    }
    return s_type;
}
/*
void check_ast(no raiz) {

}

char * check_method_decl(no raiz) {

}

void check_method_body(no raiz, char * tabela) {

}

char * check_method_params(no raiz) {

}

char ** check_array_method_params(no raiz) {

}

char ** check_calls_method_params(no raiz) {

}

void adiciona_method_params(no raiz, char * tabela) {
    
}
*/