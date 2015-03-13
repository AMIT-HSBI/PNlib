within PNlib.Functions.OddsAndEnds;
function deleteElementInt "deletes an element of an integer vector"
  input Integer vecin[:];
  input Integer idx;
  output Integer vecout[size(vecin,1)];
protected
  parameter Integer nVec= size(vecin,1);
algorithm
  vecout[1:idx-1]:=vecin[1:idx-1];
  vecout[idx:nVec-1]:=vecin[idx+1:nVec];
  vecout[nVec]:=0;
end deleteElementInt;
