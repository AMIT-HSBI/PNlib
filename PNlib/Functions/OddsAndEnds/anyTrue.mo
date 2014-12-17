within PNlib.Functions.OddsAndEnds;
function anyTrue "Is any entry of a boolean vector true"
  input Boolean vec[:];
  output Boolean anytrue;
algorithm
  anytrue:=false;
  for i in 1:size(vec, 1) loop
      anytrue:=anytrue or vec[i];
  end for;
end anyTrue;
