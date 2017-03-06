within PNlib.Examples.ExtTest;

model TFDStest
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{20, 20}, {40, 40}}, rotation = 0)));
  PNlib.PD P1(nIn = 0, nOut = 1, startTokens = 5) annotation(
    Placement(visible = true, transformation(extent = {{-38, -10}, {-18, 10}}, rotation = 0)));
  PNlib.PD P2(  nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFDS T1(b = 2, c = 1,distributionType = 2, nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{4, 0}, {18, 0}, {18, 0}, {18, 0}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-18, 0}, {-6, 0}, {-6, 0}, {-4, 0}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {40, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end TFDStest;
