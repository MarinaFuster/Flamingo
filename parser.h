#ifndef __PARSER_H
#define __PARSER_H

//#define NSYMS 20 /* maximum number of symbols */

#define UNDECLARED 0
#define DECLARED 1

typedef void * any_t;
typedef enum { TYPE_UNDEF, TYPE_NUMBER, TYPE_STRING, TYPE_REG } var_type_t;

//typedef enum { OP_GREATER, OP_GREATER_EQ, OP_LESSER, OP_LESSER_EQ, OP_EQUALS, OP_NOT_EQ } op_t;

struct sym
{
    char *name;
    char *str;
    var_type_t var_type;
    int isDeclared;
} sym;

//struct symtab *symlook();

//void warning(char *s, char *t);
void init_parser();
int is_declared(char * key);
int update_sym_table(char * key, any_t value);

int numOfDigits(int n);
int yywrap();

#endif
