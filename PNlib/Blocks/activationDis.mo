within PNlib.Blocks;
block activationDis "Activation of a discrete transition"
  parameter input Integer nIn "number of input places";
  parameter input Integer nOut "number of output places";
  input Real tIn[:] "tokens of input places";
  input Real tOut[:] "tokens of output places";
  input Integer tIntIn[:] "tokens of input places";
  input Integer tIntOut[:] "tokens of output places";
  input Integer arcType[:] "arc type of input places";
  input Real arcWeightIn[:] "arc weights of input places";
  input Integer arcWeightIntIn[:] "arc weights of input places";
  input Real arcWeightOut[:] "arc weights of output places";
  input Integer arcWeightIntOut[:] "arc weights of output places";
  input Real minTokens[:] "minimum capacities of input places";
  input Integer minTokensInt[:] "minimum capacities of input places";
  input Real maxTokens[:] "maximum capacities of output places";
  input Integer maxTokensInt[:] "maximum capacities of output places";
  input Boolean firingCon "firing condition of transition";
  input Boolean disPlaceIn[:] "types of input places";
  input Boolean disPlaceOut[:] "types of output places";
  input Integer normalArc[:] "normal or double arc?";
  input Real testValue[:] "test values of test and inhibitor arcs";
  input Integer testValueInt[:]
    "integer test values of test and inhibitor arcs";
  output Boolean active "activation of transition";
algorithm
  active:=true;
  //check input places
  for i in 1:nIn loop
    if disPlaceIn[i] then //discrete
      if (arcType[i]==1 or normalArc[i]==2) and not (tIntIn[i]-arcWeightIntIn[i]  >= minTokensInt[i]) then
        active:=false;
      elseif arcType[i]==2 and not (tIntIn[i] > testValueInt[i]) then
        active:=false;
      elseif arcType[i]==3 and not (tIntIn[i] < testValueInt[i]) then
        active:=false;
      end if;
    else  //continuous
      if (arcType[i]==1 or normalArc[i]==2) and not (tIn[i]-arcWeightIn[i]-minTokens[i] >= -Constants.almost_eps) then
        active:=false;
      elseif arcType[i]==2 and not (tIn[i] > testValue[i]) then
        active:=false;
      elseif arcType[i]==3 and not (tIn[i] < testValue[i]) then
        active:=false;
      end if;
   end if;
  end for;
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
end activationDis;
