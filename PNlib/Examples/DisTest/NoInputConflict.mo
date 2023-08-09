within PNlib.Examples.DisTest;

model NoInputConflict
  extends Modelica.Icons.Example;
  PNlib.Components.TD T1(nOut = 1) annotation(
    Placement(visible = true, transformation(extent = {{-30, 10}, {-10, 30}}, rotation = 0)));
  PNlib.Components.TD T2(delay = 2, nOut = 1) annotation(
    Placement(visible = true, transformation(extent = {{-30, -30}, {-10, -10}}, rotation = 0)));
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{-60, 20}, {-40, 40}})));
  PNlib.Components.PD P1(enablingPrioIn = {2, 1}, maxTokens = 1, nIn = 2) annotation(
    Placement(visible = true, transformation(origin = {16, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-15.2, 20}, {-5.2, 20}, {-5.2, 2}, {6.8, 2}, {6.8, 2}}));
  connect(T2.outPlaces[1], P1.inTransition[2]) annotation(
    Line(points = {{-15.2, -20}, {-5.2, -20}, {-5.2, 2}, {5.8, 2}}));
  annotation(
    experiment(StartTime = 0.0, StopTime = 3.0, Tolerance = 1e-6),
    Diagram(coordinateSystem(extent = {{-60, -40}, {60, 40}})));
end NoInputConflict;
