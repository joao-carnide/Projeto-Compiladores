%{
	/*
		João Filipe Carnide de Jesus Nunes		2017247442
	*/
	
	#include "y.tab.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <stdarg.h>

	int linha = 1;
	int coluna = 1;
	int flag = 0;
	int erro = 0;
	extern int flag_erro;
	char guarda[256];
	int linha_atual = 1;
	int coluna_atual = 1;
%}

id					"_"|"$"|("_"|"$"|[a-z]|[A-Z])([a-z]|[A-Z]|[0-9]|"$"|"_")*

intlit				0|([1-9]+("_"*[0-9]|[0-9])*)
real				([0-9]+("_"*[0-9]|[0-9])*"."[0-9]*("_"*[0-9]|[0-9])*)|([0-9]*("_"*[0-9]|[0-9])*"."[0-9]+("_"*[0-9]|[0-9])*)
expint				[0-9]+("_"*[0-9]|[0-9])*[eE][+-]*[0-9]+("_"*[0-9]|[0-9])*
expreal				([0-9]+("_"*[0-9]|[0-9])*"."([0-9]*("_"*[0-9]|[0-9])*)*)|([0-9]*("_"*[0-9]|[0-9])*"."([0-9]+("_"*[0-9]|[0-9])*)*)[eE][+-]*[0-9]+("_"*[0-9]|[0-9])*
strlit				([^\n\r\\"]|\\n|\\f|\\r|\\\\|\\\"|\\t)*

bools				"true"|"false"
and					"&&"
assign				"="
star				"*"
comma				","
div					"/"
equals				"=="
greatereq			">="
greater				">"
leftbrace			"{"
lesseq				"<="
leftpar				"("
leftsqpar			"["
less				"<"
minus				"-"
mod					"%"
notequal			"!="
not 				"!"
or					"||"
plus				"+"
rightbrace			"}"
rightpar			")"
rightsqpar			"]"
semicolon			";"
arrow				"->"
leftshift			"<<"
rightshift			">>"
xor					"^"
bool 				"boolean"
class				"class"
dotlength			".length"
double				"double"
else				"else"
if 					"if"
int					"int"
print 				"System.out.print"
parseint			"Integer.parseInt"
public				"public"
return				"return"
static				"static"
string				"String"
void				"void"
while				"while"
reserved			"++"|"--"|"null"|"Integer"|"System"|"abstract"|"continue"|"new"|"switch"|"assert"|"default"|"package"|"synchronized"|"do"|"goto"|"private"|"this"|"break"|"implements"|"protected"|"throw"|"byte"|"import"|"throws"|"case"|"enum"|"instanceof"|"transient"|"catch"|"extends"|"short"|"try"|"char"|"final"|"interface"|"finally"|"long"|"strictfp"|"volatile"|"const"|"float"|"native"|"super"|"for"

%X COMMENT MLCOMMENT STRINGLIT

%%

{intlit}								{if(flag == 1)printf("INTLIT(%s)\n",yytext);coluna+=yyleng;
										if(flag != 1) {
											yylval.id = strdup(yytext);
											return INTLIT;
										}}

{real}|{expint}|{expreal}				{if(flag == 1)printf("REALLIT(%s)\n",yytext);coluna+=yyleng;
										if(flag != 1) {
											yylval.id = strdup(yytext);
											return REALLIT;
										}}

{bools}									{if(flag == 1)printf("BOOLLIT(%s)\n",yytext);coluna+=yyleng;
										if(flag != 1) {
											yylval.id = strdup(yytext);
											return BOOLLIT;
										}}
{and}									{if(flag == 1)printf("AND\n");coluna+=yyleng;
										if(flag != 1)return AND;}
{assign}								{if(flag == 1)printf("ASSIGN\n");coluna+=yyleng;
										if(flag != 1)return ASSIGN;}
{star}									{if(flag == 1)printf("STAR\n");coluna+=yyleng;
										if(flag != 1)return STAR;}
{comma}									{if(flag == 1)printf("COMMA\n");coluna+=yyleng;
										if(flag != 1)return COMMA;}
{div}									{if(flag == 1)printf("DIV\n");coluna+=yyleng;
										if(flag != 1)return DIV;}
{equals}								{if(flag == 1)printf("EQ\n");coluna+=yyleng;
										if(flag != 1)return EQ;}
{greatereq}								{if(flag == 1)printf("GE\n");coluna+=yyleng;
										if(flag != 1)return GE;}
{greater}								{if(flag == 1)printf("GT\n");coluna+=yyleng;
										if(flag != 1)return GT;}
{leftbrace}								{if(flag == 1)printf("LBRACE\n");coluna+=yyleng;
										if(flag != 1)return LBRACE;}
{lesseq}								{if(flag == 1)printf("LE\n");coluna+=yyleng;
										if(flag != 1)return LE;}
{leftpar}								{if(flag == 1)printf("LPAR\n");coluna+=yyleng;
										if(flag != 1)return LPAR;}
{leftsqpar}								{if(flag == 1)printf("LSQ\n");coluna+=yyleng;
										if(flag != 1)return LSQ;}
{less}									{if(flag == 1)printf("LT\n");coluna+=yyleng;
										if(flag != 1)return LT;}
{minus}									{if(flag == 1)printf("MINUS\n");coluna+=yyleng;
										if(flag != 1)return MINUS;}
{mod}									{if(flag == 1)printf("MOD\n");coluna+=yyleng;
										if(flag != 1)return MOD;}
{notequal}								{if(flag == 1)printf("NE\n");coluna+=yyleng;
										if(flag != 1)return NE;}
{not}									{if(flag == 1)printf("NOT\n");coluna+=yyleng;
										if(flag != 1)return NOT;}
{or}									{if(flag == 1)printf("OR\n");coluna+=yyleng;
										if(flag != 1)return OR;}
{plus}									{if(flag == 1)printf("PLUS\n");coluna+=yyleng;
										if(flag != 1)return PLUS;}
{rightbrace}							{if(flag == 1)printf("RBRACE\n");coluna+=yyleng;
										if(flag != 1)return RBRACE;}
{rightpar}								{if(flag == 1)printf("RPAR\n");coluna+=yyleng;
										if(flag != 1)return RPAR;}
{rightsqpar}							{if(flag == 1)printf("RSQ\n");coluna+=yyleng;
										if(flag != 1)return RSQ;}
{semicolon}								{if(flag == 1)printf("SEMICOLON\n");coluna+=yyleng;
										if(flag != 1)return SEMICOLON;}
{arrow}									{if(flag == 1)printf("ARROW\n");coluna+=yyleng;
										if(flag != 1)return ARROW;}
{leftshift}								{if(flag == 1)printf("LSHIFT\n");coluna+=yyleng;
										if(flag != 1)return LSHIFT;}
{rightshift}							{if(flag == 1)printf("RSHIFT\n");coluna+=yyleng;
										if(flag != 1)return RSHIFT;}
{xor}									{if(flag == 1)printf("XOR\n");coluna+=yyleng;
										if(flag != 1)return XOR;}
{bool}									{if(flag == 1)printf("BOOL\n");coluna+=yyleng;
										if(flag != 1)return BOOL;}
{class}									{if(flag == 1)printf("CLASS\n");coluna+=yyleng;
										if(flag != 1)return CLASS;}
{dotlength}								{if(flag == 1)printf("DOTLENGTH\n");coluna+=yyleng;
										if(flag != 1)return DOTLENGTH;}
{double}								{if(flag == 1)printf("DOUBLE\n");coluna+=yyleng;
										if(flag != 1)return DOUBLE;}
{else}									{if(flag == 1)printf("ELSE\n");coluna+=yyleng;
										if(flag != 1)return ELSE;}
{if}									{if(flag == 1)printf("IF\n");coluna+=yyleng;
										if(flag != 1)return IF;}
{int}									{if(flag == 1)printf("INT\n");coluna+=yyleng;
										if(flag != 1)return INT;}
{print}									{if(flag == 1)printf("PRINT\n");coluna+=yyleng;
										if(flag != 1)return PRINT;}
{parseint}								{if(flag == 1)printf("PARSEINT\n");coluna+=yyleng;
										if(flag != 1)return PARSEINT;}
{public}								{if(flag == 1)printf("PUBLIC\n");coluna+=yyleng;
										if(flag != 1)return PUBLIC;}
{return}								{if(flag == 1)printf("RETURN\n");coluna+=yyleng;
										if(flag != 1)return RETURN;}
{static}								{if(flag == 1)printf("STATIC\n");coluna+=yyleng;
										if(flag != 1)return STATIC;}
{string}								{if(flag == 1)printf("STRING\n");coluna+=yyleng;
										if(flag != 1)return STRING;}
{void}									{if(flag == 1)printf("VOID\n");coluna+=yyleng;
										if(flag != 1)return VOID;}
{while}									{if(flag == 1)printf("WHILE\n");coluna+=yyleng;
										if(flag != 1)return WHILE;}

{reserved}								{if(flag == 1)printf("RESERVED(%s)\n",yytext);coluna+=yyleng;
										if(flag != 1)return RESERVED;}

{id}									{if(flag == 1)printf("ID(%s)\n",yytext);coluna+=yyleng;
										if(flag != 1) {
											yylval.id = strdup(yytext);
											return ID;
										}}

"\f"									{coluna+=yyleng;}
\n|\r|(\r\n)							{linha++; coluna = 1;}
"\t"									{coluna+=yyleng;}
" "										{coluna+=yyleng;}

\"										{BEGIN STRINGLIT; guarda[0]=0; strcat(guarda, yytext); linha_atual = linha; coluna_atual = coluna; coluna+=yyleng; erro = 0;}
<STRINGLIT>{strlit}						{coluna+=yyleng; strcat(guarda, yytext);}
<STRINGLIT>\\(.?)						{strcat(guarda, yytext);printf("Line %d, col %d: invalid escape sequence (%s)\n",linha,coluna,yytext); coluna += yyleng; erro = 1;}
<STRINGLIT>\n|\r|(\r\n)					{BEGIN 0; guarda[0] = 0; printf("Line %d, col %d: unterminated string literal\n",linha_atual,coluna_atual); linha++; coluna = 1;}
<STRINGLIT>\"							{BEGIN 0; strcat(guarda, yytext); if(flag == 1 && erro==0)printf("STRLIT(%s)\n",guarda);coluna+=yyleng;
										if(flag != 1 && erro == 0) {
											yylval.id = strdup(guarda);
											yytext = guarda;
											return STRLIT;
										}}
<STRINGLIT><<EOF>>						{BEGIN 0; guarda[0] = 0; printf("Line %d, col %d: unterminated string literal\n",linha_atual,coluna_atual); linha++; coluna = 1;}

"//"									{BEGIN COMMENT; coluna+=yyleng;}
<COMMENT>\n|\r|(\r\n)					{BEGIN 0; linha++; coluna=1;}
<COMMENT>.								{coluna+=yyleng;}

"/*"									{BEGIN MLCOMMENT; linha_atual=linha;coluna_atual=coluna;coluna+=yyleng;}
<MLCOMMENT>"*/"							{BEGIN 0;coluna+=yyleng;}
<MLCOMMENT>\n|\r|(\r\n)					{linha++;coluna=1;}
<MLCOMMENT>.							{coluna+=yyleng;}
<MLCOMMENT><<EOF>>						{BEGIN 0; printf("Line %d, col %d: unterminated comment\n",linha_atual,coluna_atual);}

.										{printf("Line %d, col %d: illegal character (%s)\n", linha, coluna, yytext); coluna+=yyleng;}

%%

int yywrap() {
	return 1;
}

void yyerror(const char *s) { 
     printf ("Line %d, col %d: %s: %s\n", linha, (int)(coluna-strlen(yytext)), s, yytext);
}
