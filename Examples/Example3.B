/*
 * Example3.B (Correct)
 * Test "if-else" statement
 */

 main: function void () = {
    test: boolean;
    num1: integer = 5;
    num2: integer = 7;
    test = num1 > num2;
    if (test)
        print "num1 is greater than num2\n";
    else
        print "num1 is NOT greater than num2\n";
    if (num1 == num2)
        print "num1 equals num2\n";
 }
