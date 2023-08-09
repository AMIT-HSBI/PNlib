within PNlib.Functions.OddsAndEnds;

function boolToInt "converts a boolean to an integer"
  input Boolean bool;
  output Integer int;
algorithm
  int := if bool then 1 else 0;
end boolToInt;
