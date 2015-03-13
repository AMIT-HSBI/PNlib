within PNlib;
model PD "Discrete Place"
  discrete Integer t(start = startTokens) "marking";
  parameter Integer nIn=0 "number of input transitions" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut=0 "number of output transitions" annotation(Dialog(connectorSizing=true));
  //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  parameter Integer startTokens = 0 "start tokens"  annotation(Dialog(enable = true, group = "Tokens"));
  parameter Integer minTokens = 0 "minimum capacity" annotation(Dialog(enable = true, group = "Tokens"));
  parameter Integer maxTokens=PNlib.Constants.Integer_inf "maximum capacity"       annotation(Dialog(enable = true, group = "Tokens"));
  Boolean reStart=false "restart condition"       annotation(Dialog(enable = true, group = "Tokens"));
  parameter Integer reStartTokens=startTokens "number of tokens at restart"       annotation(Dialog(enable = true, group = "Tokens"));
  parameter Integer enablingType=1
    "resolution type of actual conflict (type-1-conflict)"                                annotation(Dialog(enable = true, group = "Enabling"),choices(choice=1
        "Priority",    choice=2 "Probability",__Dymola_radioButtons=true));
  parameter Real enablingProbIn[nIn]=fill(1/nIn,nIn)
    "enabling probabilities of input transitions" annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
  parameter Real enablingProbOut[nOut]=fill(1/nOut,nOut)
    "enabling probabilities of output transitions" annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
  parameter Integer N=settings1.N "N+1=amount of levels" annotation(Dialog(enable = true, group = "Level Concentrations"));
  //****MODIFIABLE PARAMETERS AND VARIABLES END****//
  Real levelCon
    "conversion of tokens to level concentration according to M and N of the settings box";
  Integer showPlaceName=settings1.showPlaceName
    "only for place animation and display (Do not change!)";
  Integer showCapacity=settings1.showCapacity
    "only for place animation and display (Do not change!)";
  Integer animateMarking=settings1.animateMarking
    "only for place animation and display (Do not change!)";
  Real color[3] "only for place animation and display (Do not change!)";
protected
  outer PNlib.Settings settings1 "global settings for animation and display";
  Real tokenscale "only for place animation and display";
  discrete Integer pret "pre marking";
  Integer arcWeightIn[nIn] "Integer weights of input arcs";
  Integer arcWeightOut[nOut] "Integer weights of output arcs";
  Boolean tokeninout "change of tokens?";
  Boolean fireIn[nIn] "Do input transtions fire?";
  Boolean fireOut[nOut] "Do output transitions fire?";
  Boolean disTransitionIn[nIn] "Are the input transitions discrete?";
  Boolean disTransitionOut[nOut] "Are the output transtions discrete?";
  Boolean activeIn[nIn] "Are delays passed of input transitions?";
  Boolean activeOut[nOut] "Are delay passed of output transitions?";
  Boolean enabledByInPlaces[nIn]
    "Are input transitions are enabled by all their input places?";
  //****BLOCKS BEGIN****// since no events are generated within functions!!!
  //change of activation of output transitions
  Blocks.anyChange activeConOut(vec=pre(activeOut) and not disTransitionOut);
  //Does any delay passed of a connected transition?
  Blocks.anyTrue delayPassedOut(vec=activeOut and disTransitionOut);
  Blocks.anyTrue delayPassedIn(vec=activeIn and disTransitionIn);
  //firing sum calculation
  Blocks.firingSumDis firingSumIn(fire=fireIn and disTransitionIn, arcWeight=arcWeightIn);
  Blocks.firingSumDis firingSumOut(fire=fireOut and disTransitionOut, arcWeight=arcWeightOut);
  //Enabling process
  Blocks.enablingOutDis enableOut(delayPassed=delayPassedOut.anytrue,activeCon=activeConOut.anychange,nOut=nOut,arcWeight=arcWeightOut, t=pret, minTokens=minTokens, TAout=activeOut,enablingType=enablingType,enablingProb=enablingProbOut,disTransition=disTransitionOut);
  Blocks.enablingInDis enableIn(delayPassed=delayPassedIn.anytrue,active=activeIn,nIn=nIn,arcWeight=arcWeightIn, t=pret, maxTokens=maxTokens, TAein=enabledByInPlaces,enablingType=enablingType,enablingProb=enablingProbIn,disTransition=disTransitionIn);
  //****BLOCKS END****//

