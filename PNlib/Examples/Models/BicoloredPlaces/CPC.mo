within PNlib.Examples.Models.BicoloredPlaces;
model CPC
  Real color[numColors] "marking";
  Real t = sum(color) "total marking";
  parameter Integer nIn=0 "number of input transitions" annotation(Dialog(connectorSizing=true));
  parameter Integer nOut=0 "number of output transitions" annotation(Dialog(connectorSizing=true));

  parameter Real startMarks[numColors] = fill(0, numColors) "start marks" annotation(Dialog(enable = true, group = "Marks"));
  parameter Real minMarks[numColors] = fill(0, numColors) "minimum capacity" annotation(Dialog(enable = true, group = "Marks"));
  parameter Real maxMarks[numColors] = fill(PNlib.Constants.inf, numColors) "maximum capacity" annotation(Dialog(enable = true, group = "Marks"));

  PNlib.Interfaces.PlaceIn[nIn, numColors] inTransition annotation(Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  PNlib.Interfaces.PlaceOut[nOut, numColors] outTransition annotation(Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Boolean animateMarking=settings.animateMarking "only for place animation and display (Do not change!)";
protected
  outer PNlib.Components.Settings settings "global settings for animation and display";
  PC place1(nIn=nIn, nOut=nOut, startMarks=startMarks[1], minMarks=minMarks[1], maxMarks=maxMarks[1]);
  PC place2(nIn=nIn, nOut=nOut, startMarks=startMarks[2], minMarks=minMarks[2], maxMarks=maxMarks[2]);
equation
  color = {place1.t, place2.t};

  for i in 1:nIn loop
    connect(inTransition[i,1], place1.inTransition[i]);
    connect(inTransition[i,2], place2.inTransition[i]);
  end for;

  for i in 1:nOut loop
    connect(outTransition[i,1], place1.outTransition[i]);
    connect(outTransition[i,2], place2.outTransition[i]);
  end for;

  annotation(Icon(coordinateSystem(preserveAspectRatio=false), graphics={Ellipse(extent={{-100,98},{100,-96}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid), Ellipse(extent={{-88,86},{88,-86}}, lineColor={0,0,0}, fillColor=DynamicSelect({255,255,255}, color), fillPattern=FillPattern.Solid), Text(extent={{-1.5,25.5},{-1.5,-21.5}}, lineColor={0,0,0}, origin={0,35}, rotation=0, textString=DynamicSelect("%startMarks[1]",if animateMarking==1 then if color[1]>0 then realString(color[1],1,2) else "0.0" else " ")), Text(extent={{-1.5,25.5},{-1.5,-21.5}}, lineColor={0,0,0}, origin={0,-35}, rotation=0, textString=DynamicSelect("%startMarks[2]",if animateMarking==1 then if color[2]>0 then realString(color[2],1,2) else "0.0" else " ")), Line(points={{-88,0},{88,0}}, color={0,0,0})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end CPC;
