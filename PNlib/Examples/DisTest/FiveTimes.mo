within PNlib.Examples.DisTest;
model FiveTimes
  extends Modelica.Icons.Example;
  inner PNlib.Settings settings
    annotation(Placement(visible = true, transformation(extent = {{-60, 80}, {-40, 100}}, rotation = 0)));
  PNlib.PD P1(nIn = 1, nOut = 1, startTokens = 3)  annotation(
    Placement(visible = true, transformation(origin = {-30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P2(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P3(nIn = 1, nOut = 1, startTokens = 3)  annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P4(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P5( nIn = 1, nOut = 1, startTokens = 3)  annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P6(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P7(nIn = 1, nOut = 1, startTokens = 3)  annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PD P8(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TD T1(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TE T2(event = {1, 3, 4, 5, 6, 9}, nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TFD T3(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TT T4(nIn = 1, nOut = 1, tactStart = 2)  annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TE T6(arcWeightOut = {3, 3, 3, 3, 3}, event = {5.5}, nOut = 5)  annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P9(nIn = 1, nOut = 1, startMarks = 3)  annotation(
    Placement(visible = true, transformation(origin = {-30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.PC P10(nIn = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TC T5(nIn = 1, nOut = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T6.outPlaces[5], P9.inTransition[1]) annotation(
    Line(points = {{-66, 0}, {-52, 0}, {-52, -100}, {-40, -100}, {-40, -100}}));
  connect(P9.outTransition[1], T5.inPlaces[1]) annotation(
    Line(points = {{-20, -100}, {-6, -100}, {-6, -100}, {-4, -100}}));
  connect(T5.outPlaces[1], P10.inTransition[1]) annotation(
    Line(points = {{4, -100}, {20, -100}, {20, -100}, {20, -100}}));
  connect(T4.outPlaces[1], P8.inTransition[1]) annotation(
    Line(points = {{4, -60}, {18, -60}, {18, -60}, {20, -60}}));
  connect(P7.outTransition[1], T4.inPlaces[1]) annotation(
    Line(points = {{-20, -60}, {-4, -60}, {-4, -60}, {-4, -60}}));
  connect(T6.outPlaces[4], P7.inTransition[1]) annotation(
    Line(points = {{-66, 0}, {-52, 0}, {-52, -60}, {-40, -60}, {-40, -60}}));
  connect(T6.outPlaces[3], P5.inTransition[1]) annotation(
    Line(points = {{-66, 0}, {-52, 0}, {-52, -20}, {-42, -20}, {-42, -20}, {-40, -20}}));
  connect(T6.outPlaces[2], P3.inTransition[1]) annotation(
    Line(points = {{-66, 0}, {-52, 0}, {-52, 20}, {-40, 20}, {-40, 20}}));
  connect(T6.outPlaces[1], P1.inTransition[1]) annotation(
    Line(points = {{-66, 0}, {-52, 0}, {-52, 60}, {-40, 60}, {-40, 60}}));
  connect(T3.outPlaces[1], P6.inTransition[1]) annotation(
    Line(points = {{4, -20}, {18, -20}, {18, -20}, {20, -20}}));
  connect(P5.outTransition[1], T3.inPlaces[1]) annotation(
    Line(points = {{-20, -20}, {-6, -20}, {-6, -20}, {-4, -20}}));
  connect(T2.outPlaces[1], P4.inTransition[1]) annotation(
    Line(points = {{4, 20}, {18, 20}, {18, 20}, {20, 20}}));
  connect(P3.outTransition[1], T2.inPlaces[1]) annotation(
    Line(points = {{-20, 20}, {-6, 20}, {-6, 20}, {-4, 20}}));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(
    Line(points = {{4, 60}, {18, 60}, {18, 60}, {20, 60}}));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(
    Line(points = {{-20, 60}, {-4, 60}, {-4, 60}, {-4, 60}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-80, -120},
            {60, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end FiveTimes;
