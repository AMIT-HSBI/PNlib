within PNlib.Components.Examples.ConTest;
model PCtoTCfunction
  extends Modelica.Icons.Example;

  inner PNlib.Components.Components.Settings settings annotation(Placement(transformation(extent={{20, 20},
            {40, 40}})));
  PNlib.Components.Components.PC P1(nOut = 1, startMarks = 1) annotation(Placement(transformation(extent={{-10, -10},
            {10, 10}})));
  PNlib.Components.Components.TC T1(arcWeightIn = {P1.t}, nIn = 1) annotation(Placement(transformation(extent={{20, -10}, {40,
            10}})));
equation
  connect(P1.outTransition[1], T1.inPlaces[1]) annotation(Line(points={{10.8, 0},
          {25.2, 0}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent={{-40, -40},
            {40, 40}}), graphics), experiment(StartTime=0.0, StopTime=10.0, Tolerance = 1e-6));
end PCtoTCfunction;
