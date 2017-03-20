within PNlib.Functions.Enabling;
function benefitGreedyDisIn "Enabling Input Transition by Benefit and Greedy"
  extends Modelica.Icons.Function;
  input Integer nIn "number of input transitions";
  input Integer arcWeight[:] "arc weights of input transitions";
  input Integer t "current token number";
  input Integer maxTokens "maximum capacity";
  input Boolean TAein[:] "active previous transitions which are already enabled by their input places";
  input Real enablingBene[:] "enabling benefit of input transitions";
  input Boolean disTransition[:] "type of input transitions";
  output Boolean TEin[nIn] "enabled input transitions";
protected
  Integer arcWeightSum "arc weight sum";
  Integer Index "priority Index";
  Real MaxBenefit "Max Benefit";
  Real enablingBene_[nIn]  "Benefit";
algorithm
    TEin:=fill(false, nIn);
    enablingBene_:=enablingBene;
    arcWeightSum := 0;
    for i in 1: nIn loop  //discrete transitions are proven at first
      MaxBenefit:=max(enablingBene_);
      Index:=Modelica.Math.Vectors.find(MaxBenefit,enablingBene_);
      if Index>0 and TAein[Index] and disTransition[Index] and t+arcWeightSum+arcWeight[Index] <= maxTokens then
        TEin[Index] := true;
        arcWeightSum := arcWeightSum + arcWeight[Index];
      end if;
      enablingBene_[Index]:=-1;
    end for;
    enablingBene_:=enablingBene;
    for i in 1: nIn loop  //continuous transitions afterwards (discrete transitions have priority over continuous transitions)
      MaxBenefit:=max(enablingBene_);
      Index:=Modelica.Math.Vectors.find(MaxBenefit,enablingBene_);
      if Index>0 and TAein[Index] and not disTransition[Index] and t+arcWeightSum+arcWeight[Index] <= maxTokens then
        TEin[Index] := true;
        arcWeightSum := arcWeightSum + arcWeight[Index];
      end if;
      enablingBene_[Index]:=-1;
    end for;
end benefitGreedyDisIn;
