#include "symbol_table.h"
#include "ast.h"

void check_program(no raiz);
void check_field_decl(no raiz);
//void check_ast(no raiz);
char * check_method_decl(no raiz);
//void check_method_body(no raiz, char * tabela);
char * check_s_type(char * raiz);
char * check_method_params(no raiz);
char ** check_array_method_params(no raiz);
//char ** check_calls_method_params(no raiz);
void adiciona_method_params(no raiz, char * tabela);