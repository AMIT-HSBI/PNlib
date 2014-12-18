within PNlib.Examples.DisTest;
model InputConflictProb
  PNlib.PD P1(maxTokens = 2, nIn = 2, nOut = 1, enablingType = 2) annotation(Placement(transformation(extent = {{34, 4}, {54, 24}})));
  PNlib.TD T1(nIn = 1) annotation(Placement(transformation(extent = {{78, 4}, {98, 24}})));
  PNlib.TD T2(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-14, 48}, {6, 68}})));
  PNlib.TD T3(nIn = 1, nOut = 1) annotation(Placement(transformation(extent = {{-14, -26}, {6, -6}})));
  PNlib.PD P2(startTokens = 5, nOut = 1) annotation(Placement(transformation(extent = {{-62, 48}, {-42, 68}})));
  PNlib.PD P3(startTokens = 5, enablingType = 1, nOut = 1) annotation(Placement(transformation(extent = {{-60, -26}, {-40, -6}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent = {{50, 48}, {70, 68}})));
equation
  connect(P2.outTransition[1], T2.inPlaces[1]) annotation(Line(points = {{-41.2, 58}, {-8.8, 58}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.outTransition[1], T3.inPlaces[1]) annotation(Line(points = {{-39.2, -16}, {-8.8, -16}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(Line(points = {{0.8, 58}, {18, 58}, {18, 13.5}, {33.2, 13.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.outPlaces[1], P1.inTransition[2]) annotation(Line(points = {{0.8, -16}, {20, -16}, {20, 14.5}, {33.2, 14.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T1.inPlaces[1], P1.outTransition[1]) annotation(Line(points = {{83.2, 14}, {54.8, 14}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(experiment(StartTime=0.0, StopTime=10.0));
end InputConflictProb;
