within PNlib.Blocks;
block tokenFlowCon "Calculates the token flow for a continuous place."
  parameter input Integer nIn "number of input transitions";
  parameter input Integer nOut "number of output transitions";
  input Real conFiringSumIn;
  input Real conFiringSumOut;
  input Boolean fireIn[nIn];
  input Boolean fireOut[nOut];
  input Real arcWeightIn[nIn];
  input Real arcWeightOut[nOut];
  input Real instSpeedIn[nIn];
  input Real instSpeedOut[nOut];
  output Real tInflowSum;
  output Real tInflow[nIn];
  output Real tOutflowSum;
  output Real tOutflow[nOut];
equation
  der(tInflowSum) = conFiringSumIn;
  // der(tInflow) = arcWeightIn .* instSpeedIn;
  for i in 1:nIn loop
    der(tInflow[i]) = if pre(fireIn[i]) then arcWeightIn[i] * instSpeedIn[i] else 0.0;
  end for;
  der(tOutflowSum) = conFiringSumOut;
  // der(tOutflow) = arcWeightOut .* instSpeedOut;
  for i in 1:nOut loop
    der(tOutflow[i]) = if pre(fireOut[i]) then arcWeightOut[i] * instSpeedOut[i] else 0.0;
  end for;
end tokenFlowCon;
