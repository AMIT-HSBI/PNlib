within PNlib.Blocks;

block firingSumCon "calculates the firing sum of continuous places"
  input Boolean fire[:] "firability of transitions";
  input Real arcWeight[:] "arc weights";
  input Real instSpeed[:] "istantaneous speed of transitions";
  input Boolean disTransition[:] "types of transitions";
  output Real conFiringSum "continuous firing sum";
  output Real disFiringSum "discrete firing sum";
protected
  Real vec1[size(fire, 1)];
  Real vec2[size(fire, 1)];
//algorithm //changed 21.03.11 due to negative values
equation
  for i in 1:size(fire, 1) loop
    if fire[i] and not disTransition[i] then
      vec1[i] = arcWeight[i]*instSpeed[i];
    else
      vec1[i] = 0;
    end if;
    if fire[i] and disTransition[i] then
      vec2[i] = arcWeight[i];
    else
      vec2[i] = 0;
    end if;
  end for;
  conFiringSum = sum(vec1);
  disFiringSum = sum(vec2);
end firingSumCon;
