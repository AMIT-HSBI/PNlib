within PNlib.Functions.OddsAndEnds;
function numTrue
  input Boolean vec[:];
  output Integer numTrue;
algorithm
  numTrue := 0;
  for i in 1:size(vec, 1) loop
    if vec[i] then
      numTrue := numTrue+1;
    end if;
  end for;
end numTrue;
