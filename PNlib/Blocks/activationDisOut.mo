within PNlib.Blocks;
block activationDisOut "Output activation of a discrete transition"
  parameter input Integer nOut "number of output places";
  input Real tOut[:] "tokens of output places";
  input Integer tIntOut[:] "tokens of output places";
  input Real arcWeightOut[:] "arc weights of output places";
  input Integer arcWeightIntOut[:] "arc weights of output places";
  input Real maxTokens[:] "maximum capacities of output places";
  input Integer maxTokensInt[:] "maximum capacities of output places";
  input Boolean firingCon "firing condition of transition";
  input Boolean disPlaceOut[:] "types of output places";
  output Boolean active "activation of transition";
algorithm
  active:=true;
  //check output places
  for i in 1:nOut loop
    if disPlaceOut[i] then //discrete
      if not (tIntOut[i]+arcWeightIntOut[i] <= maxTokensInt[i]) then
        active:=false;
      end if;
    else  //continuous
      if not (tOut[i]+arcWeightOut[i]-maxTokens[i] <= Constants.almost_eps) then
        active:=false;
      end if;
    end if;
  end for;
  active:=active and firingCon;
end activationDisOut;
