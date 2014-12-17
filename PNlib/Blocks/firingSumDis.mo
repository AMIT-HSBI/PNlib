within PNlib.Blocks;
block firingSumDis "calculates the firing sum of discrete places"
  input Boolean fire[:] "firability of transitions";
  input Integer arcWeight[:] "arc weights";
  output Integer firingSum "firing sum";
algorithm
  firingSum:=0;
  for i in 1:size(fire,1) loop
    if fire[i] then
       firingSum:=firingSum + arcWeight[i];
    end if;
  end for;
end firingSumDis;
