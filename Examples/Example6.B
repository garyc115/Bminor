/*
 * Example6.B (Errors)
 */

 puts: function void (s: string);

 main: function integer () = {
    1message: string = {"Hello world!\n"};   // error invalid identifier
    puts(1message)                           // error; missing semi-colon
    retrn (0);                               // error; return misspelt
 }
 
