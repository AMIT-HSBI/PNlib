within PNlib.Functions.OddsAndEnds;
function conditionalSumInt
  "calculates the conditional sum of integer vector entries"
  input Integer vec[:];
  input Boolean con[:];
  output Integer conSum;
algorithm
  conSum:=0;
  for i in 1:size(vec,1) loop
    if con[i] then
       conSum:=conSum + vec[i];
    end if;
  end for;
end conditionalSumInt;
