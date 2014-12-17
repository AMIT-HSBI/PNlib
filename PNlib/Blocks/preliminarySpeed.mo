within PNlib.Blocks;
block preliminarySpeed
  "calculates the preliminary speed of a continuous transition"
  input Integer nIn "number of input places";
  input Integer nOut "number of output places";
  input Real arcWeightIn[:] "input arc weights";
  input Real arcWeightOut[:] "output arc weights";
  input Real speedSumIn[:] "input speed";
  input Real speedSumOut[:] "output speed";
  input Real maximumSpeed "maximum speed";
  input Boolean active "activation";
  input Boolean weaklyInputActiveVec[:]
    "places that causes weakly input activation";
  input Boolean weaklyOutputActiveVec[:]
    "places that causes weakly output activation";
  output Real prelimSpeed "preliminary speed";
algorithm
  prelimSpeed:=maximumSpeed;
  for i in 1:nIn loop
    if weaklyInputActiveVec[i] and (1/arcWeightIn[i])*speedSumIn[i]<prelimSpeed then
       prelimSpeed:=(1/arcWeightIn[i])*speedSumIn[i];
    end if;
   end for;
   for i in 1:nOut loop
     if weaklyOutputActiveVec[i] and (1/arcWeightOut[i])*speedSumOut[i]<prelimSpeed then
        prelimSpeed:=(1/arcWeightOut[i])*speedSumOut[i];
     end if;
   end for;
end preliminarySpeed;
