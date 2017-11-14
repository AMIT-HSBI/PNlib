within PNlib.Examples.DisTest;
model Ttest
  extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(Placement(visible = true, transformation(extent = {{-80, 20}, {-60, 40}}, rotation = 0)));
  PNlib.Components.PD P1(nIn = 1,nOut = 1, startTokens = 0) annotation(Placement(visible = true, transformation(extent = {{-46, -12}, {-26, 8}}, rotation = 0)));
  PNlib.Components.TE T2(event = {1, 2, 3, 4}, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-62, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P2(nIn = 1, nOut = 2)  annotation(
    Placement(visible = true, transformation(origin = {12, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.T T1(arcWeightIn = {2}, arcWeightOut = {3}, nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {-12, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.T T3(arcWeightIn = {2}, arcWeightOut = {2},nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {40, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P3(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {64, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.T T4(arcWeightIn = {2}, arcWeightOut = {2},nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {42, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.Components.PD P4(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {66, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T4.inPlaces[1], P2.outTransition[2]) annotation(
    Line(points = {{38, -22}, {30, -22}, {30, -2}, {22, -2}, {22, -2}}, thickness = 0.5));
  connect(T4.outPlaces[1], P4.inTransition[1]) annotation(
    Line(points = {{47, -22}, {56, -22}}, thickness = 0.5));
  connect(T3.outPlaces[1], P3.inTransition[1]) annotation(
    Line(points = {{44.8, 22}, {54.8, 22}, {54.8, 22}, {54.8, 22}}, thickness = 0.5));
  connect(T3.inPlaces[1], P2.outTransition[1]) annotation(
    Line(points = {{35, 20}, {29, 20}, {29, -2}, {22, -2}}, thickness = 0.5));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{-7, -2}, {-1, -2}}, thickness = 0.5));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-25, -2}, {-15, -2}}, thickness = 0.5));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-57.2, -2}, {-45, -2}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-80, -40},
            {80, 40}}), graphics), experiment(StartTime=0.0, StopTime=5.0, Tolerance = 1e-6));
end Ttest;
