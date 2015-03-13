within PNlib.Examples.DisTest;
model SixConflictProb
  extends Modelica.Icons.Example;

  PNlib.PD P1(startTokens = 1, enablingType = 2, nOut = 6) annotation(Placement(transformation(extent = {{-62, -6}, {-42, 14}})));
  PNlib.TD T1(nIn = 1) annotation(Placement(transformation(extent = {{-2, 72}, {18, 92}})));
  PNlib.TD T2(nIn = 1) annotation(Placement(transformation(extent = {{12, 42}, {32, 62}})));
  PNlib.TD T3(nIn = 1) annotation(Placement(transformation(extent = {{24, 14}, {44, 34}})));
  PNlib.TD T4(nIn = 1) annotation(Placement(transformation(extent = {{24, -26}, {44, -6}})));
  PNlib.TD T5(nIn = 1) annotation(Placement(transformation(extent = {{12, -62}, {32, -42}})));
  PNlib.TD T6(nIn = 1) annotation(Placement(transformation(extent = {{0, -88}, {20, -68}})));
  inner PNlib.Settings settings1
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{-41.2,
          3.16667},{-14,3.16667},{-14,82},{3.2,82}},                                                                              color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{17.2, 52}, {-12, 52}, {-12, 3.5}, {-41.2, 3.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[3]) annotation(Line(points={{29.2,24},
          {-8,24},{-8,3.83333},{-41.2,3.83333}},                                                                                 color = {0, 0, 0}, smooth = Smooth.None));
  connect(T4.inPlaces[1], P1.outTransition[4]) annotation(Line(points={{29.2,
          -16},{-10,-16},{-10,4.16667},{-41.2,4.16667}},                                                                             color = {0, 0, 0}, smooth = Smooth.None));
  connect(T5.inPlaces[1], P1.outTransition[5]) annotation(Line(points = {{17.2, -52}, {-12, -52}, {-12, 4.5}, {-41.2, 4.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T6.inPlaces[1], P1.outTransition[6]) annotation(Line(points={{5.2,-78},
          {-32,-78},{-32,4.83333},{-41.2,4.83333}},                                                                                 color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end SixConflictProb;
