/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 1 "jucompiler.y" /* yacc.c:339  */

	/*
		Gonçalo Manuel Oliveira e Sousa			2016244072
		João Filipe Carnide de Jesus Nunes		2017247442
	*/
	
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>

	int yylex(void);
    void yyerror (const char *s);


#line 81 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
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
#line 16 "jucompiler.y" /* yacc.c:355  */

	char * id;
	struct node * node;

#line 226 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 243 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   338

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  51
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  29
/* YYNRULES -- Number of rules.  */
#define YYNRULES  83
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  165

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   305

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    73,    73,    76,    77,    78,    79,    82,    85,    88,
      89,    92,    93,    94,    97,    98,   101,   102,   105,   106,
     109,   110,   113,   116,   117,   118,   121,   124,   125,   128,
     129,   130,   131,   132,   133,   134,   137,   138,   141,   142,
     145,   146,   147,   148,   151,   152,   155,   158,   159,   162,
     163,   166,   169,   172,   173,   176,   177,   178,   179,   180,
     181,   182,   183,   184,   185,   186,   187,   188,   189,   190,
     191,   192,   193,   194,   195,   196,   197,   198,   199,   202,
     203,   206,   207,   208
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "ID", "INTLIT", "REALLIT", "BOOLLIT",
  "STRLIT", "AND", "ASSIGN", "STAR", "COMMA", "DIV", "EQ", "GE", "GT",
  "LBRACE", "LE", "LPAR", "LSQ", "LT", "MINUS", "MOD", "NE", "NOT", "OR",
  "PLUS", "RBRACE", "RPAR", "RSQ", "SEMICOLON", "ARROW", "LSHIFT",
  "RSHIFT", "XOR", "BOOL", "CLASS", "DOTLENGTH", "DOUBLE", "ELSE", "IF",
  "INT", "PRINT", "PARSEINT", "PUBLIC", "RETURN", "STATIC", "STRING",
  "VOID", "WHILE", "RESERVED", "$accept", "Program", "ProgramScript",
  "MethodDecl", "FieldDecl", "FieldDecl2", "Type", "MethodHeader",
  "MethodHeader2", "FormalParams", "FormalParams2", "MethodBody",
  "MethodBody2", "VarDecl", "VarDecl2", "Statement", "Statement2",
  "ExprReturn", "Statement3", "StatementPrint", "MethodInvocation",
  "MethodInvocation2", "MethodInvocationExpr", "Assignment", "ParseArgs",
  "Expr", "ExprOperations", "Expr2", "ExprLit", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305
};
# endif

#define YYPACT_NINF -39

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-39)))

