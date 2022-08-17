/*
 * Example5.B (Correct)
 * Use of functions, arrays and for-loop
 */
 isInName: function boolean (x: char, a: array [] char, size: integer) = {
    i: integer;
    for (i=0; i<size; i++) {
        if (a[i] == x)
            return true;
    }
    return false;
 }

 main: function void () = {
    name: array [] char = {'E', 'r', 'i', 'c'};
    b: boolean;
    c: char = 'a';
    b = isInName(c, name, 4);
    if (b)
        print c " is in the name " name, "\n";
    else
        print c "is NOT in the name " name, "\n";
 }
 
