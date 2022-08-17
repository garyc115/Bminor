/*
 * Example4.B (Correct)
 * Test "while" statement
 */
 main: function void () = {
    out_string1: string = "Fizz\n";
    out_string2: string = "Buzz\n";
    out_string3: string = "Fizzbuzz\n"
    max: integer = 15;
    count: integer = 0;
    while(count < max) {
        if (count % 5)
            if (count % 3)
                print out_string3;
            else
                print out_string2;
        else
            if (count % 3)
                print out_string1;
            else
                print count, "\n";
    }
 }
