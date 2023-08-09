within PNlib.Functions.Enabling;

function benefitQuotientDisIn "Enabling Input Transition by Benefit and Quotient"
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
  Real enablingBeneQuo[nIn] "Benefit Quotient";
algorithm
  TEin := fill(false, nIn);
  enablingBeneQuo := enablingBene./arcWeight;
  arcWeightSum := 0;
  for i in 1:nIn loop //discrete transitions are proven at first
    MaxBenefit := max(enablingBeneQuo);
    Index := Modelica.Math.Vectors.find(MaxBenefit, enablingBeneQuo);
    if Index > 0 and TAein[Index] and disTransition[Index] and t + arcWeightSum + arcWeight[Index] <= maxTokens then
      TEin[Index] := true;
      arcWeightSum := arcWeightSum + arcWeight[Index];
    end if;
    enablingBeneQuo[Index] := -1;
  end for;
  enablingBeneQuo := enablingBene./arcWeight;
  for i in 1:nIn loop //continuous transitions afterwards (discrete transitions have priority over continuous transitions)
    MaxBenefit := max(enablingBeneQuo);
    Index := Modelica.Math.Vectors.find(MaxBenefit, enablingBeneQuo);
    if Index > 0 and TAein[Index] and not disTransition[Index] and t + arcWeightSum + arcWeight[Index] <= maxTokens then
      TEin[Index] := true;
      arcWeightSum := arcWeightSum + arcWeight[Index];
    end if;
    enablingBeneQuo[Index] := -1;
  end for;
end benefitQuotientDisIn;
