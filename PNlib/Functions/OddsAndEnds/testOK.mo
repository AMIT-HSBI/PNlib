within PNlib.Functions.OddsAndEnds;

function testOK "calculates if the test is ok if a Petri net has stochastic effects (test suite)"
  input Real err[:];
  input String name;
  input Real tol = 0.5;
  output Boolean ok;
protected
  Integer i;
algorithm
  ok := false;
  i := 1;
  while not ok and i <= size(err, 1) loop
    if err[i] < tol then
      ok := true;
    end if;
    i := i + 1;
  end while;
  printResult(ok, name);
end testOK;
