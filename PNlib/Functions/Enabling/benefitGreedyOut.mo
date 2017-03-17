within PNlib.Functions.Enabling;
function benefitGreedyOut "Enabling Output Transition by Benefit and Greedy"
  extends Modelica.Icons.Function;
  input Integer nOut "number of output transitions";
  input Integer arcWeight[:] "arc weights of output transitions";
  input Integer t "current token number";
  input Integer minTokens "minimum capacity";
  input Boolean TAout[:] "active output transitions with passed delay";
  input Real enablingBene[:] "enabling benefit of output transitions";
  input Boolean disTransition[:] "discrete output transition";
  output Boolean TEout[nOut] "enabled output transitions";
  output Integer arcWeightSum "arc weight sum";
protected
  Integer Index "priority Index";
  Real MaxBenefit "Max Benefit";
  Real enablingBene_[nOut]  "Max Benefit";
algorithm
    TEout:=fill(false, nOut);
    enablingBene_:=enablingBene;
    arcWeightSum := 0;
    for i in 1: nOut loop  //discrete transitions are proven at first
      MaxBenefit:=max(enablingBene);
      Index:=Modelica.Math.Vectors.find(MaxBenefit,enablingBene);
      if Index>0 and TAout[Index] and disTransition[Index] and t-(arcWeightSum+arcWeight[Index]) >= minTokens then
        TEout[Index] := true;
        arcWeightSum := arcWeightSum + arcWeight[Index];
      end if;
      enablingBene_[Index]:=-1;
    end for;
    for i in 1: nOut loop  //continuous transitions afterwards (discrete transitions have priority over continuous transitions)
      if TAout[i] and not disTransition[i] and t-(arcWeightSum+arcWeight[i]) >= minTokens then
        TEout[i] := true;
        arcWeightSum := arcWeightSum + arcWeight[i];
      end if;
    end for;
end benefitGreedyOut;
