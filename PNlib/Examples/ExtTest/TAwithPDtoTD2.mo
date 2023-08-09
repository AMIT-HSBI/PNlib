within PNlib.Examples.ExtTest;

model TAwithPDtoTD2
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{-60, 40}, {-40, 60}})));
  PNlib.Components.PD P1(nOut = 2, startTokens = 5) annotation(
    Placement(transformation(extent = {{-52, -10}, {-32, 10}})));
  PNlib.Components.PD P2(nIn = 1) annotation(
    Placement(transformation(extent = {{30, 20}, {50, 40}})));
  PNlib.Components.PD P3(nIn = 1) annotation(
    Placement(transformation(extent = {{30, -40}, {50, -20}})));
  PNlib.Components.TA TA1(realTestArc = false, testValue = 3) annotation(
    Placement(transformation(extent = {{-18, -36}, {-4, -30}})));
  PNlib.Components.TD T1(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{6, 20}, {26, 40}})));
  PNlib.Components.TD T2(nIn = 1, nOut = 1) annotation(
    Placement(transformation(extent = {{6, -40}, {26, -20}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-31.2, -0.5}, {-26, -0.5}, {-26, 30}, {11.2, 30}}, color = {0, 0, 0}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{20.8, 30}, {20.8, 30}, {29.2, 30}}, color = {0, 0, 0}));
  connect(P1.outTransition[2], TA1.inPlace) annotation(
    Line(points = {{-31.2, 0.5}, {-26, 0.5}, {-26, -33}, {-19.1111, -33}}, color = {0, 0, 0}));
  connect(TA1.outTransition, T2.inPlaces[1]) annotation(
    Line(points = {{-2.88889, -33}, {3.55556, -33}, {3.55556, -30}, {11.2, -30}}, color = {0, 0, 0}));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(
    Line(points = {{20.8, -30}, {20.8, -30}, {29.2, -30}}, color = {0, 0, 0}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}}), graphics),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end TAwithPDtoTD2;
