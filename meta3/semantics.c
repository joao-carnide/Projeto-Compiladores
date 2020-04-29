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
    else if (strcmp(raiz->s_type, "MethodDecl") == 0) {
        check_method_decl(raiz->filho);
    }
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

char * check_method_decl(no raiz) {
    char * s_type = check_s_type(raiz->filho->s_type);
    char * valor = (char*)strdup(raiz->filho->irmao->valor);
    char * params = check_method_params(raiz->filho->irmao->irmao);
    char ** array_params = check_array_method_params(raiz->filho->irmao->irmao);
    char * n_string;

    if ((n_string = malloc(strlen(valor)+strlen(params)+1)) != NULL) {
        n_string[0] = '\0';
        strcat(n_string, valor);
        strcat(n_string, params);
    }
    insere_elem(valor, s_type, params, NULL, "Class");
    init_method(n_string, valor, array_params, s_type);
    adiciona_method_params(raiz->filho->irmao->irmao, n_string);
    return n_string;
}

char * check_method_params(no raiz) {
    char params[500] = "(";
    no aux = NULL;
    if (raiz->filho) {
        aux = raiz->filho;
    }
    while (aux) {
        if (strcmp(aux->filho->s_type, "StringArray") == 0) {
            strcat(params, "String[]");
        }
        else if (strcmp(aux->filho->s_type, "Int") == 0) {
            strcat(params, "int");
        }
        else if (strcmp(aux->filho->s_type, "Double") == 0) {
            strcat(params, "double");
        }
        else if (strcmp(aux->filho->s_type, "Bool") == 0) {
            strcat(params, "boolean");
        }
        if (aux->irmao) {
            strcat(params, ",");    // adicionar , caso mais que um parametro
        }
        aux = aux->irmao;
    }
    strcat(params, ")");
    return strdup(params);
}

char ** check_array_method_params(no raiz) {
    char ** params = (char**)malloc(50 * sizeof(char*));
    no aux = NULL;
    int i = 1;
    if (raiz->filho) {
        aux = raiz->filho;
    }
    while (aux) {
        if (strcmp(aux->filho->s_type, "StringArray") == 0) {
            params[i] = strdup("String[]");
        }
        else if (strcmp(aux->filho->s_type, "Int") == 0) {
            params[i] = strdup("int");
        }
        else if (strcmp(aux->filho->s_type, "Double") == 0) {
            params[i] = strdup("double");
        }
        else if (strcmp(aux->filho->s_type, "Bool") == 0) {
            params[i] = strdup("boolean");
        }
        i++;
        aux = aux->irmao;
    }
    char string[10];
    sprintf(string, "%d", i-1);
    params[0] = strdup(string);
    return params;
}

void adiciona_method_params(no raiz, char * tabela) {
    no head = NULL;
    if (raiz->filho) {
        head = raiz->filho;
    }
    while (head) {
        char * s_type = check_s_type(head->filho->s_type);
        insere_elem(head->filho->irmao->valor, s_type, NULL, "param", tabela);
        head = head->irmao;
    }
}

