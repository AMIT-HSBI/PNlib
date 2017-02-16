within PNlib.Functions.OddsAndEnds;
function prioCheck "Determine the priotities are correct"
  extends Modelica.Icons.Function;
  input Integer enablingPrio[:] "enabling priorities";
  input Integer N "number of transitions";
  output Boolean result "= true, if priorities are Correctly";
protected
  Integer Index;  
algorithm
  Index:=1;
  result:=true;
  while result==true and Index<=N loop
    if Modelica.Math.Vectors.find(Index,enablingPrio)==0 then
        result:=false;
    end if;
    Index:=Index+1;
  end while;
end prioCheck;
