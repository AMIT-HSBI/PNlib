within PNlib.Functions.Random;
impure function randomMax "the largest value the random function can return"
  output Integer x;

  external "C" x = _randomMax() annotation(Include = "#include <stdlib.h>
                                                      int _randomMax()
                                                      {
                                                        return RAND_MAX;
                                                      }");
end randomMax;
