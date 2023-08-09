within PNlib.Examples.ConTest;

model TCtoPCfunction
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(
    Placement(transformation(extent = {{20, 20}, {40, 40}})));
  PNlib.Components.TC T1(arcWeightOut = {P1.t}, nOut = 1) annotation(
    Placement(transformation(extent = {{-40, -10}, {-20, 10}})));
  PNlib.Components.PC P1(nIn = 1, startMarks = 1) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-25.2, 0}, {-10.8, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-40, -40}, {40, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 3.0, Tolerance = 1e-6));
end TCtoPCfunction;
