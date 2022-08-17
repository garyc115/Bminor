*
 * Example2.B (Correct)
 * Test math operations
 */

 main: function void () = {
    x: integer;
    y: integer = 123;
    z: integer = 7;
    x = y + z;                      // x = 120
    print "x is ", x, "\n";
    y= y - 102;                     // y = 21
    print "y is ", y, "\n";
    print "z is ", z, "\n";         // z = 7
    x = y/z;                        // x = 3
    print "x is now ", x, "\n";
    x = 2 * x;                      // x = 6
    print "x is now ", x, "\n";
 }
 
