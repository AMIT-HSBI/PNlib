within PNlib.Examples.HybTest;

model TCwithPD
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{-60, 40}, {-40, 60}})));
  PNlib.Components.PC P1(nOut = 1, startMarks = 10) annotation(
    Placement(transformation(extent = {{-50, 10}, {-30, 30}})));
  PNlib.Components.PC P2(nIn = 1) annotation(
    Placement(transformation(extent = {{30, 10}, {50, 30}})));
  PNlib.Components.TC T1(nIn = 2, nOut = 2, arcWeightIn = {2, 1}, firingCon = true) annotation(
    Placement(transformation(extent = {{-10, 10}, {10, 30}})));
  PNlib.Components.PD P3(nOut = 1, nIn = 1, startTokens = 10) annotation(
    Placement(transformation(extent = {{10, -20}, {-10, 0}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-29.2, 20}, {-28, 20}, {-16, 20}, {-16, 19.5}, {-4.8, 19.5}}, color = {0, 0, 0}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{4.8, 19.5}, {12, 19.5}, {12, 20}, {29.2, 20}}, color = {0, 0, 0}));
  connect(P3.outTransition[1], T1.inPlaces[2]) annotation(
    Line(points = {{-10.8, -10}, {-20, -10}, {-20, 20.5}, {-4.8, 20.5}}, color = {0, 0, 0}));
  connect(T1.outPlaces[2], P3.inTransition[1]) annotation(
    Line(points = {{4.8, 20.5}, {20, 20.5}, {20, -10}, {10.8, -10}}, color = {0, 0, 0}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}})),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end TCwithPD;
