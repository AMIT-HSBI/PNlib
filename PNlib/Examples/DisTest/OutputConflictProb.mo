within PNlib.Examples.DisTest;
model OutputConflictProb
  PNlib.PD P1(nIn = 1, startTokens = 2, nOut = 2, enablingProbOut = {0.5, 0.5}, minTokens = 2, enablingType = 2) annotation(Placement(transformation(extent = {{-40, -6}, {-20, 14}})));
  PNlib.TD T1(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{14, 44}, {34, 64}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{14, -36}, {34, -16}})));
  PNlib.PD P2(nIn = 1) annotation(Placement(transformation(extent = {{60, 44}, {80, 64}})));
  PNlib.PD P3(nIn = 1) annotation(Placement(transformation(extent = {{60, -36}, {80, -16}})));
  PNlib.TD T3(nOut = 1) annotation(Placement(transformation(extent = {{-82, -6}, {-62, 14}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{-60, 46}, {-40, 66}})));
equation
  connect(T3.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{-67.2, 4}, {-40.8, 4}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points = {{-19.2, 3.5}, {0, 3.5}, {0, 54}, {19.2, 54}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.outPlaces[1], P2.inTransition[1]) annotation(Line(points = {{28.8, 54}, {59.2, 54}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.inPlaces[1], P1.outTransition[2]) annotation(Line(points = {{19.2, -26}, {-0.4, -26}, {-0.4, 4.5}, {-19.2, 4.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P3.inTransition[1]) annotation(Line(points = {{28.8, -26}, {59.2, -26}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(StartTime=0.0, StopTime=10.0));
end OutputConflictProb;
