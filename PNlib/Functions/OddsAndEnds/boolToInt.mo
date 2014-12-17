within PNlib.Functions.OddsAndEnds;
function boolToInt "converts a boolean to an integer"
  input Boolean bool;
  output Integer int;
algorithm
  if bool then
    int:=1;
  else
    int:=0;
  end if;
end boolToInt;
