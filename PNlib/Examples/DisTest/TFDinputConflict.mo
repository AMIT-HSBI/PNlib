within PNlib.Examples.DisTest;

model TFDinputConflict
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{40, 20}, {60, 40}}, rotation = 0)));
  PNlib.PD P1(nIn = 1, nOut = 1, startTokens = 0) annotation(
    Placement(visible = true, transformation(extent = {{-34, -28}, {-14, -8}}, rotation = 0)));
  PNlib.PD P2(enablingPrioIn = {2, 1}, maxTokens = 1, nIn = 2, nOut = 1, startTokens = 0) annotation(
    Placement(visible = true, transformation(origin = {22, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFD T1(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-2, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TE T2(event = {1, 2.5, 3.8}, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TE T3(event = {1.8, 2.3, 3.9}, nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {44, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  TE T4(event = {1.5, 3.5}, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-2, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T4.outPlaces[1], P2.inTransition[2]) annotation(
    Line(points = {{2, 20}, {10, 20}, {10, -18}, {12, -18}}));
  connect(P2.outTransition[1], T3.inPlaces[1]) annotation(
    Line(points = {{32.8, -18}, {39.8, -18}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{2.8, -18}, {10.8, -18}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-13.2, -18}, {-7.2, -18}}));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-45.2, -18}, {-35.2, -18}, {-35.2, -18}, {-33.2, -18}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -40}, {60, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 5.0, Tolerance = 1e-6));
end TFDinputConflict;
