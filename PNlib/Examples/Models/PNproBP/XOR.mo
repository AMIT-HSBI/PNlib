within PNlib.Examples.Models.PNproBP;
model XOR
 parameter Real upperProb=0.5;
 parameter Real lowerProb=0.5;
 Real arcWeightOut1=1 "arc weights of output place"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
 Real arcWeightOut2=1 "arc weights of output place"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
  TD T1(
    nIn=1,
    nOut=1,
    arcWeightOut={arcWeightOut1},
    delay=0.0001)
             annotation (Placement(transformation(extent={{-18,30},{2,50}})));
  TD T2(
    nIn=1,
    nOut=1,
    arcWeightOut={arcWeightOut2},
    delay=0.0001)
             annotation (Placement(transformation(extent={{-18,-50},{2,-30}})));
  PD P1(
    nIn=1,
    nOut=2,
    enablingType=2,
    enablingProbOut={upperProb,lowerProb},
    maxTokens=1)
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  TD T3(
    nOut=1,
    nIn=1,
    delay=0.0001)
           annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
  Interfaces.TransitionIn inPlaces1
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Interfaces.TransitionOut outPlaces1
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Interfaces.TransitionOut outPlaces2
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  Boolean fire "firability of continuous transition";
  Integer fireColor[3] "for animation";
   Boolean ani "for transition animation";
protected
  outer Settings settings1 "global settings for animation and display";
  discrete Real fireTime;
equation
  fire=T1.fire or T2.fire;
  when fire then
     fireTime=time;
     ani=true;
  end when;
  fireColor=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {85,170,255};
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation (Line(
      points={{-73.2,0},{-68,0},{-62.8,0}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T3.inPlaces[1], inPlaces1) annotation (Line(
      points={{-82.8,0},{-110,0}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation (Line(
      points={{-41.2,-0.5},{-26,-0.5},{-26,40},{-12.8,40}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P1.outTransition[2], T2.inPlaces[1]) annotation (Line(
      points={{-41.2,0.5},{-26,0.5},{-26,-40},{-12.8,-40}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T1.outPlaces[1], outPlaces1) annotation (Line(
      points={{-3.2,40},{-3.2,40},{110,40}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T2.outPlaces[1], outPlaces2) annotation (Line(
      points={{-3.2,-40},{-3.2,-40},{110,-40}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  annotation (Diagram(graphics), Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={170,255,255}),                                Text(
          extent={{-28,12},{-28,-12}},
          lineColor={0,0,0},
          textString="XOR"),              Text(
          extent={{56,51},{56,26}},
          lineColor={0,0,0},
          textString="%upperProb"),       Text(
          extent={{58,-29},{58,-54}},
          lineColor={0,0,0},
          textString="%lowerProb"),       Text(
          extent={{-4,137},{-4,118}},
          lineColor={0,0,0},
          textString="%name")}));
end XOR;
