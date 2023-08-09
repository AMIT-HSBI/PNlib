within PNlib.Functions.OddsAndEnds;

function compareReal "compare two real vectors"
  input Real vec1[:];
  input Real vec2[:];
  output Boolean vec3[size(vec1, 1)];
algorithm
  for i in 1:size(vec1, 1) loop
    vec3[i] := vec1[i] > vec2[i];
  end for;
end compareReal;
