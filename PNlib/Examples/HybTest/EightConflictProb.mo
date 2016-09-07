within PNlib.Examples.HybTest;
model EightConflictProb
  extends Modelica.Icons.Example;
  PNlib.PC P1(enablingType = 2, nOut = 8, startMarks=1,
    localSeedIn=1,
    localSeedOut=2)                                     annotation(Placement(transformation(extent = {{-50, -10}, {-30, 10}})));
  PNlib.TD T1(nIn = 1) annotation(Placement(transformation(extent = {{-20, 30}, {0, 50}})));
  PNlib.TD T2(nIn = 1) annotation(Placement(transformation(extent = {{0, 10}, {20, 30}})));
  PNlib.TD T3(nIn = 1) annotation(Placement(transformation(extent = {{20, 20}, {40, 40}})));
  PNlib.TD T4(nIn = 1) annotation(Placement(transformation(extent = {{40, 10}, {60, 30}})));
  PNlib.TD T5(nIn = 1) annotation(Placement(transformation(extent = {{40, -30}, {60, -10}})));
  PNlib.TD T6(nIn = 1) annotation(Placement(transformation(extent = {{-20, -50}, {0, -30}})));
  PNlib.TD T7(nIn = 1) annotation(Placement(transformation(extent = {{20, -40}, {40, -20}})));
  PNlib.TD T8(nIn = 1) annotation(Placement(transformation(extent = {{0, -30}, {20, -10}})));
  inner PNlib.Settings settings annotation(Placement(transformation(extent = {{-60, 40}, {-40, 60}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-29.2, -0.875}, {-20, -0.875}, {-20, 40}, {-14.8, 40}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{5.2, 20}, {0, 20}, {0, -0.625}, {-29.2, -0.625}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[3]) annotation(Line(points = {{25.2, 30}, {20, 30}, {20, -0.375}, {-29.2, -0.375}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T4.inPlaces[1], P1.outTransition[4]) annotation(Line(points = {{45.2, 20}, {40, 20}, {40, -0.125}, {-29.2, -0.125}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T5.inPlaces[1], P1.outTransition[5]) annotation(Line(points = {{45.2, -20}, {40, -20}, {40, 0.125}, {-29.2, 0.125}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T6.inPlaces[1], P1.outTransition[6]) annotation(Line(points = {{-14.8, -40}, {-20, -40}, {-20, 0.375}, {-29.2, 0.375}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T7.inPlaces[1], P1.outTransition[7]) annotation(Line(points = {{25.2, -30}, {20, -30}, {20, 0.625}, {-29.2, 0.625}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T8.inPlaces[1], P1.outTransition[8]) annotation(Line(points = {{5.2, -20}, {-0.4, -20}, {-0.4, 0.875}, {-29.2, 0.875}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-60, -60}, {60, 60}}), graphics), experiment(StartTime = 0.0, StopTime = 10.0));
end EightConflictProb;
