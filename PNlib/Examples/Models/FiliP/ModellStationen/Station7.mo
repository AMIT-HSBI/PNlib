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
  connect(station.placeIn[21], pflegekraft7.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 2.95001}, {-41, 2.95001}, {-41, -279.7}}));
  connect(station.placeIn[20], pflegekraft7.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 154.925}, {-22.7, 154.925}, {-22.7, 3.95001}, {-41, 3.95001}, {-41, -142.875}, {-41, -142.875}, {-41, -279.7}}));
  connect(station.placeIn[19], pflegekraft7.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 152.925}, {-22.7, 152.925}, {-22.7, 5.95001}, {-41, 5.95001}, {-41, -138.875}, {-41, -138.875}, {-41, -279.7}}));
  connect(station.placeOut[21], pflegekraft7.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {27.2, 156.5}, {27.2, 156.5}, {27.2, 3}, {25, 3}, {25, -279.9}}));
  connect(station.placeOut[20], pflegekraft7.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {26.1, 310}, {26.1, 310}, {25, 310}, {25, 13.05}, {25, 13.05}, {25, -279.9}}));
  connect(station.placeOut[19], pflegekraft7.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {26.1, 310}, {26.1, 310}, {25, 310}, {25, 13.05}, {25, 13.05}, {25, -279.9}}));
  connect(station.placeIn[18], pflegekraft6.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 176.925}, {-22.7, 176.925}, {-22.7, 47.95}, {-41, 47.95}, {-41, -76.875}, {-41, -76.875}, {-41, -191.7}}));
  connect(station.placeIn[17], pflegekraft6.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 48.95}, {-41, 48.95}, {-41, -191.7}}));
  connect(station.placeIn[16], pflegekraft6.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 174.925}, {-22.7, 174.925}, {-22.7, 49.95}, {-41, 49.95}, {-41, -72.875}, {-41, -72.875}, {-41, -191.7}}));
  connect(station.placeOut[18], pflegekraft6.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {26, 310}, {26, -191.9}, {25, -191.9}}));
  connect(station.placeOut[17], pflegekraft6.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {26.1, 310}, {26.1, 310}, {25, 310}, {25, 57.05}, {25, 57.05}, {25, -191.9}}));
  connect(station.placeOut[16], pflegekraft6.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {27.2, 49}, {25, 49}, {25, -191.9}}));
  connect(station.placeIn[15], pflegekraft5.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 92.95}, {-39, 92.95}, {-39, -3.37499}, {-39, -3.37499}, {-39, -99.7}}));
  connect(station.placeIn[14], pflegekraft5.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 201.925}, {-22.7, 201.925}, {-22.7, 93.95}, {-39, 93.95}, {-39, -99.7}}));
  connect(station.placeIn[13], pflegekraft5.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 93.95}, {-39, 93.95}, {-39, -99.7}}));
  connect(station.placeOut[15], pflegekraft5.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {27.2, 94}, {27, 94}, {27, -99.9}}));
  connect(station.placeOut[14], pflegekraft5.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {27.2, 202.5}, {27.2, 202.5}, {27.2, 95}, {27, 95}, {27, -99.9}}));
  connect(station.placeOut[13], pflegekraft5.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {27.2, 201.5}, {27.2, 201.5}, {27.2, 97}, {27, 97}, {27, -6.45}, {27, -6.45}, {27, -99.9}}));
  connect(station.placeIn[12], pflegekraft4.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 219.425}, {-22.7, 219.425}, {-22.7, 138.95}, {-35, 138.95}, {-35, 63.625}, {-35, 63.625}, {-35, -7.69998}}));
  connect(station.placeIn[11], pflegekraft4.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 137.95}, {-35, 137.95}, {-35, 65.125}, {-35, 65.125}, {-35, -7.69998}}));
  connect(station.placeIn[10], pflegekraft4.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 224.925}, {-22.7, 224.925}, {-22.7, 139.95}, {-35, 139.95}, {-35, -7.69998}}));
  connect(station.placeOut[12], pflegekraft4.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {28.6, 310}, {28.6, 310}, {30, 310}, {30, -7.9}, {30.5, -7.9}, {30.5, -7.9}, {31, -7.9}}));
  connect(station.placeOut[11], pflegekraft4.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {28.6, 310}, {28.6, 310}, {30, 310}, {30, -7.9}, {30.5, -7.9}, {30.5, -7.9}, {31, -7.9}}));
  connect(station.placeOut[10], pflegekraft4.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {27.2, 142}, {31, 142}, {31, 67.05}, {31, 67.05}, {31, -7.9}}));
  connect(station.placeIn[9], pflegekraft3.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 241.425}, {-22.7, 241.425}, {-22.7, 182.95}, {-37, 182.95}, {-37, 127.625}, {-37, 127.625}, {-37, 76.3}}));
  connect(station.placeIn[8], pflegekraft3.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 180.95}, {-37, 180.95}, {-37, 76.3}}));
  connect(station.placeIn[7], pflegekraft3.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 182.95}, {-37, 182.95}, {-37, 129.625}, {-37, 129.625}, {-37, 76.3}}));
  connect(station.placeOut[9], pflegekraft3.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {30, 310}, {30, 76.1}, {29, 76.1}}));
  connect(station.placeOut[8], pflegekraft3.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {28.6, 310}, {28.6, 310}, {30, 310}, {30, 76.1}, {29, 76.1}}));
  connect(station.placeOut[7], pflegekraft3.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {27.2, 184}, {29, 184}, {29, 130.05}, {29, 130.05}, {29, 76.1}}));
  connect(station.placeIn[6], pflegekraft2.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 267.925}, {-22.7, 267.925}, {-22.7, 225.95}, {-35, 225.95}, {-35, 166.3}}));
  connect(station.placeIn[5], pflegekraft2.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 268.925}, {-22.7, 268.925}, {-22.7, 227.95}, {-35, 227.95}, {-35, 166.3}}));
  connect(station.placeIn[4], pflegekraft2.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 266.925}, {-22.7, 266.925}, {-22.7, 227.95}, {-35, 227.95}, {-35, 192.125}, {-35, 192.125}, {-35, 166.3}}));
  connect(station.placeOut[6], pflegekraft2.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {28.6, 310}, {28.6, 310}, {30, 310}, {30, 166.1}, {30.5, 166.1}, {30.5, 166.1}, {31, 166.1}}));
  connect(station.placeOut[5], pflegekraft2.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {30, 310}, {30, 166.1}, {31, 166.1}}));
  connect(station.placeOut[4], pflegekraft2.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {28.6, 310}, {28.6, 310}, {30, 310}, {30, 166.1}, {30.5, 166.1}, {30.5, 166.1}, {31, 166.1}}));
  connect(station.placeOut[1], pflegekraft1.transitionIn[1]) annotation(
    Line(points = {{27.2, 310}, {34, 310}, {34, 248}, {33, 248}}));
  connect(station.placeOut[2], pflegekraft1.transitionIn[2]) annotation(
    Line(points = {{27.2, 310}, {30.6, 310}, {30.6, 310}, {34, 310}, {34, 248}, {33.5, 248}, {33.5, 248}, {33, 248}}));
  connect(station.placeOut[3], pflegekraft1.transitionIn[3]) annotation(
    Line(points = {{27.2, 310}, {34, 310}, {34, 248}, {33.5, 248}, {33.5, 248}, {33, 248}}));
  connect(station.placeIn[1], pflegekraft1.transitionOut[1]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 288.925}, {-22.7, 288.925}, {-22.7, 267.95}, {-33, 267.95}, {-33, 248}}));
  connect(station.placeIn[2], pflegekraft1.transitionOut[2]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 283.925}, {-22.7, 283.925}, {-22.7, 267.95}, {-33, 267.95}, {-33, 255.975}, {-33, 255.975}, {-33, 248}}));
  connect(station.placeIn[3], pflegekraft1.transitionOut[3]) annotation(
    Line(points = {{-22.7, 309.9}, {-22.7, 286.925}, {-22.7, 286.925}, {-22.7, 267.95}, {-33, 267.95}, {-33, 252.975}, {-33, 252.975}, {-33, 248}}));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-150, -350}, {150, 350}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}))/*,
    experiment(StartTime = 0, StopTime = 365, Tolerance = 1e-06)*/);
end Station7;
