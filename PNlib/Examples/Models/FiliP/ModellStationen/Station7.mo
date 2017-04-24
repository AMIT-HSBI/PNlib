within PNlib.Examples.Models.FiliP.ModellStationen;
model Station7
  extends Modelica.Icons.Example;
  extends PNlib.Examples.Models.FiliP.AllgemeineParameter;
  PNlib.Examples.Models.FiliP.Station station(APFD = 1, APND = 1, APSD = 1, nP = 7) annotation(
    Placement(transformation(extent = {{-22, 414}, {18, 454}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft(Dienstbereit(maxTokens = 1), UrlaubEndTermine = {25, 53, 81}, UrlaubStartTermine = {11, 39, 67}, WEF = 2) annotation(
    Placement(visible = true, transformation(extent = {{-34, 322}, {26, 382}}, rotation = 0)));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft1(UrlaubEndTermine = {109, 137, 165}, UrlaubStartTermine = {95, 123, 151}, WEF = 2) annotation(
    Placement(transformation(extent = {{-36, 240}, {24, 300}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft2(UrlaubEndTermine = {193, 221, 249}, UrlaubStartTermine = {179, 207, 235}, WEF = 2) annotation(
    Placement(transformation(extent = {{-38, 150}, {22, 210}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft3(UrlaubEndTermine = {263, 277, 291, 305, 319, 333}, UrlaubStartTermine = {256, 270, 284, 298, 312, 326}, WEF = 3) annotation(
    Placement(transformation(extent = {{-36, 66}, {24, 126}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft4(UrlaubEndTermine = {19, 47, 75}, UrlaubStartTermine = {5, 33, 61})  annotation(
    Placement(transformation(extent = {{-40, -26}, {20, 34}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft5(UrlaubEndTermine = {103, 131, 159}, UrlaubStartTermine = {89, 117, 145})  annotation(
    Placement(transformation(extent = {{-42, -118}, {18, -58}})));
  PNlib.Examples.Models.FiliP.Pflegekraft pflegekraft6(UrlaubEndTermine = {187, 215, 243}, UrlaubStartTermine = {173, 201, 229})  annotation(
    Placement(transformation(extent = {{-42, -206}, {18, -146}})));
equation
  connect(station.placeIn[3], pflegekraft.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 391.95}, {-37, 391.95}, {-37, 372}}));
  connect(station.placeIn[2], pflegekraft.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 391.95}, {-37, 391.95}, {-37, 372}}));
  connect(station.placeIn[1], pflegekraft.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 391.95}, {-37, 391.95}, {-37, 372}}));
  connect(station.placeOut[3], pflegekraft.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {30, 434}, {30, 372}, {29, 372}}));
  connect(station.placeOut[2], pflegekraft.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {30, 434}, {30, 372}, {29, 372}}));
  connect(station.placeOut[1], pflegekraft.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {30, 434}, {30, 372}, {29, 372}}));
  connect(station.placeOut[4], pflegekraft1.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 290.1}, {27, 290.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[5], pflegekraft1.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 290.1}, {27, 290.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[6], pflegekraft1.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 290.1}, {27, 290.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[7], pflegekraft2.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {23.2, 308}, {25, 308}, {25, 200.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[8], pflegekraft2.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 200.1}, {25, 200.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[9], pflegekraft2.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 200.1}, {25, 200.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[10], pflegekraft3.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {23.2, 266}, {27, 266}, {27, 116.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[11], pflegekraft3.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 116.1}, {27, 116.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[12], pflegekraft3.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {26, 434}, {26, 116.1}, {27, 116.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[13], pflegekraft4.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {23.2, 221}, {23, 221}, {23, 24.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[14], pflegekraft4.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {23.2, 219}, {23, 219}, {23, 24.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[15], pflegekraft4.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {23.2, 218}, {23, 218}, {23, 24.1}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[16], pflegekraft5.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {23.2, 173}, {21, 173}, {21, -67.9}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[17], pflegekraft5.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {21, 434}, {21, -67.9}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[18], pflegekraft5.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {22, 434}, {22, -67.9}, {21, -67.9}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[4], pflegekraft1.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 351.95}, {-39, 351.95}, {-39, 290.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[5], pflegekraft1.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 351.95}, {-39, 351.95}, {-39, 290.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[6], pflegekraft1.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 349.95}, {-39, 349.95}, {-39, 290.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[7], pflegekraft2.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 306.95}, {-41, 306.95}, {-41, 200.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[8], pflegekraft2.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 304.95}, {-41, 304.95}, {-41, 200.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[9], pflegekraft2.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 306.95}, {-41, 306.95}, {-41, 200.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[10], pflegekraft3.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 263.95}, {-39, 263.95}, {-39, 116.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[11], pflegekraft3.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 261.95}, {-39, 261.95}, {-39, 116.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[12], pflegekraft3.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 262.95}, {-39, 262.95}, {-39, 116.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[13], pflegekraft4.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 217.95}, {-43, 217.95}, {-43, 24.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[14], pflegekraft4.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 217.95}, {-43, 217.95}, {-43, 24.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[15], pflegekraft4.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 216.95}, {-43, 216.95}, {-43, 24.3}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[16], pflegekraft5.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 173.95}, {-45, 173.95}, {-45, -67.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[17], pflegekraft5.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 172.95}, {-45, 172.95}, {-45, -67.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[18], pflegekraft5.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 171.95}, {-45, 171.95}, {-45, -67.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[19], pflegekraft6.transitionIn[1]) annotation(
    Line(points = {{23.2, 434}, {21, 434}, {21, -155.9}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[20], pflegekraft6.transitionIn[2]) annotation(
    Line(points = {{23.2, 434}, {21, 434}, {21, -155.9}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeOut[21], pflegekraft6.transitionIn[3]) annotation(
    Line(points = {{23.2, 434}, {23.2, 127}, {21, 127}, {21, -155.9}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[19], pflegekraft6.transitionOut[1]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 129.95}, {-45, 129.95}, {-45, -155.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[20], pflegekraft6.transitionOut[2]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 127.95}, {-45, 127.95}, {-45, -155.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  connect(station.placeIn[21], pflegekraft6.transitionOut[3]) annotation(
    Line(points = {{-26.7, 433.9}, {-26.7, 126.95}, {-45, 126.95}, {-45, -155.7}}, color = {0, 0, 0}, smooth = Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-150, -500}, {150, 500}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-150, -500}, {150, 500}})));
end Station7;
