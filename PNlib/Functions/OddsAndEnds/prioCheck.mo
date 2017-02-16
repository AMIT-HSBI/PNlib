within PNlib.Functions.OddsAndEnds;
function prioCheck "Determine the priotities are correct"
  extends Modelica.Icons.Function;
  input Integer enablingPrio[:] "enabling priorities";
  input Integer N "number of transitions";
  output Boolean result "= true, if priorities are correctly";
algorithm
  result:=true;
  for i in 1:N loop
    if Modelica.Math.Vectors.find(i,enablingPrio)==0 then
      result:=false;
      return;
    end if;
  end for;
end prioCheck;
