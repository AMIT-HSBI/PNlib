within PNlib.Functions.OddsAndEnds;
function conditionalSum "calculates the conditional sum of real vector entries"
  input Real vec[:];
  input Boolean con[:];
  output Real conSum;
algorithm
  conSum:=0;
  for i in 1:size(vec,1) loop
    if con[i] then
       conSum:=conSum + vec[i];
    end if;
  end for;
end conditionalSum;