#define YYTABLE_NINF -41

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -28,     3,    11,     6,   -39,    -1,    -1,   -12,    28,    -1,
      -1,   -39,    13,   -39,   -39,   -39,   -39,   -39,   -39,    54,
      79,    48,    69,    35,    87,   -39,    61,    86,    61,    65,
      -5,   104,    82,    83,    92,   158,    94,   116,   113,    87,
      87,    84,   -39,   -39,   -39,   123,   140,   120,   -39,   139,
     124,   -39,   158,   158,   104,   132,   158,   151,   148,    -6,
     -39,   -39,   -39,   162,   162,   162,   162,   130,   -39,   -39,
     -39,   -39,   221,   -39,   -39,   158,   159,   -39,   -39,   -39,
     -39,   142,   163,   -39,   -39,   -39,   -39,   145,   167,   -39,
     -39,   153,   -39,   157,   -39,   168,   -39,    -4,   194,   155,
     155,   155,   -39,   162,   162,   162,   162,   162,   162,   162,
     162,   162,   162,   162,   162,   162,   162,   162,   162,   164,
     187,   161,   190,   100,   -39,   -39,   158,   -39,     7,   165,
     158,   -39,   273,   155,   155,   298,   304,   304,   304,   304,
     111,   155,   298,   248,   111,    71,    71,   221,     7,   159,
     -39,   -39,   193,   167,   160,   -39,   169,   -39,   -39,   -39,
     -39,     7,   179,   -39,   -39
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     1,     3,     3,     0,     0,     3,
       3,     6,     0,     2,     4,     5,    11,    13,    12,     0,
       0,     0,     0,     9,    23,     7,    16,     0,    16,     0,
       0,    36,     0,     0,     0,    38,     0,     0,     0,    23,
      23,     0,    41,    42,    43,     0,     0,     0,    17,     9,
       0,     8,     0,    47,    36,     0,     0,     0,     0,    76,
      81,    82,    83,     0,     0,     0,     0,     0,    79,    53,
      80,    39,    54,    75,    78,     0,    27,    22,    25,    24,
      34,     0,    20,    15,    10,    14,    51,     0,    49,    37,
      29,     0,    45,     0,    44,     0,    77,    76,     0,    72,
      73,    71,    33,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    18,    46,     0,    48,    40,     0,
       0,    74,    60,    57,    58,    65,    66,    67,    68,    69,
      56,    59,    70,    61,    55,    63,    64,    62,    40,    27,
      26,    19,     0,    49,    30,    35,     0,    32,    28,    21,
      50,    40,     0,    31,    52
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -39,   -39,    53,   -39,   -39,   154,    -7,   -39,   172,   -39,
     -39,   -39,     5,   -39,    63,   -30,   156,   -39,   -39,   -39,
     -24,   -39,    60,   -15,   -22,   -17,   -38,   -39,   -39
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,     8,     9,    10,    29,    37,    21,    47,    48,
     124,    25,    38,    39,   121,    40,    55,    67,    41,    93,
      68,    87,   127,    43,    70,    71,    72,    73,    74
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      42,    54,    44,    52,    52,    20,     3,    42,     1,    44,
      30,     4,    53,    53,    53,    42,    42,    44,    44,    46,
      69,    46,     5,    31,    54,    98,    99,   100,   101,     6,
      42,    96,    44,    96,    12,    86,    88,    69,    69,    91,
      94,    69,    69,     7,    78,    79,    27,    32,    16,    33,
      34,    17,    35,    28,    18,    13,    36,    22,   119,    11,
      69,    19,    14,    15,    24,   132,   133,   134,   135,   136,
     137,   138,   139,   140,   141,   142,   143,   144,   145,   146,
     147,   104,    23,   105,   106,   107,   108,    26,   109,    49,
      30,   110,   111,   112,   113,    51,    16,   115,   154,    17,
      56,    57,    18,    31,    42,   118,    44,    30,    45,   153,
      58,    69,    75,   156,    80,    69,   152,   -40,   157,    76,
      31,   104,    16,   105,    42,    17,    44,    32,    18,    33,
      34,   163,    35,   112,   -40,    16,    36,    42,    17,    44,
      77,    18,    81,    82,    32,   118,    33,    34,    83,    35,
      27,    95,    85,    36,    59,    60,    61,    62,    92,    90,
     102,    59,    60,    61,    62,    97,    60,    61,    62,    63,
     120,   122,    64,   125,   123,    65,    63,    66,   126,    64,
      63,   128,    65,    64,    66,   129,    65,   130,    66,   118,
     149,   150,   148,   151,    34,   155,   159,   164,   162,   161,
      50,    34,   103,    84,   104,    34,   105,   106,   107,   108,
      89,   109,   158,   160,   110,   111,   112,   113,     0,   114,
     115,     0,   131,     0,     0,     0,   116,   117,   118,   103,
       0,   104,     0,   105,   106,   107,   108,     0,   109,     0,
       0,   110,   111,   112,   113,     0,   114,   115,     0,     0,
       0,     0,     0,   116,   117,   118,   103,     0,   104,     0,
     105,   106,   107,   108,     0,   109,     0,     0,   110,   111,
     112,   113,     0,     0,   115,     0,     0,     0,     0,     0,
     116,   117,   118,   104,     0,   105,   106,   107,   108,     0,
     109,     0,     0,   110,   111,   112,   113,     0,     0,   115,
       0,     0,     0,     0,     0,   116,   117,   118,   104,     0,
     105,     0,   107,   108,   104,   109,   105,     0,   110,   111,
     112,     0,     0,     0,   115,   111,   112,     0,     0,     0,
     115,     0,   118,     0,     0,     0,     0,     0,   118
};

