within PNlib.Functions.ArrayUtils;
function arrayNot "n-ary boolean NOT"
  input Boolean b[:];
  output Boolean res[size(b, 1)];
algorithm
  for i in 1:size(b, 1) loop
    res[i] := not b[i];
  end for;
end arrayNot;
