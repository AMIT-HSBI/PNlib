within PNlib.Functions.OddsAndEnds;

function findFirstZero "finds the first zero entry of an integer vector and returns its index; returns 0 if the vector has no zero entry"
  input Integer vec[:];
  output Integer idx;
protected
  parameter Integer nSize = size(vec, 1);
  Boolean endAlg;
  Integer k;
algorithm
  endAlg := false;
  k := 1;
  idx := 0;
  while not endAlg and k <= nSize loop
    if vec[k] == 0 then
      idx := k;
      endAlg := true;
    else
      k := k + 1;
    end if;
  end while;
end findFirstZero;
