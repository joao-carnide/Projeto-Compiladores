id					([a-z]|[A-Z])([a-z]|[A-Z]|[0-9]|"$"|"_")*
intlit				[0-9]+
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
reserved			"++"|"--"|"null"|"Integer"|"System"
 
%%

{bools}								{printf("BOOLLIT\n");}
{and}								{printf("AND\n");}
{assign}							{printf("ASSIGN\n");}
{star}								{printf("STAR\n");}
{comma}								{printf("COMMA\n");}
{div}								{printf("DIV\n");}
{equals}							{printf("EQ\n");}
{greatereq}							{printf("GE\n");}
{greater}							{printf("GT\n");}
{leftbrace}							{printf("LBRACE\n");}
{lesseq}							{printf("LE\n");}
{leftpar}							{printf("LPAR\n");}
{leftsqpar}							{printf("LSQ\n");}
{less}								{printf("LT\n");}
{minus}								{printf("MINUS\n");}
{mod}								{printf("MOD\n");}
{notequal}							{printf("NE\n");}
{not}								{printf("NOT\n");}
{or}								{printf("OR\n");}
{plus}								{printf("PLUS\n");}
{rightbrace}						{printf("RBRACE\n");}
{rightpar}							{printf("RPAR\n");}
{rightsqpar}						{printf("RSQ\n");}
{semicolon}							{printf("SEMICOLON\n");}
{arrow}								{printf("ARROW\n");}
{leftshift}							{printf("LSHIFT\n");}
{rightshift}						{printf("RSHIFT\n");}
{xor}								{printf("XOR\n");}
{bool}								{printf("BOOL\n");}
{class}								{printf("CLASS\n");}
{dotlength}							{printf("DOTLENGTH\n");}
{double}							{printf("DOUBLE\n");}
{else}								{printf("ELSE\n");}
{if}								{printf("IF\n");}
{int}								{printf("INT\n");}
{print}								{printf("PRINT\n");}
{parseint}							{printf("PARSEINT\n");}
{public}							{printf("PUBLIC\n");}
{return}							{printf("RETURN\n");}
{static}							{printf("STATIC\n");}
{string}							{printf("STRING\n");}
{void}								{printf("VOID\n");}
{while}								{printf("WHILE\n");}

{reserved}							{printf("RESERVED\n");}

{id}								{printf("ID(%s)\n",yytext);}
{intlit}							{printf("INTLIT\n");}

.									{printf("");}

%%

int main()
{
	yylex();
	return 0;
}

int yywrap() {
	return 1;
}