id					"_"|"$"|("_"|"$"|[a-z]|[A-Z])([a-z]|[A-Z]|[0-9]|"$"|"_")*

intlit				[0-9]+("_"*[0-9]|[0-9])*
real				([0-9]+"."[0-9]*)|([0-9]*"."[0-9]+)
expint				[0-9]+[eE][+-][1-9]+
expreal				([0-9]+"."[0-9]*)|([0-9]*"."[0-9]+)[eE][+-][1-9]+
strlit				\"[^(\"\n)]*\"

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
reserved			"++"|"--"|"null"|"Integer"|"System"|"abstract"|"continue"|"new"|"switch"|"assert"|"default"|"package"|"synchronized"|"do"|"goto"|"private"|"this"|"break"|"implements"|"protected"|"throw"|"byte"|"import"|"throws"|"case"|"enum"|"instanceof"|"transient"|"catch"|"extends"|"short"|"try"|"char"|"final"|"interface"|"finally"|"long"|"strictfp"|"volatile"|"const"|"float"|"native"|"super"

%%

{intlit}								{printf("INTLIT(%s)\n",yytext);}

{real}|{expint}|{expreal}				{printf("REALLIT(%s)\n",yytext);}

{strlit}								{printf("STRLIT(%s)\n",yytext);}

{bools}									{printf("BOOLLIT(%s)\n",yytext);}
{and}									{printf("AND\n");}
{assign}								{printf("ASSIGN\n");}
{star}									{printf("STAR\n");}
{comma}									{printf("COMMA\n");}
{div}									{printf("DIV\n");}
{equals}								{printf("EQ\n");}
{greatereq}								{printf("GE\n");}
{greater}								{printf("GT\n");}
{leftbrace}								{printf("LBRACE\n");}
{lesseq}								{printf("LE\n");}
{leftpar}								{printf("LPAR\n");}
{leftsqpar}								{printf("LSQ\n");}
{less}									{printf("LT\n");}
{minus}									{printf("MINUS\n");}
{mod}									{printf("MOD\n");}
{notequal}								{printf("NE\n");}
{not}									{printf("NOT\n");}
{or}									{printf("OR\n");}
{plus}									{printf("PLUS\n");}
{rightbrace}							{printf("RBRACE\n");}
{rightpar}								{printf("RPAR\n");}
{rightsqpar}							{printf("RSQ\n");}
{semicolon}								{printf("SEMICOLON\n");}
{arrow}									{printf("ARROW\n");}
{leftshift}								{printf("LSHIFT\n");}
{rightshift}							{printf("RSHIFT\n");}
{xor}									{printf("XOR\n");}
{bool}									{printf("BOOL\n");}
{class}									{printf("CLASS\n");}
{dotlength}								{printf("DOTLENGTH\n");}
{double}								{printf("DOUBLE\n");}
{else}									{printf("ELSE\n");}
{if}									{printf("IF\n");}
{int}									{printf("INT\n");}
{print}									{printf("PRINT\n");}
{parseint}								{printf("PARSEINT\n");}
{public}								{printf("PUBLIC\n");}
{return}								{printf("RETURN\n");}
{static}								{printf("STATIC\n");}
{string}								{printf("STRING\n");}
{void}									{printf("VOID\n");}
{while}									{printf("WHILE\n");}

{reserved}								{printf("RESERVED(%s)\n",yytext);}

{id}									{printf("ID(%s)\n",yytext);}

.|"\n"									{printf("");}

%%

int main()
{
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}