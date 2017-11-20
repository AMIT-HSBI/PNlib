within PNlib.Examples.DisTest;
model PrioTest
 extends Modelica.Icons.Example;
  inner PNlib.Components.Settings settings annotation(Placement(visible = true, transformation(extent = {{-60, 40}, {-40, 60}}, rotation = 0)));
 PNlib.Components.PD P1(enablingPrioOut = {4, 3, 2, 1},nIn = 1, nOut = 4, startTokens = 1)  annotation(Placement(visible = true, transformation(origin = {-26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.TD T1(nOut = 1)  annotation(Placement(visible = true, transformation(origin = {-52, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.TD T2(nIn = 1, nOut = 1)  annotation(Placement(visible = true, transformation(origin = {16, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.TD T3(nIn = 1, nOut = 1)  annotation(Placement(visible = true, transformation(origin = {16, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.TD T4(nIn = 1, nOut = 1)  annotation(Placement(visible = true, transformation(origin = {16, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.TD T5(nIn = 1, nOut = 1)  annotation(Placement(visible = true, transformation(origin = {16, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.PD P2(maxTokens = 1, nIn = 1)  annotation(Placement(visible = true, transformation(origin = {40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.PD P3(maxTokens = 1, nIn = 1)  annotation(Placement(visible = true, transformation(origin = {40, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.PD P4(maxTokens = 1, nIn = 1)  annotation(Placement(visible = true, transformation(origin = {40, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 PNlib.Components.PD P5(maxTokens = 1, nIn = 1)  annotation(Placement(visible = true, transformation(origin = {40, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(T5.outPlaces[1], P5.inTransition[1]) annotation(Line(points = {{20, -46}, {30, -46}, {30, -46}, {30, -46}}));
  connect(T4.outPlaces[1], P4.inTransition[1]) annotation(Line(points = {{20, -16}, {28, -16}, {28, -16}, {30, -16}}));
  connect(T3.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{20, 16}, {30, 16}, {30, 16}, {30, 16}}));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{20, 46}, {30, 46}, {30, 46}, {30, 46}}));
  connect(P1.outTransition[4], T5.inPlaces[1]) annotation(Line(points = {{-16, -2}, {0, -2}, {0, -46}, {11, -46}}));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-16, -2}, {0, -2}, {0, 46}, {11, 46}}));
  connect(P1.outTransition[3], T4.inPlaces[1]) annotation(Line(points = {{-16, -2}, {0, -2}, {0, -16}, {11, -16}}));
  connect(P1.outTransition[2], T3.inPlaces[1]) annotation(Line(points = {{-16, -2}, {0, -2}, {0, 16}, {11, 16}}));
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-48, -2}, {-38, -2}, {-38, -2}, {-36, -2}}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}}), graphics), experiment(StartTime = 0.0, StopTime = 5.0, Tolerance = 1e-6));

end PrioTest;
