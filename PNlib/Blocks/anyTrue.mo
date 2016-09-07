within PNlib.Blocks;
block anyTrue "Is any entry of a Boolean vector true?"
  input Boolean vec[:];
  output Boolean anytrue;
  output Integer numtrue;
algorithm
  anytrue:=false;
  numtrue:=0;
  for i in 1:size(vec, 1) loop
    anytrue:=anytrue or vec[i];
    if vec[i] then
      numtrue:=numtrue+1;
    end if;
  end for;
end anyTrue;
