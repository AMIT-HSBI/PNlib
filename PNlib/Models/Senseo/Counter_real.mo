within PNlib.Models.Senseo;
model Counter_real "Real Counter"
 parameter String text="counter";
 parameter Real color[3]={255,0,0};
  Modelica.Blocks.Interfaces.RealInput    levelSensor
    annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
            rotation=0), iconTransformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,-70})));
  Real count;
  parameter Integer hmax=1000000;
  Real levelSensor_=if levelSensor>0 then levelSensor else 0;
equation
  count=levelSensor_/hmax;
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
            extent={{-4,46},{-4,66}},
            lineColor={0,0,0},
          textString="%text"),
          Rectangle(
            extent={{-50.5,51},{50.5,-51}},
            lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor={255,255,255},
          origin={0,-9.5},
          rotation=90),
          Rectangle(
            extent={{-50.5,51},{50.5,51-count*100}},
            lineColor={0,0,0},
          fillPattern=FillPattern.Solid,
          fillColor=color,
          origin={0,-9.5},
          rotation=90),
          Text(
            extent={{0,-27},{0,12}},
            textString=DynamicSelect("0",realString(levelSensor_,1,0)),
            lineColor={0,0,0})}));
end Counter_real;
