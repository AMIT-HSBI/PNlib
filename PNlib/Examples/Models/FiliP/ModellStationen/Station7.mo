within PNlib.Examples.Models.FiliP.ModellStationen;
model Station7
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
  PNlib.Examples.Models.FiliP.Station station(APFD = 1, APND = 1, APSD = 1, nP = 7) annotation(
    Placement(visible = true, transformation(extent = {{-18, 290}, {22, 330}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft1(Dienstbereit(maxTokens = 1), UrlaubEndTermine = {25, 53, 81}, UrlaubStartTermine = {11, 39, 67}, WEF = 2) annotation(
    Placement(visible = true, transformation(extent = {{-30, 198}, {30, 258}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft2(UrlaubEndTermine = {109, 137, 165}, UrlaubStartTermine = {95, 123, 151}, WEF = 2) annotation(
    Placement(visible = true, transformation(extent = {{-32, 116}, {28, 176}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft3(UrlaubEndTermine = {193, 221, 249}, UrlaubStartTermine = {179, 207, 235}, WEF = 2) annotation(
    Placement(visible = true, transformation(extent = {{-34, 26}, {26, 86}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft4(UrlaubEndTermine = {263, 277, 291, 305, 319, 333}, UrlaubStartTermine = {256, 270, 284, 298, 312, 326}, WEF = 3) annotation(
    Placement(visible = true, transformation(extent = {{-32, -58}, {28, 2}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft5(UrlaubEndTermine = {19, 47, 75}, UrlaubStartTermine = {5, 33, 61})  annotation(
    Placement(visible = true, transformation(extent = {{-36, -150}, {24, -90}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft6(UrlaubEndTermine = {103, 131, 159}, UrlaubStartTermine = {89, 117, 145})  annotation(
    Placement(visible = true, transformation(extent = {{-38, -242}, {22, -182}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft7(UrlaubEndTermine = {187, 215, 243}, UrlaubStartTermine = {173, 201, 229})  annotation(
    Placement(visible = true, transformation(extent = {{-38, -330}, {22, -270}}, rotation = 0)));
  inner PNlib.Settings settings annotation(
    Placement(visible = true, transformation(origin = {140, 340}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(station.placeIn[21], pflegekraft7.transitionOut[3]);
  connect(station.placeIn[20], pflegekraft7.transitionOut[2]);
  connect(station.placeIn[19], pflegekraft7.transitionOut[1]);
  connect(station.placeIn[18], pflegekraft6.transitionOut[3]);
  connect(station.placeIn[17], pflegekraft6.transitionOut[2]);
  connect(station.placeIn[16], pflegekraft6.transitionOut[1]);
  connect(station.placeIn[15], pflegekraft5.transitionOut[3]);
  connect(station.placeIn[14], pflegekraft5.transitionOut[2]);
  connect(station.placeIn[13], pflegekraft5.transitionOut[1]);
  connect(station.placeIn[12], pflegekraft4.transitionOut[3]);
  connect(station.placeIn[11], pflegekraft4.transitionOut[2]);
  connect(station.placeIn[10], pflegekraft4.transitionOut[1]);
  connect(station.placeIn[9], pflegekraft3.transitionOut[3]);
  connect(station.placeIn[8], pflegekraft3.transitionOut[2]);
  connect(station.placeIn[7], pflegekraft3.transitionOut[1]);
  connect(station.placeIn[6], pflegekraft2.transitionOut[3]);
  connect(station.placeIn[5], pflegekraft2.transitionOut[2]);
  connect(station.placeIn[4], pflegekraft2.transitionOut[1]);
  connect(station.placeOut[1], pflegekraft1.transitionIn[1]);
  connect(station.placeOut[2], pflegekraft1.transitionIn[2]);
  connect(station.placeOut[3], pflegekraft1.transitionIn[3]);

  connect(station.placeOut[21], pflegekraft7.transitionIn[3]);
  connect(station.placeOut[20], pflegekraft7.transitionIn[2]);
  connect(station.placeOut[19], pflegekraft7.transitionIn[1]);
  connect(station.placeOut[18], pflegekraft6.transitionIn[3]);
  connect(station.placeOut[17], pflegekraft6.transitionIn[2]);
  connect(station.placeOut[16], pflegekraft6.transitionIn[1]);
  connect(station.placeOut[15], pflegekraft5.transitionIn[3]);
  connect(station.placeOut[14], pflegekraft5.transitionIn[2]);
  connect(station.placeOut[13], pflegekraft5.transitionIn[1]);
  connect(station.placeOut[12], pflegekraft4.transitionIn[3]);
  connect(station.placeOut[11], pflegekraft4.transitionIn[2]);
  connect(station.placeOut[10], pflegekraft4.transitionIn[1]);
  connect(station.placeOut[9], pflegekraft3.transitionIn[3]);
  connect(station.placeOut[8], pflegekraft3.transitionIn[2]);
  connect(station.placeOut[7], pflegekraft3.transitionIn[1]);
  connect(station.placeOut[6], pflegekraft2.transitionIn[3]);
  connect(station.placeOut[5], pflegekraft2.transitionIn[2]);
  connect(station.placeOut[4], pflegekraft2.transitionIn[1]);
  connect(station.placeIn[1], pflegekraft1.transitionOut[1]);
  connect(station.placeIn[2], pflegekraft1.transitionOut[2]);
  connect(station.placeIn[3], pflegekraft1.transitionOut[3]);

  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-150, -350}, {150, 350}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}))/*,
    experiment(StartTime = 0, StopTime = 365, Tolerance = 1e-06)*/);
end Station7;
