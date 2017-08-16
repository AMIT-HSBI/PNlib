within PNlib.Functions.Enabling;
function benefitGreedyConOut "Enabling Output Transition by Benefit and Greedy"
  extends Modelica.Icons.Function;
  input Integer nOut "number of output transitions";
  input Real arcWeight[:] "arc weights of output transitions";
  input Real t "current token number";
  input Real minTokens "minimum capacity";
  input Boolean TAout[:] "active output transitions with passed delay";
  input Real enablingBene[:] "enabling benefit of output transitions";
  input Boolean disTransition[:] "discrete output transition";
  output Boolean TEout[nOut] "enabled output transitions";
protected
  Real arcWeightSum "arc weight sum";
  Integer Index "priority Index";
  Real MaxBenefit "Max Benefit";
  Real enablingBene_[nOut]  "Benefit";
algorithm
    TEout:=fill(false, nOut);
    enablingBene_:=enablingBene;
    arcWeightSum := 0;
    for i in 1: nOut loop  //discrete transitions are proven at first
      MaxBenefit:=max(enablingBene_);
      Index:=Modelica.Math.Vectors.find(MaxBenefit,enablingBene_);
      if Index>0 and TAout[Index] and disTransition[Index] and t-arcWeightSum-arcWeight[Index]-minTokens >= -Constants.almost_eps then
        TEout[Index] := true;
        arcWeightSum := arcWeightSum + arcWeight[Index];
      end if;
      enablingBene_[Index]:=-1;
    end for;
    enablingBene_:=enablingBene;
    for i in 1: nOut loop  //continuous transitions afterwards (discrete transitions have priority over continuous transitions)
      MaxBenefit:=max(enablingBene_);
      Index:=Modelica.Math.Vectors.find(MaxBenefit,enablingBene_);
      if Index>0 and TAout[Index] and not disTransition[Index] and t-arcWeightSum-arcWeight[Index]-minTokens >= -Constants.almost_eps then
        TEout[Index] := true;
        arcWeightSum := arcWeightSum + arcWeight[Index];
      end if;
      enablingBene_[Index]:=-1;
    end for;
end benefitGreedyConOut;
