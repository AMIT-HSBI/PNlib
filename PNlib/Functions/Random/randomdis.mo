within PNlib.Functions.Random;
function randomdis "generates a triangular distributed random number according to a, b and c"
  input Real E[:] "Events of Discrete Distribution";
  input Real P[:] "Probability of Discrete Distribution";
  input Real r128 "A random number with a uniform distribution on the interval (0,1]";
  output Real timeValue;
protected
  Real CumP[size(P,1)];
algorithm
  timeValue:=E[size(P,1)];
  CumP[1]:=P[1];
  for i in 2:size(P,1) loop
    CumP[i]:= CumP[i-1]+P[i];
  end for;
  for i in 1:size(P,1) loop
    if r128 <= CumP[i] then
        timeValue:=E[i];
        return;
    end if;
  end for;
end randomdis;
