within PNlib.Examples.Models.Senseo;

model coffee_cup "Animation of coffee cup"
  Modelica.Blocks.Interfaces.RealInput levelSensor annotation(
    Placement(transformation(extent = {{-61, -30}, {-81, -10}}, rotation = 0), iconTransformation(extent = {{10, -10}, {-10, 10}}, rotation = 180, origin = {-71, -20})));
  Real level "Tank level in % of max height";
  parameter Real hmax = 0.7 "Max volume of tank in l";
  parameter Real color[3] = {0, 0, 255};
equation
  level = levelSensor/hmax;
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Text(extent = {{-115, -80}, {88, -48}}, lineColor = color, textString = "Coffee Cup"), Rectangle(extent = {{-60, 60}, {80, -40}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = DynamicSelect({{-60, -40}, {-60, -40}}, {{-60, -40}, {80, (-40 + level*100)}}), lineColor = {0, 0, 0}, lineThickness = 0.5, fillPattern = FillPattern.HorizontalCylinder, fillColor = color), Line(points = {{80, 40}, {100, 40}, {100, 0}, {80, 0}}, color = {0, 0, 0}, smooth = Smooth.None, thickness = 1)}));
end coffee_cup;