static const yytype_int16 yycheck[] =
{
      24,    31,    24,     9,     9,    12,     3,    31,    36,    31,
       3,     0,    18,    18,    18,    39,    40,    39,    40,    26,
      35,    28,    16,    16,    54,    63,    64,    65,    66,    30,
      54,    37,    54,    37,    46,    52,    53,    52,    53,    56,
      57,    56,    57,    44,    39,    40,    11,    40,    35,    42,
      43,    38,    45,    18,    41,    27,    49,     3,    75,     6,
      75,    48,     9,    10,    16,   103,   104,   105,   106,   107,
     108,   109,   110,   111,   112,   113,   114,   115,   116,   117,
     118,    10,     3,    12,    13,    14,    15,    18,    17,     3,
       3,    20,    21,    22,    23,    30,    35,    26,   128,    38,
      18,    18,    41,    16,   128,    34,   128,     3,    47,   126,
      18,   126,    18,   130,    30,   130,   123,    30,   148,     3,
      16,    10,    35,    12,   148,    38,   148,    40,    41,    42,
      43,   161,    45,    22,    30,    35,    49,   161,    38,   161,
      27,    41,    19,     3,    40,    34,    42,    43,    28,    45,
      11,     3,    28,    49,     3,     4,     5,     6,     7,    27,
      30,     3,     4,     5,     6,     3,     4,     5,     6,    18,
      11,    29,    21,    28,    11,    24,    18,    26,    11,    21,
      18,    28,    24,    21,    26,    28,    24,    19,    26,    34,
       3,    30,    28,     3,    43,    30,     3,    18,    29,    39,
      28,    43,     8,    49,    10,    43,    12,    13,    14,    15,
      54,    17,   149,   153,    20,    21,    22,    23,    -1,    25,
      26,    -1,    28,    -1,    -1,    -1,    32,    33,    34,     8,
      -1,    10,    -1,    12,    13,    14,    15,    -1,    17,    -1,
      -1,    20,    21,    22,    23,    -1,    25,    26,    -1,    -1,
      -1,    -1,    -1,    32,    33,    34,     8,    -1,    10,    -1,
      12,    13,    14,    15,    -1,    17,    -1,    -1,    20,    21,
      22,    23,    -1,    -1,    26,    -1,    -1,    -1,    -1,    -1,
      32,    33,    34,    10,    -1,    12,    13,    14,    15,    -1,
      17,    -1,    -1,    20,    21,    22,    23,    -1,    -1,    26,
      -1,    -1,    -1,    -1,    -1,    32,    33,    34,    10,    -1,
      12,    -1,    14,    15,    10,    17,    12,    -1,    20,    21,
      22,    -1,    -1,    -1,    26,    21,    22,    -1,    -1,    -1,
      26,    -1,    34,    -1,    -1,    -1,    -1,    -1,    34
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    36,    52,     3,     0,    16,    30,    44,    53,    54,
      55,    53,    46,    27,    53,    53,    35,    38,    41,    48,
      57,    58,     3,     3,    16,    62,    18,    11,    18,    56,
       3,    16,    40,    42,    43,    45,    49,    57,    63,    64,
      66,    69,    71,    74,    75,    47,    57,    59,    60,     3,
      59,    30,     9,    18,    66,    67,    18,    18,    18,     3,
       4,     5,     6,    18,    21,    24,    26,    68,    71,    74,
      75,    76,    77,    78,    79,    18,     3,    27,    63,    63,
      30,    19,     3,    28,    56,    28,    76,    72,    76,    67,
      27,    76,     7,    70,    76,     3,    37,     3,    77,    77,
      77,    77,    30,     8,    10,    12,    13,    14,    15,    17,
      20,    21,    22,    23,    25,    26,    32,    33,    34,    76,
      11,    65,    29,    11,    61,    28,    11,    73,    28,    28,
      19,    28,    77,    77,    77,    77,    77,    77,    77,    77,
      77,    77,    77,    77,    77,    77,    77,    77,    28,     3,
      30,     3,    57,    76,    66,    30,    76,    66,    65,     3,
      73,    39,    29,    66,    18
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    51,    52,    53,    53,    53,    53,    54,    55,    56,
      56,    57,    57,    57,    58,    58,    59,    59,    60,    60,
      61,    61,    62,    63,    63,    63,    64,    65,    65,    66,
      66,    66,    66,    66,    66,    66,    67,    67,    68,    68,
      69,    69,    69,    69,    70,    70,    71,    72,    72,    73,
      73,    74,    75,    76,    76,    77,    77,    77,    77,    77,
      77,    77,    77,    77,    77,    77,    77,    77,    77,    77,
      77,    77,    77,    77,    77,    77,    77,    77,    77,    78,
      78,    79,    79,    79
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     5,     0,     2,     2,     2,     4,     6,     0,
       3,     1,     1,     1,     5,     5,     0,     1,     3,     4,
       0,     3,     3,     0,     2,     2,     4,     0,     3,     3,
       5,     7,     5,     3,     2,     5,     0,     2,     0,     1,
       0,     1,     1,     1,     1,     1,     4,     0,     2,     0,
       3,     3,     7,     1,     1,     3,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
       3,     2,     2,     2,     3,     1,     1,     2,     1,     1,
       1,     1,     1,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 73 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1471 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 76 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1477 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 77 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[-1].node);}
