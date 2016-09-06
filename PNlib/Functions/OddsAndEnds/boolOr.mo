within PNlib.Functions.OddsAndEnds;
function boolOr "hack for Dymola 2017"
  input Boolean a[:];
  input Boolean b[:];
  output Boolean result[size(a, 1)];
algorithm
  for i in 1:size(a, 1) loop
    result[i] := a[i] or b[i];
  end for;
  annotation(Inline = true);
end boolOr;
