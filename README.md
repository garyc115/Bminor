# Bminor
--------

This is my attempt at the project set in "Introduction to Compilers and Language Design"
by Douglas Thain, that is, to write a Bminor compiler. I will attempt to implement
this using the flex/bison toolchain.

Plan
----
(1) Create a number of Bminor programs, some correct, some with errors, to test each
    stage of the Bminor compiler.

Front-end
---------
(2) Write a scanner generator using Lex and test that it is reporting all valid tokens.

(3) Write a context-free grammar in BNF for the Bminor language as given in the text.

(4) Write a parser generator using Bison for the BNF above, and input the test files
    to it to simply check syntactic correctness of the grammar.

Back-end
--------
(5) For ease at this point I will just emit 'C' code from the parser so it can be
    compiled with gcc to check it is working with the test files.

(6) Now get the parser to emit an intermediate code. I have a choice here:
    (a) Three address code
    (b) Some type of bytecode: JVM, LLVM, or Python bytecode.

(7) Finally, have the compiler emit assembler.