public
  PNlib.Interfaces.PlaceIn inTransition[nIn](
  each t=pret,
  each tint=pret,
  each maxTokens=maxTokens,
  each maxTokensint=maxTokens,
  enable=enableIn.TEin_,
  each emptied=false,
  each decreasingFactor=1,
  each disPlace=true,
  each speedSum=0,
  fire=fireIn,
  disTransition=disTransitionIn,
  arcWeightint=arcWeightIn,
  active=activeIn,
  enabledByInPlaces=enabledByInPlaces) "connector for input transitions"
                       annotation (Placement(transformation(extent={{-114,-10},{-98,10}}, rotation=0),
    iconTransformation(extent={{-116,-10},{-100,10}})));
  PNlib.Interfaces.PlaceOut outTransition[nOut](
  each t=pret,
  each tint=pret,
  each minTokens=minTokens,
  each minTokensint=minTokens,
  enable=enableOut.TEout_,
  each fed=false,
  each decreasingFactor=1,
  each disPlace=true,
  each arcType=1,
  each speedSum=0,
  each tokenInOut=pre(tokeninout),
  fire=fireOut,
  disTransition=disTransitionOut,
  arcWeightint=arcWeightOut,
  active=activeOut,
  each testValue=-1,
  each testValueint=-1,
  each normalArc=2) "connector for output transitions"
                         annotation (Placement(transformation(extent={{100,-10},{116,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.IntegerOutput pd_t=t
    "connector for Simulink connection"                                               annotation (Placement(
        transformation(extent={{-36,68},{-16,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,106})));
equation
  //****MAIN BEGIN****//
  //recalculation of tokens
  pret=pre(t);
  tokeninout = firingSumIn.firingSum > 0 or firingSumOut.firingSum > 0;
  when tokeninout or pre(reStart) then
    t=if tokeninout then pret + firingSumIn.firingSum - firingSumOut.firingSum else reStartTokens;
  end when;
  //Conversion of tokens to level concentrations
  levelCon=t*settings1.M/N;
  //****MAIN END****//
  //****ANIMATION BEGIN****//
  tokenscale= t*settings1.scale;
  color=if settings1.animatePlace==1 then if tokenscale<100 then {255,255-2.55*tokenscale,255-2.55*tokenscale} else {255,0,0} else {255,255,255};
  //****ANIMATION END****//
  //****ERROR MESSENGES BEGIN****//
  assert(abs(sum(enablingProbIn)-1)<1e-6 or nIn==0 or enablingType==1,"The sum of input enabling probabilities has to be equal to 1");
  assert(abs(sum(enablingProbOut)-1)<1e-6 or nOut==0 or enablingType==1,"The sum of output enabling probabilities has to be equal to 1");
  assert(startTokens>=minTokens and startTokens<=maxTokens,"minTokens<=startTokens<=maxTokens");
  //****ERROR MESSENGES END****//
  annotation (defaultComponentName = "P1",Icon(graphics={Ellipse(
          extent={{-100,96},{100,-100}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255},color),
          fillPattern=FillPattern.Solid),
      Text(
        extent={{-1.5,25.5},{-1.5,-21.5}},
        lineColor={0,0,0},
        textString=DynamicSelect("%startTokens",if animateMarking==1 then realString(t,1,0) else " ")),
        Text(
          extent={{-90,130},{-90,116}},
          lineColor={0,0,0},
          textString=DynamicSelect(" ",if showCapacity==1 then if maxTokens>1073741822 then  "[%minTokens, inf]" else "[%minTokens, %maxTokens]" else " ")),
                                          Text(
          extent={{-74,-113},{-74,-138}},
          lineColor={0,0,0},
          textString="%name")}),
                           Diagram(graphics));
end PD;
