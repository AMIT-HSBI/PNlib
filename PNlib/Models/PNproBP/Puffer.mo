within PNlib.Models.PNproBP;
model Puffer
 parameter Real delay=1;
 parameter Integer nIn=0 "number of input places" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut=0 "number of output places" annotation(Dialog(connectorSizing=true));
  Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input place"  annotation(Dialog(enable = true, group = "Arc Weights"));

  Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output place"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
  TD T1(
    nIn=1,
    nOut=nOut,
    delay=delay,
    arcWeightOut=arcWeightOut)
             annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  PD P1(nIn=1, nOut=1)
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  TD T3(
    nOut=1,
    nIn=nIn,
    arcWeightIn=arcWeightIn,
    delay=0.0001)
             annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
  Interfaces.TransitionIn inPlaces1[nIn]
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  Interfaces.TransitionOut outPlaces1[nOut]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Boolean fire "firability of continuous transition";
  Integer fireColor[3] "for animation";
   Boolean ani "for transition animation";
protected
  outer Settings settings1 "global settings for animation and display";
  discrete Real fireTime;
equation
  fire=T1.fire;
  when fire then
     fireTime=time;
     ani=true;
  end when;
  fireColor=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {255,128,8};
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation (Line(
      points={{-73.2,0},{-54.8,0}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  for i in 1:nIn loop
    connect(T3.inPlaces[i], inPlaces1[i]) annotation (Line(
      points={{-82.8,0},{-110,0}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  end for;
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation (Line(
      points={{-33.2,0},{-33.2,0},{-12.8,0}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  for i in 1:nOut loop
    connect(T1.outPlaces[i], outPlaces1[i]) annotation (Line(
      points={{-3.2,0},{-3.2,0},{110,0}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  end for;
  annotation (Diagram(graphics), Icon(graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor=DynamicSelect({255,128,8},fireColor)),        Text(
          extent={{0,74},{0,42}},
          lineColor={0,0,0},
          textString="Puffer"),           Text(
          extent={{0,-51},{0,-76}},
          lineColor={0,0,0},
          textString="d=%delay"),         Text(
          extent={{0,9},{0,-16}},
          lineColor={0,0,0},
          textString="%name")}));
end Puffer;
