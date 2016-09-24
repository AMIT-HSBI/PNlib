within PNlib.Functions;
function preliminarySpeed "calculates the preliminary speed of a continuous transition"
  parameter input Integer nIn "number of input places";
  parameter input Integer nOut "number of output places";
  input Real arcWeightIn[:] "input arc weights";
  input Real arcWeightOut[:] "output arc weights";
  input Real speedSumIn[:] "input speed";
  input Real speedSumOut[:] "output speed";
  input Real maximumSpeed "maximum speed";
  input Boolean weaklyInputActiveVec[:] "places that causes weakly input activation";
  input Boolean weaklyOutputActiveVec[:] "places that causes weakly output activation";
  output Real prelimSpeed "preliminary speed";
protected
  Real speedSum;
  Real arcWeight;
algorithm
  prelimSpeed := max(maximumSpeed, 0.0);

  for i in 1:nIn loop
    speedSum := max(speedSumIn[i], 0.0);
    arcWeight := max(arcWeightIn[i], 0.0);
    if weaklyInputActiveVec[i] and speedSum < prelimSpeed*arcWeight then
      prelimSpeed := speedSum/arcWeight;
    end if;
  end for;

  for i in 1:nOut loop
    speedSum := max(speedSumOut[i], 0.0);
    arcWeight := max(arcWeightOut[i], 0.0);
    if weaklyOutputActiveVec[i] and speedSum < prelimSpeed*arcWeight then
      prelimSpeed := speedSum/arcWeight;
    end if;
  end for;
end preliminarySpeed;
