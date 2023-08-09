within PNlib.Examples.ExtTest;

model TDSTestinterrupt
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{20, 20}, {40, 40}})));
  PNlib.Components.PD P1(nIn = 1, nOut = 2, startTokens = 1) annotation(
    Placement(visible = true, transformation(extent = {{-48, -20}, {-28, 0}}, rotation = 0)));
  PNlib.Components.PD P2(nIn = 1) annotation(
    Placement(visible = true, transformation(extent = {{12, -20}, {32, 0}}, rotation = 0)));
  PNlib.Components.TDS T1(a = 0.5, b = 1.5, c = 1, distributionType = PNlib.Types.DistributionType.Triangular, localSeed = 1, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(extent = {{-18, -20}, {2, 0}}, rotation = 0)));
  PNlib.Components.TE T2(event = {0.4}, nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {-8, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TE T3(event = {2, 4}, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-66, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{-3.2, -10}, {11.2, -10}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-27.2, -10}, {-12.8, -10}}));
  connect(P1.outTransition[2], T2.inPlaces[1]) annotation(
    Line(points = {{-27.2, -10}, {-19.2, -10}, {-19.2, 20}, {-11.2, 20}, {-11.2, 20}}, thickness = 0.5));
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-61.2, -10}, {-49.2, -10}, {-49.2, -10}, {-47.2, -10}}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -40}, {40, 40}})),
    experiment(StartTime = 0.0, StopTime = 8.0, Tolerance = 1e-6));
end TDSTestinterrupt;
