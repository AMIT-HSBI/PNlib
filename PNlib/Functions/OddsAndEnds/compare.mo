within PNlib.Functions.OddsAndEnds;
function compare "compare two simulation results (test suite)"
  input Real time_org[:];
  input Real time_test[:];
  input Real var_org[:];
  input Real var_test[:];
  input Real interval;
  input Real stopTime;
  output Real err;
protected
  Integer j;
  Integer k;
algorithm
  j:=1;
  k:=1;
  err:=0;
  for i in 0:interval:stopTime loop
      while time_org[j]<=i loop
        if j<size(time_org,1) then
          j:=j + 1;
        else
          break;
        end if;
      end while;
       while time_test[k]<=i loop
        if k<size(time_test,1) then
          k:=k + 1;
        else
          break;
        end if;
      end while;
    err:=err + (var_org[j-1] - var_test[k-1])^2;
  end for;
end compare;
