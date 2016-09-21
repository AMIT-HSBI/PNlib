within PNlib.Examples.ConTest;
model ConflictLoop
  extends Modelica.Icons.Example;

  PNlib.TC T1(nOut = 1, nIn = 2, arcWeightOut = {3}, arcWeightIn = {2, 1}) annotation(Placement(transformation(extent={{-60, -10},
            {-40, 10}})));
  PNlib.TC T2(nIn = 1, nOut = 1, maximumSpeed = 4) annotation(Placement(transformation(extent={{0, 10}, {
            20, 30}})));
  PNlib.TC T3(nIn = 1, nOut = 1, maximumSpeed = 2) annotation(Placement(transformation(extent={{2, -30},
            {22, -10}})));
  PNlib.PC P1(nIn = 1, nOut = 2) annotation(Placement(transformation(extent={{-30, -10},
            {-10, 10}})));
  PNlib.PC P2(nIn = 1, nOut = 1, startMarks = 2) annotation(Placement(transformation(extent={{30, 10},
            {50, 30}})));
  PNlib.PC P3(nIn = 1, nOut = 1, startMarks = 1) annotation(Placement(transformation(extent={{30, -30},
            {50, -10}})));
  inner PNlib.Settings settings annotation(Placement(transformation(extent={{30, 50},
            {50, 70}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points={{-45.2, 0},
          {-30.8, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(Line(points={{-9.2,
          -0.5}, {0, -0.5}, {0, 20}, {5.2, 20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{14.8, 20},
          {29.2, 20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[2]) annotation(Line(points={{7.2, -20},
          {0, -20}, {0, 0.5}, {-9.2, 0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.inTransition[1], T3.outPlaces[1]) annotation(Line(points={{29.2,
          -20}, {16.8, -20}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P2.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{50.8, 20},
          {60, 20}, {60, 40}, {-60, 40}, {-60, -0.5}, {-54.8, -0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.outTransition[1], T1.inPlaces[2]) annotation(Line(points={{50.8,
          -20}, {60, -20}, {60, -40}, {-60, -40}, {-60, 0.5}, {-54.8, 0.5}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-80, -60},
            {80, 80}}), graphics), experiment(StartTime=0.0, StopTime=10.0));
end ConflictLoop;
