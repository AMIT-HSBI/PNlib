within PNlib.Blocks;

block tokenFlowDis "Calculates the token flow for a discrete place."
  parameter input Integer nIn "number of input transitions";
  parameter input Integer nOut "number of output transitions";
  input Boolean fireIn[nIn];
  input Boolean fireOut[nOut];
  input Integer arcWeightIn[nIn];
  input Integer arcWeightOut[nOut];
  output Integer inflowSum;
  output Integer inflow[nIn];
  output Integer outflowSum;
  output Integer outflow[nOut];
equation
  for i in 1:nIn loop
    inflow[i] = pre(inflow[i]) + (if pre(fireIn[i]) then arcWeightIn[i] else 0);
  end for;
  inflowSum = sum(inflow);
  for i in 1:nOut loop
    outflow[i] = pre(outflow[i]) + (if pre(fireOut[i]) then arcWeightOut[i] else 0);
  end for;
  outflowSum = sum(outflow);
end tokenFlowDis;
