within PNlib.Functions.OddsAndEnds;
function deleteElementInt "deletes an element of an integer vector"
  input Integer vecin[:];
  input Integer idx;
  output Integer vecout[size(vecin,1)];
protected
  parameter Integer nVec= size(vecin,1);
algorithm
  assert(idx >= 1 and idx <=nVec, "PNlib.Functions.OddsAndEnds.deleteElementInt: index out of range");
  if nVec == idx then
    vecout[1:idx-1]:=vecin[1:idx-1];
    vecout[nVec]:=0;
  elseif idx == 1 then
    vecout[idx:nVec-1]:=vecin[idx+1:nVec];
    vecout[nVec]:=0;
  else
    vecout[1:idx-1]:=vecin[1:idx-1];
    vecout[idx:nVec-1]:=vecin[idx+1:nVec];
    vecout[nVec]:=0;
  end if;
end deleteElementInt;
