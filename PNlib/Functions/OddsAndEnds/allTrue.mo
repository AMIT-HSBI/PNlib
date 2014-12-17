within PNlib.Functions.OddsAndEnds;
function allTrue "Are all entries of a boolean vector true?"
  input Boolean vec[:];
  output Boolean alltrue;
algorithm
  alltrue:=true;
  for i in 1:size(vec, 1) loop
      alltrue:=alltrue and vec[i];
  end for;
end allTrue;