#line 1483 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 78 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[-1].node);}
#line 1489 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 79 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1495 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 82 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1501 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 85 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1507 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 88 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1513 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 89 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1519 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 92 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1525 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 93 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1531 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 94 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1537 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 97 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1543 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 98 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1549 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 101 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1555 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 102 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1561 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 105 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1567 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 106 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1573 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 109 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1579 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 110 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1585 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 113 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1591 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 116 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1597 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 117 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[-1].node);}
#line 1603 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 118 "jucompiler.y" /* yacc.c:1646  */
    {if ((yyvsp[-1].node) != NULL){(yyval.node) = (yyvsp[-1].node);}else{(yyval.node) = (yyvsp[0].node);};}
#line 1609 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 121 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1615 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 124 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1621 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 125 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1627 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 128 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1633 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 129 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1639 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 130 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1645 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 131 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1651 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 132 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1657 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 133 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[-1].node);}
#line 1663 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 134 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1669 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 137 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1675 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 138 "jucompiler.y" /* yacc.c:1646  */
    {if ((yyvsp[-1].node) != NULL){(yyval.node) = (yyvsp[-1].node);}else{(yyval.node) = (yyvsp[0].node);}}
#line 1681 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 141 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1687 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 142 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1693 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 145 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1699 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 146 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1705 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 147 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1711 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 148 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1717 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 151 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1723 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 152 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1729 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 155 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1735 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 158 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1741 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 159 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[-1].node);}
#line 1747 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 162 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = NULL;}
#line 1753 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 163 "jucompiler.y" /* yacc.c:1646  */
    {if((yyvsp[-1].node)!=NULL){(yyval.node)=(yyvsp[-1].node);}else{(yyval.node)=(yyvsp[-1].node);}}
#line 1759 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 166 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1765 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 169 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1771 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 172 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1777 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 173 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1783 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 176 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1789 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 177 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1795 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 178 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1801 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 179 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1807 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 180 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1813 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 181 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1819 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 182 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1825 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 183 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1831 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 184 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1837 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 185 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1843 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 186 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1849 "y.tab.c" /* yacc.c:1646  */
    break;

  case 66:
#line 187 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1855 "y.tab.c" /* yacc.c:1646  */
    break;

  case 67:
#line 188 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1861 "y.tab.c" /* yacc.c:1646  */
    break;

  case 68:
#line 189 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1867 "y.tab.c" /* yacc.c:1646  */
    break;

  case 69:
#line 190 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1873 "y.tab.c" /* yacc.c:1646  */
    break;

  case 70:
#line 191 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1879 "y.tab.c" /* yacc.c:1646  */
    break;

  case 71:
#line 192 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1885 "y.tab.c" /* yacc.c:1646  */
    break;

  case 72:
#line 193 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1891 "y.tab.c" /* yacc.c:1646  */
    break;

  case 73:
#line 194 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1897 "y.tab.c" /* yacc.c:1646  */
    break;

  case 74:
#line 195 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[-1].node);}
#line 1903 "y.tab.c" /* yacc.c:1646  */
    break;

  case 75:
#line 196 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1909 "y.tab.c" /* yacc.c:1646  */
    break;

  case 76:
#line 197 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1915 "y.tab.c" /* yacc.c:1646  */
    break;

  case 77:
#line 198 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1921 "y.tab.c" /* yacc.c:1646  */
    break;

  case 78:
#line 199 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1927 "y.tab.c" /* yacc.c:1646  */
    break;

  case 79:
#line 202 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1933 "y.tab.c" /* yacc.c:1646  */
    break;

  case 80:
#line 203 "jucompiler.y" /* yacc.c:1646  */
    {(yyval.node) = (yyvsp[0].node);}
#line 1939 "y.tab.c" /* yacc.c:1646  */
    break;

  case 81:
#line 206 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1945 "y.tab.c" /* yacc.c:1646  */
    break;

  case 82:
#line 207 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1951 "y.tab.c" /* yacc.c:1646  */
    break;

  case 83:
#line 208 "jucompiler.y" /* yacc.c:1646  */
    {;}
#line 1957 "y.tab.c" /* yacc.c:1646  */
    break;


#line 1961 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 209 "jucompiler.y" /* yacc.c:1906  */

