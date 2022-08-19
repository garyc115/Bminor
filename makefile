
all: scanner1

scanner1: scanner1.l
	flex scanner1.l
	gcc lex.yy.c -lfl -o scanner1

test:
	./scanner1 < Examples/Example1.B > Output/out1
	./scanner1 < Examples/Example2.B > Output/out2
	./scanner1 < Examples/Example3.B > Output/out3
	./scanner1 < Examples/Example4.B > Output/out4
	./scanner1 < Examples/Example5.B > Output/out5
	./scanner1 < Examples/Example6.B > Output/out6
	./scanner1 < Examples/Example7.B > Output/out7

clean:
	rm scanner1 lex.yy.c
