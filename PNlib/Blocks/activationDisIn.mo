within PNlib.Blocks;
block activationDisIn "Input Activation of a discrete transition"
  import PNlib.Types.ArcType;
  parameter input Integer nIn "number of input places";
  input Real tIn[:] "tokens of input places";
  input Integer tIntIn[:] "tokens of input places";
  input ArcType arcType[:] "arc type of input places";
  input Real arcWeightIn[:] "arc weights of input places";
  input Integer arcWeightIntIn[:] "arc weights of input places";
  input Real minTokens[:] "minimum capacities of input places";
  input Integer minTokensInt[:] "minimum capacities of input places";
  input Boolean firingCon "firing condition of transition";
  input Boolean disPlaceIn[:] "types of input places";
  input Boolean normalArc[:] "normal or double arc?";
  input Real testValue[:] "test values of test and inhibitor arcs";
  input Integer testValueInt[:] "integer test values of test and inhibitor arcs";
  output Boolean active "activation of transition";
algorithm
  active:=true;
  //check input places
  for i in 1:nIn loop
    if disPlaceIn[i] then //discrete
      if (arcType[i]==ArcType.NormalArc or not normalArc[i]) and not (tIntIn[i]-arcWeightIntIn[i]  >= minTokensInt[i]) then
        active:=false;
      elseif arcType[i]==ArcType.RealTestArc and not (tIntIn[i] > testValueInt[i]) then
        active:=false;
      elseif arcType[i]==ArcType.TestArc and not (tIntIn[i] >= testValueInt[i]) then
        active:=false;
      elseif arcType[i]==ArcType.RealInhibitorArc and not (tIntIn[i] < testValueInt[i]) then
        active:=false;
      elseif arcType[i]==ArcType.InhibitorArc and not (tIntIn[i] <= testValueInt[i]) then
        active:=false;
      end if;
    else  //continuous
      if (arcType[i]==ArcType.NormalAr or not normalArc[i]) and not (tIn[i]-arcWeightIn[i]-minTokens[i] >= -Constants.almost_eps) then
        active:=false;
      elseif arcType[i]==ArcType.RealTestArc and not (tIn[i] > testValue[i]) then
        active:=false;
      elseif arcType[i]==ArcType.TestArc and not (tIn[i] >= testValue[i]) then
        active:=false;
      elseif arcType[i]==ArcType.RealInhibitorArc and not (tIn[i] < testValue[i]) then
        active:=false;
      elseif arcType[i]==ArcType.InhibitorArc and not (tIn[i] <= testValue[i]) then
        active:=false;
      end if;
    end if;
  end for;
  active:=active and firingCon;
end activationDisIn;
