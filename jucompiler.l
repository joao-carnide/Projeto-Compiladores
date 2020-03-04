%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	int linha = 1;
	int coluna = 1;
	int auxlinha = 1;
	int auxcoluna = 1;
	int flag = 0;
	int erro = 0;
	char guarda[256];
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


{intlit}								{if(flag == 1)printf("INTLIT(%s)\n",yytext);coluna+=yyleng;}

{real}|{expint}|{expreal}				{if(flag == 1)printf("REALLIT(%s)\n",yytext);coluna+=yyleng;}

{bools}									{if(flag == 1)printf("BOOLLIT(%s)\n",yytext);coluna+=yyleng;}
{and}									{if(flag == 1)printf("AND\n");coluna+=yyleng;}
{assign}								{if(flag == 1)printf("ASSIGN\n");coluna+=yyleng;}
{star}									{if(flag == 1)printf("STAR\n");coluna+=yyleng;}
{comma}									{if(flag == 1)printf("COMMA\n");coluna+=yyleng;}
{div}									{if(flag == 1)printf("DIV\n");coluna+=yyleng;}
{equals}								{if(flag == 1)printf("EQ\n");coluna+=yyleng;}
{greatereq}								{if(flag == 1)printf("GE\n");coluna+=yyleng;}
{greater}								{if(flag == 1)printf("GT\n");coluna+=yyleng;}
{leftbrace}								{if(flag == 1)printf("LBRACE\n");coluna+=yyleng;}
{lesseq}								{if(flag == 1)printf("LE\n");coluna+=yyleng;}
{leftpar}								{if(flag == 1)printf("LPAR\n");coluna+=yyleng;}
{leftsqpar}								{if(flag == 1)printf("LSQ\n");coluna+=yyleng;}
{less}									{if(flag == 1)printf("LT\n");coluna+=yyleng;}
{minus}									{if(flag == 1)printf("MINUS\n");coluna+=yyleng;}
{mod}									{if(flag == 1)printf("MOD\n");coluna+=yyleng;}
{notequal}								{if(flag == 1)printf("NE\n");coluna+=yyleng;}
{not}									{if(flag == 1)printf("NOT\n");coluna+=yyleng;}
{or}									{if(flag == 1)printf("OR\n");coluna+=yyleng;}
{plus}									{if(flag == 1)printf("PLUS\n");coluna+=yyleng;}
{rightbrace}							{if(flag == 1)printf("RBRACE\n");coluna+=yyleng;}
{rightpar}								{if(flag == 1)printf("RPAR\n");coluna+=yyleng;}
{rightsqpar}							{if(flag == 1)printf("RSQ\n");coluna+=yyleng;}
{semicolon}								{if(flag == 1)printf("SEMICOLON\n");coluna+=yyleng;}
{arrow}									{if(flag == 1)printf("ARROW\n");coluna+=yyleng;}
{leftshift}								{if(flag == 1)printf("LSHIFT\n");coluna+=yyleng;}
{rightshift}							{if(flag == 1)printf("RSHIFT\n");coluna+=yyleng;}
{xor}									{if(flag == 1)printf("XOR\n");coluna+=yyleng;}
{bool}									{if(flag == 1)printf("BOOL\n");coluna+=yyleng;}
{class}									{if(flag == 1)printf("CLASS\n");coluna+=yyleng;}
{dotlength}								{if(flag == 1)printf("DOTLENGTH\n");coluna+=yyleng;}
{double}								{if(flag == 1)printf("DOUBLE\n");coluna+=yyleng;}
{else}									{if(flag == 1)printf("ELSE\n");coluna+=yyleng;}
{if}									{if(flag == 1)printf("IF\n");coluna+=yyleng;}
{int}									{if(flag == 1)printf("INT\n");coluna+=yyleng;}
{print}									{if(flag == 1)printf("PRINT\n");coluna+=yyleng;}
{parseint}								{if(flag == 1)printf("PARSEINT\n");coluna+=yyleng;}
{public}								{if(flag == 1)printf("PUBLIC\n");coluna+=yyleng;}
{return}								{if(flag == 1)printf("RETURN\n");coluna+=yyleng;}
{static}								{if(flag == 1)printf("STATIC\n");coluna+=yyleng;}
{string}								{if(flag == 1)printf("STRING\n");coluna+=yyleng;}
{void}									{if(flag == 1)printf("VOID\n");coluna+=yyleng;}
{while}									{if(flag == 1)printf("WHILE\n");coluna+=yyleng;}

{reserved}								{if(flag == 1)printf("RESERVED(%s)\n",yytext);coluna+=yyleng;}

{id}									{if(flag == 1)printf("ID(%s)\n",yytext);coluna+=yyleng;}

"\f"									{coluna+=yyleng;}
\n|\r|(\r\n)							{linha++; coluna = 1;}
"\t"									{coluna+=yyleng;}
" "										{coluna+=yyleng;}

\"										{BEGIN STRLIT; strcat(guarda,yytext); auxlinha = linha; auxcoluna = coluna; coluna += yyleng; erro = 0;}
<STRLIT>{strlit}						{coluna+=yyleng; strcat(guarda,yytext);}
<STRLIT>\\(.?)							{printf("Line %d, col %d: invalid escape sequence (%s)\n",linha,coluna,yytext); coluna += yyleng;erro = 1;}
<STRLIT>\n|\r|(\r\n)					{BEGIN 0; guarda[0] = 0; printf("Line %d, col %d: unterminated string literal\n",auxlinha,auxcoluna); linha++; coluna = 1;}
<STRLIT>\"								{BEGIN 0; strcat(guarda, yytext); if(erro == 0)printf("STRLIT(%s)\n",guarda);coluna+=yyleng; guarda[0]=0;}
<STRLIT><<EOF>>							{BEGIN 0; guarda[0] = 0; printf("Line %d, col %d: unterminated string literal\n",auxlinha,auxcoluna); linha++;coluna = 1;}

"//"									{BEGIN COMMENT; coluna+=yyleng;}
<COMMENT>\n|\r|(\r\n)					{BEGIN 0; linha++; coluna=1;}
<COMMENT>.								{coluna+=yyleng;}

"/*"									{BEGIN MLCOMMENT; auxlinha=linha;auxcoluna=coluna;coluna+=yyleng;}
<MLCOMMENT>"*/"							{BEGIN 0;coluna+=yyleng;}
<MLCOMMENT>\n|\r|(\r\n)					{linha++;coluna=1;}
<MLCOMMENT>.							{coluna+=yyleng;}
<MLCOMMENT><<EOF>>						{BEGIN 0;printf("Line %d, col %d: unterminated comment\n",auxlinha,auxcoluna);}

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