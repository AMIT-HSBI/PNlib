within PNlib.Examples.ExtTest;

model TESTest
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{20, 20}, {40, 40}})));
  PNlib.Components.PD P1(nIn = 1, nOut = 1, startTokens = 1) annotation(
    Placement(visible = true, transformation(extent = {{-48, -20}, {-28, 0}}, rotation = 0)));
  PNlib.Components.PD P2(nIn = 1) annotation(
    Placement(visible = true, transformation(extent = {{12, -20}, {32, 0}}, rotation = 0)));
  PNlib.Components.TE T2(event = {3, 4, 5, 9}, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-66, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.TES T1(distributionType = PNlib.Types.DistributionType.Triangular, nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-8, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{-4, -10}, {10, -10}, {10, -10}, {12, -10}}, thickness = 0.5));
  connect(T1.inPlaces[1], P1.outTransition[1]) annotation(
    Line(points = {{-12, -10}, {-28, -10}, {-28, -10}, {-28, -10}}, thickness = 0.5));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-61.2, -10}, {-49.2, -10}, {-49.2, -10}, {-47.2, -10}}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -40}, {40, 40}})),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end TESTest;
