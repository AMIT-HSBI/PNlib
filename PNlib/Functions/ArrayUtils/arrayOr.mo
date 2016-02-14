within PNlib.Functions.ArrayUtils;
function arrayOr "n-ary boolean OR"
  input Boolean b1[:];
  input Boolean b2[:];
  output Boolean res[size(b1, 1)];
algorithm
  for i in 1:size(b1, 1) loop
    res[i] := b1[i] or b2[i];
  end for;
end arrayOr;
