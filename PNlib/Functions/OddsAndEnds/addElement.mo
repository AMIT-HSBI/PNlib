within PNlib.Functions.OddsAndEnds;
function addElement
  input Real vecin[:];
  output Real vecout[size(vecin,1)+1];
protected
  parameter Integer nVec= size(vecin,1);
algorithm
for i in 1:nVec loop
    vecout[i]:=vecin[i];
end for;
vecout[nVec+1]:=PNlib.Constants.inf;
end addElement;
