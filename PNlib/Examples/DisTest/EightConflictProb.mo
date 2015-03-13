within PNlib.Examples.DisTest;
model EightConflictProb
  extends Modelica.Icons.Example;

  PNlib.PD P1(startTokens = 1, enablingType = 2, nOut = 8) annotation(Placement(transformation(extent = {{-90, -4}, {-70, 16}})));
  PNlib.TD T1(nIn = 1) annotation(Placement(transformation(extent = {{2, 76}, {22, 96}})));
  PNlib.TD T2(nIn = 1) annotation(Placement(transformation(extent = {{30, 60}, {50, 80}})));
  PNlib.TD T3(nIn = 1) annotation(Placement(transformation(extent = {{52, 36}, {72, 56}})));
  PNlib.TD T4(nIn = 1) annotation(Placement(transformation(extent = {{72, 8}, {92, 28}})));
  PNlib.TD T5(nIn = 1) annotation(Placement(transformation(extent = {{72, -24}, {92, -4}})));
  PNlib.TD T6(nIn = 1) annotation(Placement(transformation(extent = {{52, -50}, {72, -30}})));
  PNlib.TD T7(nIn = 1) annotation(Placement(transformation(extent = {{30, -76}, {50, -56}})));
  PNlib.TD T8(nIn = 1) annotation(Placement(transformation(extent = {{8, -94}, {28, -74}})));
  inner PNlib.Settings settings1
    annotation (Placement(transformation(extent={{-60,46},{-40,66}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-69.2, 5.125}, {-4, 5.125}, {-4, 86}, {7.2, 86}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{35.2, 70}, {-2, 70}, {-2, 5.375}, {-69.2, 5.375}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[3]) annotation(Line(points = {{57.2, 46}, {2, 46}, {2, 5.625}, {-69.2, 5.625}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T4.inPlaces[1], P1.outTransition[4]) annotation(Line(points = {{77.2, 18}, {0, 18}, {0, 5.875}, {-69.2, 5.875}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T5.inPlaces[1], P1.outTransition[5]) annotation(Line(points = {{77.2, -14}, {-2, -14}, {-2, 6.125}, {-69.2, 6.125}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T6.inPlaces[1], P1.outTransition[6]) annotation(Line(points = {{57.2, -40}, {-22, -40}, {-22, 6.375}, {-69.2, 6.375}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T7.inPlaces[1], P1.outTransition[7]) annotation(Line(points = {{35.2, -66}, {26, -66}, {26, 6.625}, {-69.2, 6.625}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T8.inPlaces[1], P1.outTransition[8]) annotation(Line(points = {{13.2, -84}, {9.6, -84}, {9.6, 6.875}, {-69.2, 6.875}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics));
end EightConflictProb;
