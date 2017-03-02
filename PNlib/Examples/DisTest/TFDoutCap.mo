within PNlib.Examples.DisTest;

model TFDoutCap
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{40, 20}, {60, 40}}, rotation = 0)));
  PNlib.PD P1(nIn = 1, nOut = 1, startTokens = 0) annotation(
    Placement(visible = true, transformation(extent = {{-34, -10}, {-14, 10}}, rotation = 0)));
  PNlib.PD P2( maxTokens = 1, nIn = 1, nOut = 1, startTokens = 1) annotation(
    Placement(visible = true, transformation(origin = {22, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFD T1(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TE T2(event = {1, 2.5, 3.8}, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TE T3(event = {1.5, 4}, nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {44, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-46, 0}, {-36, 0}, {-36, 0}, {-34, 0}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-13, 0}, {-7, 0}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{3, 0}, {11, 0}}));
  connect(P2.outTransition[1], T3.inPlaces[1]) annotation(
    Line(points = {{32, 0}, {39, 0}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -40}, {60, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 5.0, Tolerance = 1e-6));
end TFDoutCap;
