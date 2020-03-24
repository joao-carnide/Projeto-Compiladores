%{
	/*
		Gonçalo Manuel Oliveira e Sousa			2016244072
		João Filipe Carnide de Jesus Nunes		2017247442
	*/
	
	#include "y.tab.h"
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	int linha = 1;
	int coluna = 1;
	int linha_coluna[2];  //array auxiliar para linhas e colunas
	int flag = 0; //0 - detetar erros (nada ou -e1), 1 - detetar tudo (-l)
	int string = 0;  //flag para detetar string
	char * strlit;
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

%X COMMENT MLCOMMENT STRLIT

%%

{intlit}								{if(flag == 1)printf("INTLIT(%s)\n",yytext);coluna+=yyleng;
										yylval.id = strdup(yytext);
										return INTLIT;}

{real}|{expint}|{expreal}				{if(flag == 1)printf("REALLIT(%s)\n",yytext);coluna+=yyleng;
										yylval.id = strdup(yytext);
										return REALLIT;}

{bools}									{if(flag == 1)printf("BOOLLIT(%s)\n",yytext);coluna+=yyleng;
										yylval.id = strdup(yytext);
										return BOOLLIT;}
{and}									{if(flag == 1)printf("AND\n");coluna+=yyleng;
										return AND;}
{assign}								{if(flag == 1)printf("ASSIGN\n");coluna+=yyleng;
										return ASSIGN;}
{star}									{if(flag == 1)printf("STAR\n");coluna+=yyleng;
										return STAR;}
{comma}									{if(flag == 1)printf("COMMA\n");coluna+=yyleng;
										return COMMA;}
{div}									{if(flag == 1)printf("DIV\n");coluna+=yyleng;
										return DIV;}
{equals}								{if(flag == 1)printf("EQ\n");coluna+=yyleng;
										return EQ;}
{greatereq}								{if(flag == 1)printf("GE\n");coluna+=yyleng;
										return GE;}
{greater}								{if(flag == 1)printf("GT\n");coluna+=yyleng;
										return GT;}
{leftbrace}								{if(flag == 1)printf("LBRACE\n");coluna+=yyleng;
										return LBRACE;}
{lesseq}								{if(flag == 1)printf("LE\n");coluna+=yyleng;
										return LE;}
{leftpar}								{if(flag == 1)printf("LPAR\n");coluna+=yyleng;
										return LPAR;}
{leftsqpar}								{if(flag == 1)printf("LSQ\n");coluna+=yyleng;
										return LSQ;}
{less}									{if(flag == 1)printf("LT\n");coluna+=yyleng;
										return LT;}
{minus}									{if(flag == 1)printf("MINUS\n");coluna+=yyleng;
										return MINUS;}
{mod}									{if(flag == 1)printf("MOD\n");coluna+=yyleng;
										return MOD;}
{notequal}								{if(flag == 1)printf("NE\n");coluna+=yyleng;
										return NE;}
{not}									{if(flag == 1)printf("NOT\n");coluna+=yyleng;
										return NOT;}
{or}									{if(flag == 1)printf("OR\n");coluna+=yyleng;
										return OR;}
{plus}									{if(flag == 1)printf("PLUS\n");coluna+=yyleng;
										return PLUS;}
{rightbrace}							{if(flag == 1)printf("RBRACE\n");coluna+=yyleng;
										return RBRACE;}
{rightpar}								{if(flag == 1)printf("RPAR\n");coluna+=yyleng;
										return RPAR;}
{rightsqpar}							{if(flag == 1)printf("RSQ\n");coluna+=yyleng;
										return RSQ;}
{semicolon}								{if(flag == 1)printf("SEMICOLON\n");coluna+=yyleng;
										return SEMICOLON;}
{arrow}									{if(flag == 1)printf("ARROW\n");coluna+=yyleng;
										return ARROW;}
{leftshift}								{if(flag == 1)printf("LSHIFT\n");coluna+=yyleng;
										return LSHIFT;}
{rightshift}							{if(flag == 1)printf("RSHIFT\n");coluna+=yyleng;
										return RSHIFT;}
{xor}									{if(flag == 1)printf("XOR\n");coluna+=yyleng;
										return XOR;}
{bool}									{if(flag == 1)printf("BOOL\n");coluna+=yyleng;
										return BOOL;}
{class}									{if(flag == 1)printf("CLASS\n");coluna+=yyleng;
										return CLASS;}
{dotlength}								{if(flag == 1)printf("DOTLENGTH\n");coluna+=yyleng;
										return DOTLENGTH;}
{double}								{if(flag == 1)printf("DOUBLE\n");coluna+=yyleng;
										return DOUBLE;}
{else}									{if(flag == 1)printf("ELSE\n");coluna+=yyleng;
										return ELSE;}
{if}									{if(flag == 1)printf("IF\n");coluna+=yyleng;
										return IF;}
{int}									{if(flag == 1)printf("INT\n");coluna+=yyleng;
										return INT;}
{print}									{if(flag == 1)printf("PRINT\n");coluna+=yyleng;
										return PRINT;}
{parseint}								{if(flag == 1)printf("PARSEINT\n");coluna+=yyleng;
										return PARSEINT;}
{public}								{if(flag == 1)printf("PUBLIC\n");coluna+=yyleng;
										return PUBLIC;}
{return}								{if(flag == 1)printf("RETURN\n");coluna+=yyleng;
										return RETURN;}
{static}								{if(flag == 1)printf("STATIC\n");coluna+=yyleng;
										return STATIC;}
{string}								{if(flag == 1)printf("STRING\n");coluna+=yyleng;
										return STRING;}
{void}									{if(flag == 1)printf("VOID\n");coluna+=yyleng;
										return VOID;}
{while}									{if(flag == 1)printf("WHILE\n");coluna+=yyleng;
										return WHILE;}

{reserved}								{if(flag == 1)printf("RESERVED(%s)\n",yytext);coluna+=yyleng;
										return RESERVED;}

{id}									{if(flag == 1)printf("ID(%s)\n",yytext);coluna+=yyleng;
										yylval.id = strdup(yytext);
										return ID;}

"\f"									{coluna+=yyleng;}
\n|\r|(\r\n)							{linha++; coluna = 1;}
"\t"									{coluna+=yyleng;}
" "										{coluna+=yyleng;}

\"										{BEGIN STRLIT; string = 1; strlit = yytext; coluna+=yyleng; linha_coluna[0]=linha; linha_coluna[1]=coluna-1;}
<STRLIT>{strlit}						{coluna+=yyleng;}
<STRLIT>\\(.?)							{printf("Line %d, col %d: invalid escape sequence (%s)\n",linha,coluna,yytext); coluna += yyleng;string = 0;}
<STRLIT>\n|\r|(\r\n)					{linha++; coluna= 1; printf("Line %d, col %d: unterminated string literal\n",linha_coluna[0],linha_coluna[1]);BEGIN 0;}
<STRLIT>\"								{if(flag==1&&string==1)printf("STRLIT(%s)\n",strlit);coluna+=yyleng; BEGIN 0;
										yylval.id = strdup(yytext);
										return STRLIT;}
