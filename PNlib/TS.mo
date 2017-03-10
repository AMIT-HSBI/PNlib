within PNlib;
model TS "Stochastic Transition"
  //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing=true));
  parameter PNlib.Types.DistributionType distributionType=PNlib.Types.DistributionType.Exponential
    "distribution type of delay" annotation(Dialog(enable = true, group = "Distribution"));
  Real h=1
    "probability density" annotation(Dialog(enable = if distributionType==PNlib.Types.DistributionType.Exponential then true else false, group = "Exponential distribution"));
  Real a=0
    "Lower limit" annotation(Dialog(enable = if distributionType==PNlib.Types.DistributionType.Triangular then true else false, group = "Triangular distribution"));
  Real b=1
    "Upper Limit" annotation(Dialog(enable = if distributionType==PNlib.Types.DistributionType.Triangular then true else false, group = "Triangular distribution"));
  Real c=0.5
    "Most likely value" annotation(Dialog(enable = if distributionType==PNlib.Types.DistributionType.Triangular then true else false, group = "Triangular distribution"));
  Real arcWeightIn[nIn]=fill(1, nIn) "arc weights of input places"
                                         annotation(Dialog(enable = true, group = "Arc Weights"));
  Real arcWeightOut[nOut]=fill(1, nOut) "arc weights of output places"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
  Boolean firingCon=true "additional firing condition" annotation(Dialog(enable = true, group = "Firing Condition"));
  //****MODIFIABLE PARAMETERS AND VARIABLES END****//
  discrete Real putFireTime "putative firing time";
  Integer showTransitionName=settings.showTransitionName
    "only for transition animation and display (Do not change!)";
  Integer animatePutFireTime=settings.animatePutFireTime
    "only for transition animation and display (Do not change!)";
  Integer animateHazardFunc=settings.animateHazardFunc
    "only for transition animation and display (Do not change!)";
  Real color[3] "only for transition animation and display (Do not change!)";
  parameter Integer localSeed = PNlib.Functions.Random.counter() "Local seed to initialize random number generator" annotation(Dialog(enable = true, group = "Random Number Generator"));
protected
  discrete Integer state128[4] "state of random number generator";
  Real r128 "random number";
  outer PNlib.Settings settings "global settings for animation and display";
  discrete Real fireTime "for transition animation";
  Real tIn[nIn] "tokens of input places";
  Real tOut[nOut] "tokens of output places";
  Real minTokens[nIn] "minimum tokens of input places";
  Real maxTokens[nOut] "maximum tokens of output places";
  Real testValue[nIn] "test values of input arcs";
  Integer arcWeightIntIn[nIn]
    "Integer arc weights of discrete input places (for generating events!)";
  Integer arcWeightIntOut[nOut]
    "Integer arc weights of discrete output places (for generating events!)";
  Integer minTokensInt[nIn]
    "Integer minimum tokens of input places (for generating events!)";
  Integer maxTokensInt[nOut]
    "Integer maximum tokens of output places (for generating events!)";
  Integer tIntIn[nIn] "Integer tokens of input places (for generating events!)";
  Integer tIntOut[nOut]
    "Integer tokens of output places (for generating events!)";
  PNlib.Types.ArcType arcType[nIn]
      "type of input arcs 1=normal, 2=real test arc,  3=test arc, 4=real inhibitor arc, 5=inhibitor arc, 6=read arc";
  Integer testValueInt[nIn]
    "Integer test values of input arcs (for generating events!)";
  Boolean normalArc[nIn]
    "1=no, 2=yes, i.e. double arc: test and normal arc or inhibitor and normal arc";
  Boolean delayPassed(start=false, fixed=true) "Is the delay passed?";
  Boolean ani "for transition animation";
  Boolean disPlaceIn[nIn]
    "Are the input places discrete or continuous? true=discrete";
  Boolean disPlaceOut[nOut]
    "Are the output places discrete or continuous? true=discrete";
  Boolean enableIn[nIn] "Is the transition enabled by input places?";
  Boolean enableOut[nOut] "Is the transition enabled by output places?";
  Boolean tokenInOut[nIn] "Have the tokens of input places changed?";
  //****BLOCKS BEGIN****// since no events are generated within functions!!!
  //activation process
  Blocks.activationDis activation(testValue=testValue, testValueInt=testValueInt, normalArc=normalArc, nIn=nIn, nOut=nOut, tIn=tIn, tOut=tOut, tIntIn=tIntIn, tIntOut=tIntOut, arcType=arcType, arcWeightIn=arcWeightIn, arcWeightIntIn=arcWeightIntIn, arcWeightOut=arcWeightOut, arcWeightIntOut=arcWeightIntOut, minTokens=minTokens, maxTokens=maxTokens, minTokensInt=minTokensInt, maxTokensInt=maxTokensInt, firingCon=firingCon, disPlaceIn=disPlaceIn, disPlaceOut=disPlaceOut);
  //Is the transition enabled by all input places?
  Boolean enabledByInPlaces = Functions.OddsAndEnds.allTrue(enableIn);
  //Is the transition enabled by all output places?
  Boolean enabledByOutPlaces = Functions.OddsAndEnds.allTrue(enableOut);
  //Has at least one input place changed its tokens?
  Blocks.anyTrue tokenChange(vec=tokenInOut);
  //****BLOCKS END****//
