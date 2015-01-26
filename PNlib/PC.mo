within PNlib;
model PC "Continuous Place"
  Real t=if t_<0 then 0 else t_ "marking";
  parameter Integer nIn=0 "number of input transitions" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut=0 "number of output transitions" annotation(Dialog(connectorSizing=true));
   //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
  parameter Real startMarks = 0 "start marks"  annotation(Dialog(enable = true, group = "Marks"));
  parameter Real minMarks = 0 "minimum capacity" annotation(Dialog(enable = true, group = "Marks"));
  parameter Real maxMarks=PNlib.Constants.inf "maximum capacity"       annotation(Dialog(enable = true, group = "Marks"));
   Boolean reStart=false "restart condition"       annotation(Dialog(enable = true, group = "Marks"));
  parameter Real reStartMarks=0 "number of marks at restart"       annotation(Dialog(enable = true, group = "Marks"));
  parameter Integer N=settings1.N "N+1=amount of levels" annotation(Dialog(enable = true, group = "Level Concentrations"));
  parameter Integer enablingType=1
    "resolution type of actual conflict (type-1-conflict)"                                annotation(Dialog(enable = true, group = "Enabling"),choices(choice=1
        "Priority",    choice=2 "Probability",__Dymola_radioButtons=true));
  parameter Real enablingProbIn[nIn]=fill(1/nIn,nIn)
    "enabling probabilities of input transitions" annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
  parameter Real enablingProbOut[nOut]=fill(1/nOut,nOut)
    "enabling probabilities of output transitions" annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
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
  Real disMarkChange "discrete mark change";
  Real conMarkChange "continuous mark change";
  Real arcWeightIn[nIn] "weights of input arcs";
  Real arcWeightOut[nOut] "weights of output arcs";
  Real instSpeedIn[nIn] "instantaneous speed of input transitions";
  Real instSpeedOut[nOut] "instantaneous speed of output transitions";
  Real maxSpeedIn[nIn] "maximum speed of input transitions";
  Real maxSpeedOut[nOut] "maximum speed of output transitions";
  Real prelimSpeedIn[nIn] "preliminary speed of input transitions";
  Real prelimSpeedOut[nOut] "preliminary speed of output transitions";
  Real tokenscale "only for place animation and display";
  Real t_(start=startMarks, fixed=true) "marking";
  Boolean disMarksInOut "discrete marks change";
  Boolean preFireIn[nIn] "pre-value of fireIn";
  Boolean preFireOut[nOut] "pre-value of fireOut";
  Boolean fireIn[nIn] "Does any input transition fire?";
  Boolean fireOut[nOut] "Does any output transition fire?";
  Boolean disTransitionIn[nIn] "Are the input transitions discrete?";
  Boolean disTransitionOut[nOut] "Are the output transitions discrete?";
  Boolean activeIn[nIn] "Are the input transitions active?";
  Boolean activeOut[nOut] "Are the output transitions active?";
  Boolean enabledByInPlaces[nIn]
    "Are the input transitions enabled by all their input places?";
  //****BLOCKS BEGIN****// since no events are generated within functions!!!
  //enabling discrete transitions
  Blocks.enablingInCon enableIn(active=activeIn,delayPassed=delayPassedIn.anytrue,nIn=nIn,arcWeight=arcWeightIn, t=t_, maxMarks=maxMarks,TAein=enabledByInPlaces,enablingType=enablingType, enablingProb=enablingProbIn,disTransition=disTransitionIn);
  Blocks.enablingOutCon enableOut(delayPassed=delayPassedOut.anytrue, nOut=nOut,arcWeight=arcWeightOut, t_=t_, minMarks=minMarks, TAout=activeOut, enablingType=enablingType, enablingProb=enablingProbOut,disTransition=disTransitionOut);
  //Does any delay passed of a connected transition?
  Blocks.anyTrue delayPassedOut(vec=activeOut and disTransitionOut);
  Blocks.anyTrue delayPassedIn(vec=activeIn and disTransitionIn);
  //Does any discrete transition fire?
  Blocks.anyTrue disMarksOut(vec=fireOut and disTransitionOut);
  Blocks.anyTrue disMarksIn(vec=fireIn and disTransitionIn);
  //Is the place fed by input transitions?
  Blocks.anyTrue feeding(vec=preFireIn and not disTransitionIn);
  //Is the place emptied by output transitions?"
  Blocks.anyTrue emptying(vec=preFireOut and not disTransitionOut);
  //firing sum calculation
  Blocks.firingSumCon firingSumIn(fire=preFireIn,arcWeight=arcWeightIn,instSpeed=instSpeedIn,disTransition=disTransitionIn);
  Blocks.firingSumCon firingSumOut(fire=preFireOut,arcWeight=arcWeightOut,instSpeed=instSpeedOut,disTransition=disTransitionOut);
  //decreasing factor calculation
  Blocks.decreasingFactor decreasingFactor(nIn=nIn,nOut=nOut,t=t_,minMarks=minMarks,maxMarks=maxMarks,speedIn= firingSumIn.conFiringSum,speedOut= firingSumOut.conFiringSum,maxSpeedIn=maxSpeedIn,maxSpeedOut=maxSpeedOut,prelimSpeedIn=prelimSpeedIn,prelimSpeedOut=prelimSpeedOut,arcWeightIn=arcWeightIn,arcWeightOut=arcWeightOut,firingIn=fireIn and not disTransitionIn,firingOut=fireOut and not disTransitionOut);
  //****BLOCKS END****//
