within PNlib.Functions.OddsAndEnds;
function eventCheck "Determine the event times are correct"
  extends Modelica.Icons.Function;
  input Real eventtime[:] "event times";
  output Boolean result "= true, if event times are correctly";
algorithm
  result:=true;
  if eventtime[1] == 0 then
    result:=false;
    return;
  end if;
  for i in 2:size(eventtime,1) loop
    if eventtime[i-1]>=eventtime[i] then
      result:=false;
      return;
    end if;
  end for;
end eventCheck;
