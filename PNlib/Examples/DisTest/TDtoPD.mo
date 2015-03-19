within PNlib.Examples.DisTest;
model TDtoPD
  extends Modelica.Icons.Example;

  PNlib.PD P1(nOut = 0, nIn = 1) annotation(Placement(visible = true, transformation(origin={20,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PNlib.TD T1(nOut = 1) annotation(Placement(visible = true, transformation(origin={-20,0},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PNlib.Settings settings1 annotation(Placement(visible = true, transformation(origin={30,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(P1.inTransition[1], T1.outPlaces[1]) annotation(Line(points={{9.2,0},{
          9.2,0},{-15.2,0}}));
  annotation(Diagram(coordinateSystem(extent={{-40,-40},
            {40,40}},                                                                                                    preserveAspectRatio = true, initialScale = 0.1, grid = {2, 2})), experiment(StartTime=0.0, StopTime=10.0));
end TDtoPD;
