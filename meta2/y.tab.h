/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ID = 258,
    INTLIT = 259,
    REALLIT = 260,
    BOOLLIT = 261,
    STRLIT = 262,
    AND = 263,
    ASSIGN = 264,
    STAR = 265,
    COMMA = 266,
    DIV = 267,
    EQ = 268,
    GE = 269,
    GT = 270,
    LBRACE = 271,
    LE = 272,
    LPAR = 273,
    LSQ = 274,
    LT = 275,
    MINUS = 276,
    MOD = 277,
    NE = 278,
    NOT = 279,
    OR = 280,
    PLUS = 281,
    RBRACE = 282,
    RPAR = 283,
    RSQ = 284,
    SEMICOLON = 285,
    ARROW = 286,
    LSHIFT = 287,
    RSHIFT = 288,
    XOR = 289,
    BOOL = 290,
    CLASS = 291,
    DOTLENGTH = 292,
    DOUBLE = 293,
    ELSE = 294,
    IF = 295,
    INT = 296,
    PRINT = 297,
    PARSEINT = 298,
    PUBLIC = 299,
    RETURN = 300,
    STATIC = 301,
    STRING = 302,
    VOID = 303,
    WHILE = 304,
    RESERVED = 305
  };
#endif
/* Tokens.  */
#define ID 258
#define INTLIT 259
#define REALLIT 260
#define BOOLLIT 261
#define STRLIT 262
#define AND 263
#define ASSIGN 264
#define STAR 265
#define COMMA 266
#define DIV 267
#define EQ 268
#define GE 269
#define GT 270
#define LBRACE 271
#define LE 272
#define LPAR 273
#define LSQ 274
#define LT 275
#define MINUS 276
#define MOD 277
#define NE 278
#define NOT 279
#define OR 280
#define PLUS 281
#define RBRACE 282
#define RPAR 283
#define RSQ 284
#define SEMICOLON 285
#define ARROW 286
#define LSHIFT 287
#define RSHIFT 288
#define XOR 289
#define BOOL 290
#define CLASS 291
#define DOTLENGTH 292
#define DOUBLE 293
#define ELSE 294
#define IF 295
#define INT 296
#define PRINT 297
#define PARSEINT 298
#define PUBLIC 299
#define RETURN 300
#define STATIC 301
#define STRING 302
#define VOID 303
#define WHILE 304
#define RESERVED 305

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 16 "jucompiler.y" /* yacc.c:1909  */

	char * id;
	struct node * node;

#line 159 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