void check_method_body(no raiz, char * tabela_t) {
    if (raiz == NULL) {
        return ;
    }
    if (strcmp(raiz->s_type, "VarDecl") == 0) {
        char * s_type = check_s_type(raiz->filho->s_type);
        insere_elem(raiz->filho->irmao->valor, s_type, NULL, NULL, tabela_t);
    }
    if (strcmp(raiz->s_type, "Id") == 0) {
        if (raiz->pai != NULL) {
            if (strcmp(raiz->pai->s_type, "VarDecl") != 0) {
                char * type_simbolo = procura_tabela_char(raiz->valor, tabela_t);
                raiz->type_tab = type_simbolo;
            }
        }
        else {
            char * type_simbolo = procura_tabela_char(raiz->valor, tabela_t);
            raiz->type_tab = type_simbolo;
        }
    }
    if (strcmp(raiz->s_type, "DecLit") == 0 || strcmp(raiz->s_type, "ParseArgs") == 0 || strcmp(raiz->s_type, "Length") == 0) {
        char * anota = (char*)strdup(" - int");
        raiz->type_tab = anota;
    }
    if (strcmp(raiz->s_type, "RealLit") == 0) {
        char * anota = (char*)strdup(" - double");
        raiz->type_tab = anota;
    }
    if (strcmp(raiz->s_type, "StrLit") == 0) {
        char * anota = (char*)strdup(" - String");
        raiz->type_tab = anota;
    }
    if (strcmp(raiz->s_type, "Eq") == 0 || strcmp(raiz->s_type, "Ne") == 0 || strcmp(raiz->s_type, "Gt") == 0 || strcmp(raiz->s_type, "Ge") == 0 || strcmp(raiz->s_type, "Lt") == 0 || strcmp(raiz->s_type, "Le") == 0 || strcmp(raiz->s_type, "And") == 0 || strcmp(raiz->s_type, "Or") == 0 || strcmp(raiz->s_type, "Xor") == 0 || strcmp(raiz->s_type, "Not") == 0 || strcmp(raiz->s_type, "BoolLit") == 0) {
        char * anota = (char*)strdup(" - boolean");
        raiz->type_tab = anota;
    }
    no aux = raiz->filho;
    while (aux != NULL) {
        check_method_body(aux, tabela_t);
        aux = aux->irmao;
    }
    if (strcmp(raiz->s_type, "Assign") == 0 || strcmp(raiz->s_type, "Plus") == 0 || strcmp(raiz->s_type, "Minus") == 0) {
        char * anota = (char*)strdup(raiz->filho->type_tab);
        raiz->type_tab = anota;
    }
    if (strcmp(raiz->s_type, "Add") == 0 || strcmp(raiz->s_type, "Sub") == 0 || strcmp(raiz->s_type, "Mul") == 0 || strcmp(raiz->s_type, "Div") == 0 || strcmp(raiz->s_type, "Mod") == 0 || strcmp(raiz->s_type, "Lshift") == 0 || strcmp(raiz->s_type, "Rshift") == 0) {
        char * anota;
        if (strcmp(raiz->filho->type_tab, raiz->filho->irmao->type_tab) == 0) {
            anota = (char*)strdup(raiz->filho->type_tab);
        }
        else {
            anota = (char*)strdup(" - double");
        }
        raiz->type_tab = anota;
    }
    if (strcmp(raiz->s_type, "Call") == 0) {
        char ** params = check_calls_method_params(raiz);
        table anota = check_call(raiz->filho->valor, params, 0);
        if (anota != NULL) {
            char * n_string;
            if ((n_string = malloc(strlen(" - ")+strlen(anota->tabela->s_type)+1)) != NULL) {
                n_string[0] = '\0';
                strcat(n_string, " - ");
                strcat(n_string, anota->tabela->s_type);
            }
            raiz->type_tab = n_string;
            int i = strlen(anota->c_nome);
            char * n_string2;
            if ((n_string2 = malloc(strlen(" - ")+strlen(&anota->nome[i])+1)) != NULL) {
                n_string2[0] = '\0';
                strcat(n_string2, " - ");
                strcat(n_string2, &anota->nome[i]);
            }
            raiz->filho->type_tab = n_string2;
        }
        else {
            char * n_string;
            if ((n_string = malloc(strlen(" - undef")+1)) != NULL) {
                n_string[0] = '\0';
                strcat(n_string, " - undef");
            }
            raiz->type_tab = n_string;
            raiz->filho->type_tab = n_string;
        }
    }
}

char ** check_calls_method_params(no raiz) {
    char ** params = (char**)malloc(50*sizeof(char*));
    no aux = NULL;
    int i = 1;
    if (raiz->filho->irmao) {
        aux = raiz->filho->irmao;
    }
    while (aux != NULL) {
        if (aux->type_tab != NULL) {
            params[i] = strdup(&aux->type_tab[3]);
            i++;
        }
        aux = aux->irmao;
    }
    char string[10];
    sprintf(string, "%d", i-1);
    params[0] = strdup(string);
    return params;
}

void check_ast(no raiz) {
    if (raiz == NULL) {
        return ;
    }
    if (strcmp(raiz->s_type, "MethodDecl") == 0) {
        char * params = check_method_params(raiz->filho->filho->irmao->irmao);
        char * valor = (char*)strdup(raiz->filho->filho->irmao->valor);
        char * n_string;
        if ((n_string = malloc(strlen(valor)+strlen(params)+1)) != NULL) {
            n_string[0] = '\0';
            strcat(n_string, valor);
            strcat(n_string, params);
        }
        check_method_body(raiz->filho->irmao, n_string);
    }
    no aux = raiz->filho;
    while (aux != NULL) {
        check_ast(aux);
        aux = aux->irmao;
    }
}
