within PNlib.Functions.OddsAndEnds;

function countTrue "counts the true entries of a Boolean vectors"
  input Boolean vec[:];
  output Integer count;
  output Integer idx[size(vec, 1)];
algorithm
  count := 0;
  idx := zeros(size(vec, 1));
  for i in 1:size(vec, 1) loop
    if vec[i] then
      count := count + 1;
      idx[count] := i;
    end if;
  end for;
end countTrue;
