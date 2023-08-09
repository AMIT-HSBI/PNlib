within PNlib.Examples.DisTest;

model TEnoInput
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{20, 20}, {40, 40}}, rotation = 0)));
  PNlib.Components.PD P1(nIn = 1, startTokens = 0) annotation(
    Placement(visible = true, transformation(extent = {{10, -10}, {30, 10}}, rotation = 0)));
  PNlib.Components.TE T2(event = {0.5, 2.5, 2.8}, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-19.2, 0}, {-4.2, 0}, {-4.2, 0}, {10.8, 0}, {10, 0}, {10, 0}, {9.6, 0}, {9.6, 0}, {9.2, 0}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {40, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 5.0, Tolerance = 1e-6));
end TEnoInput;