public
  Interfaces.PlaceIn inTransition[nIn](each t=t_,
  each tint=1,
  each maxTokens=maxMarks,
  each maxTokensint=1,
  enable=enableIn.TEin_,
  each emptied = emptying.anytrue,
  decreasingFactor = decreasingFactor.decFactorIn,
  each disPlace =  false,
  each speedSum= firingSumOut.conFiringSum,
  fire=fireIn,
  disTransition=disTransitionIn,
  active=activeIn,
  arcWeight=arcWeightIn,
  instSpeed=instSpeedIn,
  maxSpeed=maxSpeedIn,
  prelimSpeed=prelimSpeedIn,
  enabledByInPlaces=enabledByInPlaces) "connector for input transitions"  annotation (Placement(
        transformation(extent={{-114,-10},{-98,10}}, rotation=0),
    iconTransformation(extent={{-116,-10},{-100,10}})));
  Interfaces.PlaceOut outTransition[nOut](each t = t_,
  each tint=1,
  each minTokens=minMarks,
  each minTokensint=1,
  enable=enableOut.TEout_,
  each fed=feeding.anytrue,
  decreasingFactor=decreasingFactor.decFactorOut,
  each disPlace=false,
  each arcType=1,
  each speedSum=firingSumIn.conFiringSum,
  each tokenInOut=pre(disMarksInOut),
  fire=fireOut,
  disTransition=disTransitionOut,
  active=activeOut,
  arcWeight=arcWeightOut,
  instSpeed=instSpeedOut,
  maxSpeed=maxSpeedOut,
  prelimSpeed=prelimSpeedOut,
  each testValue=-1,
  each testValueint=-1,
  each normalArc=2) "connector for output transitions"  annotation (Placement(
        transformation(extent={{100,-10},{116,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput pc_t=t
    "connector for Simulink connection"                                            annotation (Placement(
        transformation(extent={{-36,68},{-16,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,108})));
equation
  //****MAIN END****//
  //calculation of continuous mark change
  conMarkChange=firingSumIn.conFiringSum-firingSumOut.conFiringSum;
  der(t_)=conMarkChange;
  //calculation of discrete mark change
  disMarkChange=firingSumIn.disFiringSum-firingSumOut.disFiringSum;
  disMarksInOut=disMarksOut.anytrue or disMarksIn.anytrue;
  when {disMarksInOut, reStart} then
    reinit(t_, if reStart then reStartMarks else t_ + disMarkChange);
  end when;
  //Conversion of tokens to level concentrations
  levelCon=t*settings1.M/N;
  for i in 1:nOut loop
    preFireOut[i]=if disTransitionOut[i] then fireOut[i] else pre(fireOut[i]);
  end for;
  for i in 1:nIn loop
    preFireIn[i]= if disTransitionIn[i] then fireIn[i] else pre(fireIn[i]);
  end for;
  //****MAIN END****//
  //****ANIMATION BEGIN****//
  //scaling of tokens for animation
  tokenscale= t*settings1.scale;
  color=if settings1.animatePlace==1 then if tokenscale<100 then {255,255-2.55*tokenscale,255-2.55*tokenscale} else {255,0,0} else {255,255,255};
  //****ANIMATION END****//
  //****ERROR MESSENGES BEGIN****//
  assert(abs(sum(enablingProbIn)-1)<1e-6 or nIn==0 or enablingType==1,"The sum of input enabling probabilities has to be equal to 1");
  assert(abs(sum(enablingProbOut)-1)<1e-6 or nOut==0 or enablingType==1,"The sum of output enabling probabilities has to be equal to 1");
  assert(startMarks>=minMarks and startMarks<=maxMarks,"minMarks<=startMarks<=maxMarks");
  //****ERROR MESSENGES END****//
   annotation (defaultComponentName = "P1",Icon(graphics={
        Ellipse(
          extent={{-100,98},{100,-96}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-88,86},{88,-86}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255},color),
          fillPattern=FillPattern.Solid),
      Text(
        extent={{-1.5,25.5},{-1.5,-21.5}},
        lineColor={0,0,0},
        origin={0.5,-0.5},
        rotation=0,
        textString=DynamicSelect("%startMarks",if animateMarking==1 then if t>0 then realString(t,1,2) else "0.0" else " ")),
        Text(
          extent={{-90,130},{-90,116}},
          lineColor={0,0,0},
          textString=DynamicSelect(" ",if showCapacity==1 then if maxMarks>1e+30 then  "[%minMarks, inf]" else "[%minMarks, %maxMarks]" else " ")),
                                          Text(
          extent={{-74,-103},{-74,-128}},
          lineColor={0,0,0},
          textString="%name")}),
  Diagram(graphics));
end PC;
