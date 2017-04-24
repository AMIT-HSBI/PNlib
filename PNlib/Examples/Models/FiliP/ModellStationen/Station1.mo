within PNlib.Examples.Models.FiliP.ModellStationen;
model Station1
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
  PNlib.Examples.Models.FiliP.Station station(APND = 1, nP = 1, APFD = 1, APSD = 1) annotation(
    Placement(transformation(extent = {{-22, 414}, {18, 454}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft(Dienstbereit(maxTokens = 1), WEF = 1) annotation(
    Placement(transformation(extent = {{-32, 322}, {28, 382}})));
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(origin = {-64, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(station.placeOut[1], pflegekraft.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {30, 434}, {30, 372.1}, {31, 372.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[2], pflegekraft.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {30, 434}, {30, 372.1}, {31, 372.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[3], pflegekraft.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {30, 434}, {30, 372.1}, {31, 372.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[1], pflegekraft.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 391.95}, {-35, 391.95}, {-35, 372.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[2], pflegekraft.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 391.95}, {-35, 391.95}, {-35, 372.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[3], pflegekraft.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 391.95}, {-35, 391.95}, {-35, 372.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-150, -500}, {150, 500}})),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-150, -500}, {150, 500}})));
end Station1;