public
  Boolean active "Is the transition active?";
  Boolean fire "Does the transition fire?";
  PNlib.Interfaces.TransitionIn inPlaces[nIn](
    each active=delayPassed,
    arcWeight=arcWeightIn,
    arcWeightint=arcWeightIntIn,
    each fire=fire,
    each disTransition=true,
    each instSpeed=0,
    each prelimSpeed=0,
    each maxSpeed=0,
    t=tIn,
    tint=tIntIn,
    arcType=arcType,
    minTokens=minTokens,
    minTokensint=minTokensInt,
    disPlace=disPlaceIn,
    enable=enableIn,
    tokenInOut=tokenInOut,
    testValue=testValue,
    testValueint=testValueInt,
    normalArc=normalArc) if nIn > 0 "connector for input places" annotation(Placement(transformation(extent={{-56, -10}, {-40, 10}}, rotation=0)));

  PNlib.Interfaces.TransitionOut outPlaces[nOut](
    each active=delayPassed,
    arcWeight=arcWeightOut,
    arcWeightint=arcWeightIntOut,
    each fire=fire,
    each enabledByInPlaces=enabledByInPlaces,
    each disTransition=true,
    each instSpeed=0,
    each prelimSpeed=0,
    each maxSpeed=0,
    t=tOut,
    tint=tIntOut,
    maxTokens=maxTokens,
    maxTokensint=maxTokensInt,
    disPlace=disPlaceOut,
    enable=enableOut) if nOut > 0 "connector for output places" annotation(Placement(transformation(extent={{40, -10}, {56, 10}}, rotation=0)));
equation
  //****MAIN BEGIN****//
  //reset active when delay passed
  active = activation.active and not pre(delayPassed);
  //delay passed?
  delayPassed = active and time  >= putFireTime;
  //firing process
  fire=if nOut==0 then enabledByInPlaces else enabledByOutPlaces;
  //****MAIN END****//
  //****ANIMATION BEGIN****//
  when fire then
     fireTime=time;
     ani=true;
   end when;
   color=if (fireTime+settings.timeFire>=time and settings.animateTransition==1 and ani) then {255, 255, 0} else {0, 0, 0};
   //****ANIMATION END****//
   //****ERROR MESSENGES BEGIN****//
    for i in 1:nIn loop
      if disPlaceIn[i] then
        arcWeightIntIn[i]=integer(arcWeightIn[i]);
      else
        arcWeightIntIn[i]=1;
      end if;
      assert((disPlaceIn[i] and arcWeightIn[i]-arcWeightIntIn[i]<=0.0) or not disPlaceIn[i], "Input arcs connected to discrete places must have integer weights.");
      assert(arcWeightIn[i]>=0, "Input arc weights must be positive.");
   end for;
   for i in 1:nOut loop
      if disPlaceOut[i] then
        arcWeightIntOut[i]=integer(arcWeightOut[i]);
      else
        arcWeightIntOut[i]=1;
      end if;
      assert((disPlaceOut[i] and arcWeightOut[i]-arcWeightIntOut[i]<=0.0) or not disPlaceOut[i], "Output arcs connected to discrete places must have integer weights.");
      assert(arcWeightOut[i]>=0, "Output arc weights must be positive.");
   end for;
   //****ERROR MESSENGES END****//
algorithm
   //****MAIN BEGIN****//
  //generate random putative fire time according to Next-Reaction method of Gibson and Bruck
  when active then    //17.06.11 Reihenfolge getauscht!
    (r128, state128) := Modelica.Math.Random.Generators.Xorshift128plus.random(pre(state128));
    putFireTime :=  if distributionType==PNlib.Types.DistributionType.Exponential then time + PNlib.Functions.Random.randomexp(h, r128) else time +PNlib.Functions.Random.randomtriangular(a, b, c, r128);
  end when;
   //****MAIN END****//
initial equation
  //to initialize the random generator otherwise the first random number is always the same in every simulation run
    putFireTime = if distributionType==PNlib.Types.DistributionType.Exponential then time + PNlib.Functions.Random.randomexp(h, r128) else time +PNlib.Functions.Random.randomtriangular(a, b, c, r128);
initial algorithm
  // Generate initial state from localSeed and globalSeed
  state128 := Modelica.Math.Random.Generators.Xorshift128plus.initialState(localSeed, settings.globalSeed);
  (r128, state128) := Modelica.Math.Random.Generators.Xorshift128plus.random(
      state128);
  annotation(defaultComponentName = "T1", Icon(graphics={Rectangle(
          extent={{-40, 100}, {40, -100}},
          lineColor={0, 0, 0},
          fillColor=DynamicSelect({0, 0, 0}, color),
          fillPattern=FillPattern.Solid),
      Polygon(
        points={{-40, 48}, {40, 74}, {-40, 8}, {-40, 10}, {-40, 6}, {-40, 8}, {-40, 48}},
        lineColor={0, 0, 0},
        smooth=Smooth.None,
        fillColor={255, 255, 255},
        fillPattern=FillPattern.Solid),
        Text(
          extent={{-2, -112}, {-2, -140}},
          lineColor={0, 0, 0},
          textString=DynamicSelect(" ", if animateHazardFunc==1 then "h="+realString(h, 1, 2) else " ")),
        Text(
          extent={{6, -152}, {6, -180}},
          lineColor={0, 0, 0},
          textString=DynamicSelect(" ", if animatePutFireTime==1 then "pt="+realString(putFireTime, 1, 2) else " ")),
                                          Text(
          extent={{-4, 139}, {-4, 114}},
          lineColor={0, 0, 0},
          textString="%name")}));
end TS;
