within PNlib.Examples.ExtTest;

model ArcswithPCtoTC2
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{-100, 60}, {-80, 80}}, rotation = 0)));
  PNlib.Components.PC P1(maxMarks = 1, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P2(nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P3(maxMarks = 1, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P4(nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P5(maxMarks = 1, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P6(nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P7(maxMarks = 1, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P8(nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {40, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TC T1(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TC T2(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TC T3(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TC T4(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TA TA1 annotation(
    Placement(visible = true, transformation(origin = {-6, 58}, extent = {{-9.8, 0.4}, {2.8, 4.8}}, rotation = 0)));
  PNlib.Components.TA TA2(realTestArc = false) annotation(
    Placement(visible = true, transformation(origin = {-8, 18}, extent = {{-9.8, 0.4}, {2.8, 4.8}}, rotation = 0)));
  PNlib.Components.IA IA1 annotation(
    Placement(visible = true, transformation(origin = {-8, -22}, extent = {{-9.8, 0.4}, {2.8, 4.8}}, rotation = 0)));
  PNlib.Components.IA IA2(realInhibitorArc = false) annotation(
    Placement(visible = true, transformation(origin = {-6, -62}, extent = {{-9.8, 0.4}, {2.8, 4.8}}, rotation = 0)));
  PNlib.Components.TC T5(nOut = 4) annotation(
    Placement(visible = true, transformation(origin = {-84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T5.outPlaces[4], P7.inTransition[1]) annotation(
    Line(points = {{-80, 0}, {-60, 0}, {-60, -60}, {-50, -60}, {-50, -60}}));
  connect(T5.outPlaces[3], P5.inTransition[1]) annotation(
    Line(points = {{-80, 0}, {-60, 0}, {-60, -20}, {-50, -20}, {-50, -20}}));
  connect(T5.outPlaces[2], P3.inTransition[1]) annotation(
    Line(points = {{-80, 0}, {-60, 0}, {-60, 20}, {-50, 20}, {-50, 20}}));
  connect(T5.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-80, 0}, {-60, 0}, {-60, 60}, {-52, 60}, {-52, 60}, {-50, 60}}));
  connect(T4.outPlaces[1], P8.inTransition[1]) annotation(
    Line(points = {{14, -60}, {28, -60}, {28, -60}, {30, -60}}));
  connect(T3.outPlaces[1], P6.inTransition[1]) annotation(
    Line(points = {{14, -20}, {28, -20}, {28, -20}, {30, -20}}));
  connect(T2.outPlaces[1], P4.inTransition[1]) annotation(
    Line(points = {{14, 20}, {28, 20}, {28, 20}, {30, 20}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{14, 60}, {30, 60}, {30, 60}, {30, 60}}));
  connect(IA2.outTransition, T4.inPlaces[1]) annotation(
    Line(points = {{-2, -60}, {6, -60}, {6, -60}, {6, -60}}));
  connect(P7.outTransition[1], IA2.inPlace) annotation(
    Line(points = {{-30, -60}, {-18, -60}, {-18, -60}, {-16, -60}}));
  connect(IA1.outTransition, T3.inPlaces[1]) annotation(
    Line(points = {{-4, -20}, {4, -20}, {4, -20}, {6, -20}, {6, -20}}));
  connect(P5.outTransition[1], IA1.inPlace) annotation(
    Line(points = {{-30, -20}, {-20, -20}, {-20, -20}, {-18, -20}}));
  connect(TA2.outTransition, T2.inPlaces[1]) annotation(
    Line(points = {{-4, 20}, {4, 20}, {4, 20}, {6, 20}}));
  connect(P3.outTransition[1], TA2.inPlace) annotation(
    Line(points = {{-30, 20}, {-20, 20}, {-20, 20}, {-18, 20}}));
  connect(TA1.outTransition, T1.inPlaces[1]) annotation(
    Line(points = {{-2, 60}, {4, 60}, {4, 60}, {6, 60}}));
  connect(P1.outTransition[1], TA1.inPlace) annotation(
    Line(points = {{-30, 60}, {-18, 60}, {-18, 60}, {-16, 60}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {60, 80}})),
    experiment(StartTime = 0.0, StopTime = 2.0, Tolerance = 1e-6));
end ArcswithPCtoTC2;
