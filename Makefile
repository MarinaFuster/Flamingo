# MakeFile for Flamingo Language

# programs with their parameters
GCC=gcc -g -pedantic -Wall
YACC=yacc -d
LEX=lex
REMOVE=rm -f

.PHONY: lex
lex: lex.yy.c

.PHONY: yacc
yacc: y.tab.c

.PHONY: all
all: lex yacc flamingo removeJava

.PHONY: removeJava
removeJava:
	$(REMOVE) *.java

.PHONY: removeClassFiles
removeClassFiles:
	$(REMOVE) *.class

flamingo: lex.yy.c y.tab.c
	$(GCC) lex.yy.c y.tab.c parser.c hashmap.c -o flamingompiler -Wno-unused-function

y.tab.c: fYacc.y
	$(YACC) fYacc.y -Wno-conflicts-sr -Wno-conflicts-rr

lex.yy.c: y.tab.c fLex.l
	$(LEX) fLex.l


.PHONY: clean
clean:	removeClassFiles	removeJava
			rm -rf *.o *.bin *.out
			rm -rf flamingompiler lex.yy.c y.tab.c y.tab.h
			rm -rf *.dSYM


####################################################################################################

#fake exists to test yacc programs
.PHONY: fake
fake: yacc fake_lex flamingo

fake_lex: y.tab.c fakeLex.l
	$(LEX) fakeLex.l
