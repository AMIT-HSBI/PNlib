within PNlib.Functions.Random;
impure function random
  "external C-function to generate uniform distributed random numbers"
  output Integer x;

  external "C" x = _random() annotation(Include = "#include <stdlib.h>
                                                   int _random()
                                                   {
                                                     static int called=0;
                                                     int i;
                                                     if(!called)
                                                     {
                                                       srand((unsigned) time(NULL));
                                                       called=1;
                                                     }
                                                     return rand();
                                                   }");
end random;
