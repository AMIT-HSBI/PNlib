within PNlib.Examples.Models.Senseo;

model Water_Tank "Water tank: the water tank of the Senseo machine."
  import PNlib.Components.*;
  Real level "Tank level in % of max height";
  parameter Real color[3] = {0, 0, 255};
  PC water_tank(nOut = 3, startMarks = 0.5, maxMarks = 0.75, nIn = 1) "cold water in tank" annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-8, 6})));
  Interfaces.PlaceOut outTransition1[2] annotation(
    Placement(transformation(extent = {{100, 17}, {120, 37}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {-70, 9})));
  Interfaces.PlaceIn inTransition1 annotation(
    Placement(transformation(extent = {{-105, -4}, {-85, 16}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -50})));
  Interfaces.PlaceOut refill_ annotation(
    Placement(transformation(extent = {{100, -20}, {120, 0}}), iconTransformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {90, 10})));
equation
  level = water_tank.t/water_tank.maxMarks;
  connect(water_tank.outTransition[1], outTransition1[1]) annotation(
    Line(points = {{2.8, 5.33333}, {56.4, 5.33333}, {56.4, 22}, {110, 22}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(water_tank.outTransition[2], outTransition1[2]);
  connect(water_tank.inTransition[1], inTransition1) annotation(
    Line(points = {{-18.8, 6}, {-95, 6}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(water_tank.outTransition[3], refill_) annotation(
    Line(points = {{2.8, 6.66667}, {55.9, 6.66667}, {55.9, -10}, {110, -10}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Text(extent = {{-94, 61}, {94, 90}}, lineColor = color, textString = "Water Tank"), Rectangle(extent = {{-60, 60}, {80, -40}}, lineColor = {0, 0, 0}, lineThickness = 0.5, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = DynamicSelect({{-60, -40}, {-60, -40}}, {{-60, -40}, {80, (-40 + level*100)}}), lineColor = {0, 0, 0}, lineThickness = 0.5, fillPattern = FillPattern.HorizontalCylinder, fillColor = color)}));
end Water_Tank;
