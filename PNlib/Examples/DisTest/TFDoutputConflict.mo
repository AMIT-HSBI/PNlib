within PNlib.Examples.DisTest;

model TFDoutputConflict
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(extent = {{40, 20}, {60, 40}}, rotation = 0)));
  PNlib.PD P1(enablingType = PNlib.Types.EnablingType.Probability,nIn = 1, nOut = 2, startTokens = 0) annotation(
    Placement(visible = true, transformation(extent = {{-30, -6}, {-10, 14}}, rotation = 0)));
  PNlib.PD P2(nIn = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFD T1(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {10, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TD T3(nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFD T2(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {10, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P3(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-9.2, 4}, {5, 4}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{15, 4}, {29, 4}}));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(
    Line(points = {{5, -24}, {-8.8, -24}, {-8.8, 4}, {-10.8, 4}}));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(
    Line(points = {{15, -24}, {29, -24}}));
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-39.2, 4}, {-30.2, 4}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -40}, {60, 40}}), graphics),
    experiment(StartTime = 0.0, StopTime = 10.0, Tolerance = 1e-6));
end TFDoutputConflict;
