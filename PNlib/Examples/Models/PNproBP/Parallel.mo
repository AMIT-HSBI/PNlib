within PNlib.Examples.Models.PNproBP;
model Parallel
  parameter Real delay=1;
  parameter Real noParallel=2;
  Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input place"  annotation(Dialog(enable = true, group = "Arc Weights"));

  Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output place"
                                     annotation(Dialog(enable = true, group = "Arc Weights"));
  parameter Integer nIn=0 "number of input places" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut=0 "number of output places" annotation(Dialog(connectorSizing=true));
  Boolean fire "firability of continuous transition";
  Integer fireColor[3] "for animation";
  TD T1(
    delay=delay,
    nIn=1,
    nOut=1) annotation (Placement(transformation(extent={{2,74},{22,94}})));
  TD puffern(
    nOut=1,
    nIn=nIn,
    arcWeightIn=arcWeightIn,
    delay=0.001)
             annotation (Placement(transformation(extent={{-100,4},{-80,24}})));
  PD Puffer(nIn=1, nOut=6)
    annotation (Placement(transformation(extent={{-70,4},{-50,24}})));
  TD T2(
    delay=delay,
    nIn=1,
    nOut=1,
    firingCon=noParallel > 1)
           annotation (Placement(transformation(extent={{2,40},{22,60}})));
  TD T3(
    delay=delay,
    nIn=1,
    nOut=1,
    firingCon=noParallel > 2)
            annotation (Placement(transformation(extent={{2,6},{22,26}})));
  TD T4(
    delay=delay,
    nIn=1,
    nOut=1,
    firingCon=noParallel > 3)
            annotation (Placement(transformation(extent={{2,-28},{22,-8}})));
  TD T5(
    delay=delay,
    nIn=1,
    nOut=1,
    firingCon=noParallel > 4)
            annotation (Placement(transformation(extent={{2,-62},{22,-42}})));
  TD T6(
    delay=delay,
    nIn=1,
    nOut=1,
    firingCon=noParallel > 5)
            annotation (Placement(transformation(extent={{2,-96},{22,-76}})));
  Interfaces.TransitionIn inPlaces1[nIn]
    annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
  PD P1(nIn=6, nOut=1)
    annotation (Placement(transformation(extent={{46,0},{66,20}})));
  TD T7(
    nOut=nOut,
    nIn=1,
    arcWeightOut=arcWeightOut,
    delay=0.0001)
            annotation (Placement(transformation(extent={{70,0},{90,20}})));
  Interfaces.TransitionOut outPlaces1[nOut]
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Boolean ani "for transition animation";
protected
  outer Settings settings "global settings for animation and display";
  discrete Real fireTime;
equation
  fire=T1.fire or T2.fire or T3.fire or T4.fire or T5.fire or T6.fire;
  when fire then
     fireTime=time;
     ani=true;
  end when;
  fireColor=if (fireTime+settings.timeFire>=time and settings.animateTransition==1 and ani) then {255,255,0} else {128,255,0};

  connect(puffern.outPlaces[1], Puffer.inTransition[1]) annotation (Line(
      points={{-85.2,14},{-70.8,14}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[1], T1.inPlaces[1]) annotation (Line(
      points={{-49.2,13.1667},{-22,13.1667},{-22,84},{7.2,84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[2], T2.inPlaces[1]) annotation (Line(
      points={{-49.2,13.5},{-22,13.5},{-22,50},{7.2,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[3], T3.inPlaces[1]) annotation (Line(
      points={{-49.2,13.8333},{-22,13.8333},{-22,16},{7.2,16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[4], T4.inPlaces[1]) annotation (Line(
      points={{-49.2,14.1667},{-22,14.1667},{-22,-18},{7.2,-18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[5], T5.inPlaces[1]) annotation (Line(
      points={{-49.2,14.5},{-22,14.5},{-22,-52},{7.2,-52}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[6], T6.inPlaces[1]) annotation (Line(
      points={{-49.2,14.8333},{-22,14.8333},{-22,-86},{7.2,-86}},
      color={0,0,0},
      smooth=Smooth.None));
  for i in 1:nIn loop
    connect(puffern.inPlaces[i], inPlaces1[i]) annotation (Line(
      points={{-94.8,14},{-104,14},{-104,0},{-110,0}},
      color={0,0,0},
      smooth=Smooth.None));
  end for;
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation (Line(
      points={{16.8,84},{32,84},{32,9.16667},{45.2,9.16667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T2.outPlaces[1], P1.inTransition[2]) annotation (Line(
      points={{16.8,50},{32,50},{32,9.5},{45.2,9.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T3.outPlaces[1], P1.inTransition[3]) annotation (Line(
      points={{16.8,16},{32,16},{32,9.83333},{45.2,9.83333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T4.outPlaces[1], P1.inTransition[4]) annotation (Line(
      points={{16.8,-18},{32,-18},{32,10.1667},{45.2,10.1667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T5.outPlaces[1], P1.inTransition[5]) annotation (Line(
      points={{16.8,-52},{32,-52},{32,10.5},{45.2,10.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T6.outPlaces[1], P1.inTransition[6]) annotation (Line(
      points={{16.8,-86},{32,-86},{32,10.8333},{45.2,10.8333}},
      color={0,0,0},
      smooth=Smooth.None));
  for i in 1:nOut loop
    connect(T7.outPlaces[i], outPlaces1[i]) annotation (Line(
      points={{84.8,10},{98,10},{98,0},{110,0}},
      color={0,0,0},
      smooth=Smooth.None));
  end for;
  connect(P1.outTransition[1], T7.inPlaces[1]) annotation (Line(
      points={{66.8,10},{75.2,10}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(graphics), Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={128,255,0},
          fillColor=DynamicSelect({128,255,0},fireColor),
          fillPattern=FillPattern.HorizontalCylinder),
                                          Text(
          extent={{0,59},{0,42}},
          lineColor={0,0,0},
          textString="Parallel"),         Text(
          extent={{-4,137},{-4,118}},
          lineColor={0,0,0},
          textString="%name"),            Text(
          extent={{0,-15},{0,-32}},
          lineColor={0,0,0},
          textString=DynamicSelect("","d="+realString(delay,1,0)))}));
end Parallel;