<STRLIT><<EOF>>							{printf("Line %d, col %d: unterminated string literal\n",linha_coluna[0],linha_coluna[1]); coluna+=yyleng; BEGIN 0;}

"//"									{BEGIN COMMENT; coluna+=yyleng;}
<COMMENT>\n|\r|(\r\n)					{BEGIN 0; linha++; coluna=1;}
<COMMENT>.								{coluna+=yyleng;}

"/*"									{BEGIN MLCOMMENT; linha_coluna[0]=linha;linha_coluna[1]=coluna;coluna+=yyleng;}
<MLCOMMENT>"*/"							{BEGIN 0;coluna+=yyleng;}
<MLCOMMENT>\n|\r|(\r\n)					{linha++;coluna=1;}
<MLCOMMENT>.							{coluna+=yyleng;}
<MLCOMMENT><<EOF>>						{printf("Line %d, col %d: unterminated comment\n",linha_coluna[0],linha_coluna[1]); coluna+=yyleng; BEGIN 0;}

.										{printf("Line %d, col %d: illegal character (%s)\n", linha, coluna, yytext); coluna+=yyleng;}

%%

int main(int argc, char *argv[])
{
	if (argc > 1) {
		if (strcmp(argv[1],"-l") == 0) {
			flag = 1;
		}
		else if(strcmp(argv[1],"-e1") == 0) {
			flag = 0;
		}
	}
	else if (argc == 1){
		flag = 0;
	}
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}