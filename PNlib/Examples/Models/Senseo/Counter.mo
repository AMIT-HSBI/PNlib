within PNlib.Examples.Models.Senseo;
model Counter "Integer Counter"

  Modelica.Blocks.Interfaces.IntegerInput levelSensor
    annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
            rotation=0), iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,-70})));
  Real count;
  parameter Integer hmax=20;
equation
  count=if levelSensor/hmax<1 then levelSensor/hmax else 1;
  annotation (
    Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics),
    Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={
          Text(
            extent={{-17,46},{-17,66}},
            lineColor={0,0,0},
          textString="Cups Total"),
          Rectangle(
            extent={{-50.5,51},{50.5,-51}},
            lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor=DynamicSelect({255,255,255},{255,255-255*count,255-255*count}),
          origin={0,-9.5},
          rotation=90),
          Text(
            extent={{-1,-34},{-1,17}},
            textString=DynamicSelect(" ",realString(levelSensor,1,0)),
            lineColor={0,0,0})}));
end Counter;
