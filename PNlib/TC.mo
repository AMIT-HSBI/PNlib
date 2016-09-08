within PNlib;
model TC "Continuous Transition"
  parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing=true));
  //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  Real maximumSpeed=1 "maximum speed"  annotation(Dialog(enable = true, group = "Maximum Speed"));
  Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input places"
                                         annotation(Dialog(enable = true, group = "Arc Weights"));
  Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output places"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
  Boolean firingCon=true "additional firing condition" annotation(Dialog(enable = true, group = "Firing Condition"));
  //****MODIFIABLE PARAMETERS AND VARIABLES END****//
  Boolean fire "Does the transition fire?";
  Real instantaneousSpeed "instantaneous speed";
  Real actualSpeed = if fire then instantaneousSpeed else 0.0;
  Integer showTransitionName=settings.showTransitionName
    "only for transition animation and display (Do not change!)";
  Integer animateSpeed=settings.animateSpeed
    "only for transition animation and display (Do not change!)";
  Real color[3] "only for transition animation and display (Do not change!)";
protected
  outer PNlib.Settings settings "global settings for animation and display";
  Real prelimSpeed=preliminarySpeed.prelimSpeed "preliminary speed";
  Real tIn[nIn] "tokens of input places";
  Real tOut[nOut] "tokens of output places";
  Real minTokens[nIn] "minimum tokens of input places";
  Real maxTokens[nOut] "maximum tokens of output places";
  Real speedSumIn[nIn] "Input speeds of continuous input places";
  Real speedSumOut[nOut] "Output speeds of continuous output places";
  Real decreasingFactorIn[nIn] "decreasing factors of input places";
  Real decreasingFactorOut[nOut] "decreasing factors of output places";
  Real testValue[nIn] "test values of test or inhibitor arcs";
  Integer arcType[nIn]
    "type of input arcs 1=normal, 2=test arc, 3=inhibitor arc, 4=read arc";
  Integer arcWeightIntIn[nIn]
    "Integer arc weights of discrete input places (for generating events!)";
  Integer arcWeightIntOut[nOut]
    "Integer arc weights of discrete output places (for generating events!)";
  Integer minTokensInt[nIn]
    "Integer minimum tokens of input places (for generating events!)";
  Integer maxTokensInt[nOut]
    "Integer maximum tokens of output places (for generating events!)";
  Integer tIntIn[nIn] "integer tokens of input places (for generating events!)";
  Integer tIntOut[nOut]
    "integer tokens of output places (for generating events!)";
  Integer testValueInt[nIn]
    "Integer test values of input arcs (for generating events!)";
  Integer normalArc[nIn]
    "1=no,2=yes, i.e. double arc: test and normal arc or inhibitor and normal arc";
  Boolean fed[nIn] "Are the input places fed by their input transitions?";
  Boolean emptied[nOut]
    "Are the output places emptied by their output transitions?";
  Boolean disPlaceIn[nIn] "Are the input places discrete?";
  Boolean disPlaceOut[nOut] "Are the output places discrete?";
  Boolean enableIn[nIn]
    "Is the transition enabled by all its discrete input transitions?";
  //****BLOCKS BEGIN****// since no events are generated within functions!!!
  //activation process
  Blocks.activationCon activation(testValue=testValue, testValueInt=testValueInt, normalArc=normalArc,nIn=nIn,nOut=nOut,tIn=tIn,tOut=tOut,tIntIn=tIntIn,tIntOut=tIntOut,arcType=arcType,arcWeightIn=arcWeightIn,arcWeightOut=arcWeightOut,arcWeightIntIn=arcWeightIntIn,arcWeightIntOut=arcWeightIntOut,minTokens=minTokens,maxTokens=maxTokens,minTokensInt=minTokensInt,maxTokensInt=maxTokensInt,firingCon=firingCon,fed=fed,emptied=emptied,disPlaceIn=disPlaceIn,disPlaceOut=disPlaceOut);
  //preliminary speed calculation
  PNlib.Blocks.preliminarySpeed  preliminarySpeed(nIn=nIn,nOut=nOut,arcWeightIn=arcWeightIn,arcWeightOut=arcWeightOut,speedSumIn=speedSumIn,speedSumOut=speedSumOut,maximumSpeed=maximumSpeed,weaklyInputActiveVec=activation.weaklyInputActiveVec,weaklyOutputActiveVec=activation.weaklyOutputActiveVec);
  //firing process
  Boolean fire_ = Functions.OddsAndEnds.allTrue(/* hack for Dymola 2017 */ Functions.OddsAndEnds.boolOr(enableIn, not disPlaceIn));
  //****BLOCKS END****//
public
  Interfaces.TransitionIn[nIn] inPlaces(each active=activation.active,
   each fire=fire,
   arcWeight=arcWeightIn,
   arcWeightint=arcWeightIntIn,
   each disTransition = false,
   each instSpeed = instantaneousSpeed,
   each prelimSpeed = prelimSpeed,
   each maxSpeed =  maximumSpeed,
   t=tIn,
   tint=tIntIn,
   arcType=arcType,
   minTokens=minTokens,
   minTokensint=minTokensInt,
   fed=fed,
   disPlace=disPlaceIn,
   enable=enableIn,
   speedSum=speedSumIn,
   decreasingFactor=decreasingFactorIn,
   testValue=testValue,
   testValueint=testValueInt,
   normalArc=normalArc) "connector for input places"  annotation (Placement(transformation(extent={{ -56,-10},{-40,10}}, rotation=0)));
  Interfaces.TransitionOut[nOut] outPlaces(each active=activation.active,
  each fire=fire,
  each enabledByInPlaces = true,
  arcWeight=arcWeightOut,
  arcWeightint=arcWeightIntOut,
  each disTransition = false,
  each instSpeed = instantaneousSpeed,
  each prelimSpeed = prelimSpeed,
  each maxSpeed =  maximumSpeed,
  t=tOut,
  tint=tIntOut,
  maxTokens=maxTokens,
  maxTokensint=maxTokensInt,
  emptied=emptied,
  disPlace=disPlaceOut,
  speedSum=speedSumOut,decreasingFactor=decreasingFactorOut)
    "connector for output places"                                                          annotation (Placement(transformation(extent={{40,-10},{56,10}}, rotation=0)));
equation
   //****MAIN BEGIN****//
    //firing process
   fire=fire_ and activation.active and not maximumSpeed<=0;
   //instantaneous speed calculation
   instantaneousSpeed=min(min(min(decreasingFactorIn),min(decreasingFactorOut))*maximumSpeed,prelimSpeed);
  //****MAIN END****//
   //****ANIMATION BEGIN****//
   color=if (fire and settings.animateTransition==1) then {255,255,0} else {255,255,255};
   //****ANIMATION END****//
   //****ERROR MESSENGES BEGIN****//  hier noch Message gleiches Kantengewicht und auch Kante dis Place!!
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

annotation (defaultComponentName = "T1",Icon(graphics={Rectangle(
          extent={{-40,100},{40,-100}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255}, color),
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-2,-116},{-2,-144}},
          lineColor={0,0,0},
          textString=DynamicSelect(" ",if animateSpeed==1 and fire>0.5 then if instantaneousSpeed>0 then realString(instantaneousSpeed,1,2) else "0.0" else " ")),
                                          Text(
          extent={{-4,139},{-4,114}},
          lineColor={0,0,0},
          textString="%name")}));
end TC;
