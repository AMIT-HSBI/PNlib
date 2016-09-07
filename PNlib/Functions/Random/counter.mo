within PNlib.Functions.Random;
impure function counter "Impure function which counts its calls."
  output Integer value;

  external "C" value = _counter() annotation(Include = "int _counter()
                                                 {
                                                   static int counter=0;
                                                   return ++counter;
                                                 }");
end counter;
