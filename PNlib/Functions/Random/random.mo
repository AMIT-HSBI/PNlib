within PNlib.Functions.Random;
function random
  "external C-function to generate uniform distributed random numbers"
  output Integer x;
  external "C" annotation(Include = "#include <random.c>",__Dymola_pure=false);
end random;
