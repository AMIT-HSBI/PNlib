within PNlib.Examples.HybTest;

model ConflictType4error
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(
    Placement(transformation(extent = {{-60, 40}, {-40, 60}})));
  PNlib.PC P1(nOut = 1, startMarks = 10) annotation(
    Placement(transformation(extent = {{-50, 10}, {-30, 30}})));
  PNlib.PC P2(nIn = 1) annotation(
    Placement(transformation(extent = {{30, 10}, {50, 30}})));
  PNlib.PC P3(nOut = 1, startMarks = 10) annotation(
    Placement(transformation(extent = {{-50, -50}, {-30, -30}})));
  PNlib.PC P4(nIn = 1) annotation(
    Placement(transformation(extent = {{30, -50}, {50, -30}})));
  PNlib.TC T1(nIn = 2, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, -50}, {10, -30}})));
  PNlib.TC T2(nIn = 2, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, 10}, {10, 30}})));
  PNlib.PD P5(nIn = 0, nOut = 2, startTokens = 1) annotation(
    Placement(transformation(extent = {{10, -20}, {-10, 0}})));
equation
  connect(T1.outPlaces[1], P4.inTransition[1]) annotation(
    Line(points = {{4, -40}, {30, -40}, {30, -40}, {30, -40}}, thickness = 0.5));
  connect(P2.inTransition[1], T2.outPlaces[1]) annotation(
    Line(points = {{30, 20}, {4, 20}, {4, 20}, {4, 20}}, thickness = 0.5));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(
    Line(points = {{-29.2, 20}, {-28, 20}, {-28, 20}, {-16, 20}, {-16, 19.5}, {-4.8, 19.5}}, color = {0, 0, 0}));
  connect(P5.outTransition[1], T2.inPlaces[2]) annotation(
    Line(points = {{-10.8, -10.5}, {-20, -10.5}, {-20, 20.5}, {-4.8, 20.5}}, color = {0, 0, 0}));
  connect(P3.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-29.2, -40}, {-4.8, -40}, {-4.8, -40.5}}, color = {0, 0, 0}));
  connect(P5.outTransition[2], T1.inPlaces[2]) annotation(
    Line(points = {{-10.8, -9.5}, {-20, -9.5}, {-20, -39.5}, {-4.8, -39.5}}, color = {0, 0, 0}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}})),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end ConflictType4error;
