within PNlib;
model TFDS "Stochastic Transition"
  //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing=true));
  parameter Integer distributionType=1
    "distribution type of duration" annotation(Dialog(enable = true, group = "Distribution"), choices(choice=1
        "Exponential distribution", choice=2 "Triangular distribution", __Dymola_radioButtons=true));
  Real h=1
    "probability density" annotation(Dialog(enable = if distributionType==1 then true else false, group = "Exponential distribution"));
  Real a=0
    "Lower limit" annotation(Dialog(enable = if distributionType==2 then true else false, group = "Triangular distribution"));
  Real b=1
    "Upper Limit" annotation(Dialog(enable = if distributionType==2 then true else false, group = "Triangular distribution"));
  Real c=0.5
    "Most likely value" annotation(Dialog(enable = if distributionType==2 then true else false, group = "Triangular distribution"));
  Real arcWeightIn[nIn]=fill(1, nIn) "arc weights of input places"
                                         annotation(Dialog(enable = true, group = "Arc Weights"));
  Real arcWeightOut[nOut]=fill(1, nOut) "arc weights of output places"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
  Boolean firingCon=true "additional firing condition" annotation(Dialog(enable = true, group = "Firing Condition"));
  //****MODIFIABLE PARAMETERS AND VARIABLES END****//
  discrete Real putDuration "putative firing time";
  Integer showTransitionName=settings.showTransitionName
    "only for transition animation and display (Do not change!)";
  Integer animateputDuration=settings.showDelay
    "only for transition animation and display (Do not change!)";
  Integer animateHazardFunc=settings.animateHazardFunc
    "only for transition animation and display (Do not change!)";
  Real color[3] "only for transition animation and display (Do not change!)";
  parameter Integer localSeed = PNlib.Functions.Random.counter() "Local seed to initialize random number generator" annotation(Dialog(enable = true, group = "Random Number Generator"));
protected
  discrete Integer state128[4] "state of random number generator";
  Real r128 "random number";
  outer PNlib.Settings settings "global settings for animation and display";
  Real firingTimeIn "next putative firing time";
  Real firingTimeOut "next putative firing time";
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
  Integer arcType[nIn]
    "type of input arcs 1=normal, 2=test arc, 3=inhibitor arc, 4=read arc";
  Integer testValueInt[nIn]
    "Integer test values of input arcs (for generating events!)";
  Integer normalArc[nIn]
    "1=no, 2=yes, i.e. double arc: test and normal arc or inhibitor and normal arc";
  Boolean durationPassedIn(start=false, fixed=true) "Is the duration passed?";
  Boolean durationPassedOut(start=false, fixed=true) "Is the duration passed?";
  Boolean ani "for transition animation";
  Boolean prefire( start=false, fixed=true) "Was the Transition fire?";
  Boolean disPlaceIn[nIn]
    "Are the input places discrete or continuous? true=discrete";
  Boolean disPlaceOut[nOut]
    "Are the output places discrete or continuous? true=discrete";
  Boolean enableIn[nIn] "Is the transition enabled by input places?";
  Boolean enableOut[nOut] "Is the transition enabled by output places?";
  Boolean tokenInOut[nIn] "Have the tokens of input places changed?";
  //****BLOCKS BEGIN****// since no events are generated within functions!!!
  //activation process
  Blocks.activationDisIn activationIn(testValue=testValue, testValueInt=testValueInt, normalArc=normalArc, nIn=nIn, tIn=tIn, tIntIn=tIntIn, arcType=arcType, arcWeightIn=arcWeightIn, arcWeightIntIn=arcWeightIntIn, minTokens=minTokens, minTokensInt=minTokensInt, firingCon=firingCon, disPlaceIn=disPlaceIn);
  Blocks.activationDisOut activationOut(nOut=nOut, tOut=tOut, tIntOut=tIntOut, arcWeightOut=arcWeightOut, arcWeightIntOut=arcWeightIntOut, maxTokens=maxTokens, maxTokensInt=maxTokensInt, firingCon=firingCon, disPlaceOut=disPlaceOut);
  //Is the transition enabled by all input places?
  Boolean enabledByInPlaces = Functions.OddsAndEnds.allTrue(enableIn);
  //Is the transition enabled by all output places?
  Boolean enabledByOutPlaces = Functions.OddsAndEnds.allTrue(enableOut);
  //Has at least one input place changed its tokens?
  Blocks.anyTrue tokenChange(vec=tokenInOut);
  //****BLOCKS END****//
public
  Boolean activeIn "Is the transition Input active?";
  Boolean activeOut "Is the transition Output active?";
  Boolean fireIn "Does the transition Input fire?";
  Boolean fireOut "Does the transition Output fire?";
  Boolean fire( start=false, fixed=true) "Is the Transition fire?";
  PNlib.Interfaces.TransitionIn inPlaces[nIn](
    each active=durationPassedIn,
    arcWeight=arcWeightIn,
    arcWeightint=arcWeightIntIn,
    each fire=fireIn,
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
    each active=durationPassedOut,
    arcWeight=arcWeightOut,
    arcWeightint=arcWeightIntOut,
    each fire=fireOut,
    each enabledByInPlaces=true,
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
   //reset active when duration passed
   activeIn = activationIn.active  and not pre(durationPassedIn) and not prefire;
   activeOut = activationOut.active and not pre(durationPassedOut) and prefire;
   //save next putative firing time
   when activeIn then
      firingTimeIn = time+1e-6;
   end when;
   when activeOut then
      firingTimeOut = if time>=firingTimeIn+putDuration-1e-6  then time+1e-6 else firingTimeIn+putDuration-1e-6;
   end when;
   //is the Transition fire?
   prefire=pre(fire);
   when {durationPassedIn, durationPassedOut} then
    if durationPassedOut then
      fire=false;
    else
      fire=true;
    end if;
   end when;
  //duration passed?
   durationPassedIn= activeIn and time>=firingTimeIn;
   durationPassedOut= activeOut and time>=firingTimeOut;
   //firing process
   fireIn=enabledByInPlaces;
   fireOut=enabledByOutPlaces;
  //****MAIN END****//
  //****ANIMATION BEGIN****//
  when fireIn then
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
  when activeIn then    //17.06.11 Reihenfolge getauscht!
    (r128, state128) := Modelica.Math.Random.Generators.Xorshift128plus.random(pre(state128));
    putDuration :=  if distributionType==1 then PNlib.Functions.Random.randomexp(h, r128) else PNlib.Functions.Random.randomtriangular(a, b, c, r128);
  end when;
   //****MAIN END****//
initial equation
  //to initialize the random generator otherwise the first random number is always the same in every simulation run
    putDuration = if distributionType==1 then PNlib.Functions.Random.randomexp(h, r128) else PNlib.Functions.Random.randomtriangular(a, b, c, r128);
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
          textString=DynamicSelect(" ", if animateputDuration==1 then "pt="+realString(putDuration, 1, 2) else " ")),
                                          Text(
          extent={{-4, 139}, {-4, 114}},
          lineColor={0, 0, 0},
          textString="%name")}));
end TFDS;