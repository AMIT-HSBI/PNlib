within PNlib.Examples.ConTest;

model Speed
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{60, 20}, {80, 40}})));
  PNlib.Components.TC T1(nOut = 1, maximumSpeed = 2) annotation(
    Placement(transformation(extent = {{-40, 10}, {-20, 30}})));
  PNlib.Components.PC P1(nIn = 2, nOut = 1) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  PNlib.Components.TC T2(nOut = 1, arcWeightOut = {2}) annotation(
    Placement(transformation(extent = {{-40, -30}, {-20, -10}})));
  PNlib.Components.TC T3(nIn = 1, nOut = 1, arcWeightIn = {4}, arcWeightOut = {4}) annotation(
    Placement(transformation(extent = {{20, -10}, {40, 10}})));
  PNlib.Components.PC P2(nIn = 1) annotation(
    Placement(transformation(extent = {{50, -10}, {70, 10}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-25.2, 20}, {-20, 20}, {-20, -0.5}, {-10.8, -0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P1.inTransition[2]) annotation(
    Line(points = {{-25.2, -20}, {-20, -20}, {-20, 0.5}, {-10.8, 0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[1]) annotation(
    Line(points = {{25.2, 0}, {10.8, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{34.8, 0}, {49.2, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {80, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end Speed;
