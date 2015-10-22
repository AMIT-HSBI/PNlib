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
  output Real inflowSum;
  output Real inflow[nIn];
  output Real outflowSum;
  output Real outflow[nOut];
equation
  der(inflowSum) = conFiringSumIn;
  // der(inflow) = arcWeightIn .* instSpeedIn;
  for i in 1:nIn loop
    der(inflow[i]) = if pre(fireIn[i]) then arcWeightIn[i] * instSpeedIn[i] else 0.0;
  end for;
  der(outflowSum) = conFiringSumOut;
  // der(outflow) = arcWeightOut .* instSpeedOut;
  for i in 1:nOut loop
    der(outflow[i]) = if pre(fireOut[i]) then arcWeightOut[i] * instSpeedOut[i] else 0.0;
  end for;
end tokenFlowCon;
