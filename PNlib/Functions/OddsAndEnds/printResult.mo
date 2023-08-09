within PNlib.Functions.OddsAndEnds;

function printResult "print the test result (test suite)"
  input Boolean ok;
  input String name;
algorithm
  if ok then
    Modelica.Utilities.Streams.print(name + ": ok");
  else
    Modelica.Utilities.Streams.print(name + ": not ok!!!");
  end if;
end printResult;
