within PNlib.Examples.Models.FiliP.ModellStationen;
model Station1
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
  PNlib.Examples.Models.FiliP.Station station(APND = 1, nP = 1, APFD = 1, APSD = 1) annotation(
    Placement(visible = true, transformation(extent = {{-20, 20}, {20, 60}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft(Dienstbereit(maxTokens = 1), WEF = 1) annotation(
    Placement(visible = true, transformation(extent = {{-60, -80}, {0, -20}}, rotation = 0)));
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(origin = {90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(station.placeOut[1], pflegekraft.transitionIn[1]) annotation(
    Line(points = {{25, 40}, {28, 40}, {28, -32}, {3, -32}}));
  connect(station.placeOut[2], pflegekraft.transitionIn[2]) annotation(
    Line(points = {{25, 40}, {28, 40}, {28, -32}, {3, -32}}));
  connect(station.placeOut[3], pflegekraft.transitionIn[3]) annotation(
    Line(points = {{25, 40}, {28, 40}, {28, -32}, {3, -32}}));
  connect(station.placeIn[1], pflegekraft.transitionOut[1]) annotation(
    Line(points = {{-25, 40}, {-25, 5}, {-63, 5}, {-63, -32}}));
  connect(station.placeIn[2], pflegekraft.transitionOut[2]) annotation(
    Line(points = {{-25, 40}, {-25, 5}, {-63, 5}, {-63, -32}}));
  connect(station.placeIn[3], pflegekraft.transitionOut[3]) annotation(
    Line(points = {{-25, 40}, {-25, 5}, {-63, 5}, {-63, -32}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
end Station1;
