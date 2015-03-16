within PNlib.Examples.ConTest;
model Conflict
  extends Modelica.Icons.Example;

  PNlib.TC T1(nOut = 1) annotation(Placement(transformation(extent={{-40,-10},{
            -20,10}})));
  PNlib.TC T2(maximumSpeed = 2, nIn = 1, nOut = 1) annotation(Placement(transformation(extent={{20,10},
            {40,30}})));
  PNlib.TC T3(nIn = 1, nOut = 1) annotation(Placement(transformation(extent={{20,-30},
            {40,-10}})));
  PNlib.PC P1(nIn = 1, nOut = 2) annotation(Placement(transformation(extent={{-10,-10},
            {10,10}})));
  PNlib.PC P2(nIn = 1) annotation(Placement(transformation(extent={{50,10},{70,
            30}})));
  PNlib.PC P3(nIn = 1) annotation(Placement(transformation(extent={{50,-30},{70,
            -10}})));
  inner PNlib.Settings settings1 annotation(Placement(transformation(extent={{-40,20},
            {-20,40}})));
equation
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(points={{-25.2,0},
          {-10.8,0}},                                                                               color = {0, 0, 0}, smooth = Smooth.None));
  connect(P1.outTransition[1], T2.inPlaces[1]) annotation(Line(points={{10.8,
          -0.5},{20,-0.5},{20,20},{25.2,20}},                                                                                color = {0, 0, 0}, smooth = Smooth.None));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(points={{34.8,20},
          {49.2,20}},                                                                            color = {0, 0, 0}, smooth = Smooth.None));
  connect(T3.inPlaces[1], P1.outTransition[2]) annotation(Line(points={{25.2,
          -20},{20,-20},{20,0.5},{10.8,0.5}},                                                                               color = {0, 0, 0}, smooth = Smooth.None));
  connect(P3.inTransition[1], T3.outPlaces[1]) annotation(Line(points={{49.2,
          -20},{34.8,-20}},                                                                                           color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-40,-40},
            {80,40}}),                                                                                   graphics), experiment(StartTime=0.0, StopTime=10.0),
    Icon(coordinateSystem(extent={{-40,-40},{80,40}})));
end Conflict;
