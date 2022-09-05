
all: parser1 scanner1

parser1: scanner2.l parser1.y
	bison -d -v parser1.y
	flex -oscanner2.lex.c scanner2.l
	gcc -o $@ parser1.tab.c scanner2.lex.c -lm

scanner1: scanner1.l
	flex scanner1.l
	gcc lex.yy.c -lfl -o scanner1

test2:
	./parser1 < Examples/ParseExample1.B > Output/test2_out1

test1:
	./scanner1 < Examples/Example1.B > Output/test1_out1
	./scanner1 < Examples/Example2.B > Output/test1_out2
	./scanner1 < Examples/Example3.B > Output/test1_out3
	./scanner1 < Examples/Example4.B > Output/test1_out4
	./scanner1 < Examples/Example5.B > Output/test1_out5
	./scanner1 < Examples/Example6.B > Output/test1_out6
	./scanner1 < Examples/Example7.B > Output/test1_out7

clean:
	rm scanner1 parser1
