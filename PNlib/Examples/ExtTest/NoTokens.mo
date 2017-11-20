within PNlib.Examples.ExtTest;

model NoTokens
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{-100, 60}, {-80, 80}}, rotation = 0)));
  PNlib.Components.PC P1(nOut = 1, startMarks = 5) annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P3(nOut = 1, startMarks = 5) annotation(
    Placement(visible = true, transformation(origin = {-80, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P2(nOut = 2, startMarks = 5) annotation(
    Placement(visible = true, transformation(origin = {-80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TC T1(nIn = 2, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-16, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TC T2(nIn = 2, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PC P4(nIn = 2) annotation(
    Placement(visible = true, transformation(origin = {40, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.IA IA1 annotation(
    Placement(visible = true, transformation(origin = {-46, -22}, extent = {{-9.8, 0.4}, {2.8, 4.8}}, rotation = 0)));
equation
  connect(T2.outPlaces[1], P4.inTransition[2]) annotation(
    Line(points = {{-12, -30}, {20, -30}, {20, 2}, {30, 2}, {30, 2}}, thickness = 0.5));
  connect(T1.outPlaces[1], P4.inTransition[1]) annotation(
    Line(points = {{-12, 20}, {20, 20}, {20, 2}, {30, 2}, {30, 2}, {30, 2}}, thickness = 0.5));
  connect(P3.outTransition[1], T2.inPlaces[2]) annotation(
    Line(points = {{-70, -42}, {-40, -42}, {-40, -30}, {-22, -30}, {-22, -30}, {-20, -30}}, thickness = 0.5));
  connect(P2.outTransition[2], IA1.inPlace) annotation(
    Line(points = {{-70, -8}, {-60, -8}, {-60, -20}, {-56, -20}, {-56, -20}}, thickness = 0.5));
  connect(P2.outTransition[1], T1.inPlaces[2]) annotation(
    Line(points = {{-70, -8}, {-40, -8}, {-40, 20}, {-20, 20}}, thickness = 0.5));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-68, 30}, {-40, 30}, {-40, 20}, {-20, 20}, {-20, 20}}, thickness = 0.5));
  connect(IA1.outTransition, T2.inPlaces[1]) annotation(
    Line(points = {{-42, -20}, {-40, -20}, {-40, -30}, {-20, -30}, {-20, -30}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {60, 80}})),
    experiment(StartTime = 0, StopTime = 12, Tolerance = 1e-06, Interval = 0.024));
end NoTokens;
