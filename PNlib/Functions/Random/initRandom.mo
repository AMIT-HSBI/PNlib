within PNlib.Functions.Random;
impure function initRandom "(re)initialize random number generator"
  impure function initRandom_help
    "external C-function to (re)initialize random number generator"
    input Integer seed;

    external "C" _initRandom(seed) annotation(Include = "
  #include <stdlib.h>
  int _initRandom(int seed)
  {
   srand(seed);
  }");
  end initRandom_help;

  input Integer seed;
algorithm
  random();
  initRandom_help(seed);
end initRandom;
