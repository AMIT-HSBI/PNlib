within PNlib.Examples.Models.PNproBP;
model Waiting
  import PNlib.Components.PD;
  import PNlib.Components.PC;
  import PNlib.Components.T;
  import PNlib.Components.TD;
  import PNlib.Components.TDS;
  import PNlib.Components.TE;
  import PNlib.Components.TES;
  import PNlib.Components.TFD;
  import PNlib.Components.TFDS;
  import PNlib.Components.TT;
  import PNlib.Components.TC;
  import PNlib.Components.TA;
  import PNlib.Components.IA;
  import PNlib.Components.Settings;
  parameter Real delay=1;
   Integer arcWeight=1;
  Boolean fire "firability of continuous transition";
  Integer fireColor[3] "for animation";
  TD T1(
    nIn=1,
    nOut=1,
    delay=0.001,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P1.t) == 0)
            annotation(Placement(transformation(extent={{-20,74},{0,94}})));
  PD Puffer(nOut=24, nIn=1)
    annotation(Placement(transformation(extent={{-70,4},{-50,24}})));
  TD T2(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P2.t) == 0)
            annotation(Placement(transformation(extent={{-20,40},{0,60}})));
  TD T3(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P3.t) == 0)
            annotation(Placement(transformation(extent={{-22,6},{-2,26}})));
  TD T4(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P4.t) == 0)
            annotation(Placement(transformation(extent={{-22,-28},{-2,-8}})));
  TD T5(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P5.t) == 0)
            annotation(Placement(transformation(extent={{-22,-60},{-2,-40}})));
  TD T6(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P6.t) == 0)
            annotation(Placement(transformation(extent={{-22,-94},{-2,-74}})));
  PD P1(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{8,74},{28,94}})));
  TD T7(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P1.t)},
    arcWeightOut={pre(P1.t)},
    firingCon=pre(P1.t) > 0)
            annotation(Placement(transformation(extent={{48,74},{68,94}})));
  Boolean ani "for transition animation";
protected
  outer Settings settings "global settings for animation and display";
  discrete Real fireTime;
public
  PD P2(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{8,40},{28,60}})));
  PD P3(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,6},{26,26}})));
  PD P4(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-28},{26,-8}})));
  PD P5(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-62},{26,-42}})));
  PD P6(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{8,-96},{28,-76}})));
  TD T8(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P2.t)},
    arcWeightOut={pre(P2.t)},
    firingCon=pre(P2.t) > 0)
            annotation(Placement(transformation(extent={{46,40},{66,60}})));
  TD T9(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P3.t)},
    arcWeightOut={pre(P3.t)},
    firingCon=pre(P3.t) > 0)
            annotation(Placement(transformation(extent={{46,6},{66,26}})));
  TD T10(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P4.t)},
    arcWeightOut={pre(P4.t)},
    firingCon=pre(P4.t) > 0)
            annotation(Placement(transformation(extent={{46,-28},{66,-8}})));
  TD T11(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P5.t)},
    arcWeightOut={pre(P5.t)},
    firingCon=pre(P5.t) > 0)
            annotation(Placement(transformation(extent={{46,-62},{66,-42}})));
  TD T12(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P6.t)},
    arcWeightOut={pre(P6.t)},
    firingCon=pre(P6.t) > 0)
            annotation(Placement(transformation(extent={{46,-96},{66,-76}})));
  PD P7(nIn=24, nOut=1)
    annotation(Placement(transformation(extent={{104,-132},{124,-112}})));
  TD T13(
    nOut=1,
    nIn=1,
    arcWeightIn={arcWeight},
    arcWeightOut={arcWeight},
    delay=0.001,
    firingCon=pre(arcWeight) > 0)
    annotation(Placement(transformation(extent={{-98,4},{-78,24}})));
  Interfaces.TransitionIn inPlaces1 annotation(Placement(transformation(extent=
           {{-120,4},{-100,24}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  TD T14(
    nIn=1,
    delay=0.001,
    arcWeightIn={pre(P7.t)},
    nOut=1,
    arcWeightOut={pre(P7.t)},
    firingCon=pre(P7.t) > 0)
            annotation(Placement(transformation(extent={{126,-132},{146,-112}})));
  Interfaces.TransitionOut outPlaces1 annotation(Placement(transformation(
          extent={{176,-136},{196,-116}}),
                                       iconTransformation(extent={{100,-10},{120,
            10}})));
  TD T15(
    nIn=1,
    nOut=1,
    delay=0.001,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P8.t) == 0)
            annotation(Placement(transformation(extent={{-22,-126},{-2,-106}})));
  PD P8(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-126},{26,-106}})));
  TD T16(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P8.t)},
    arcWeightOut={pre(P8.t)},
    firingCon=pre(P8.t) > 0)
            annotation(Placement(transformation(extent={{46,-126},{66,-106}})));
  TD T17(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P9.t) == 0)
            annotation(Placement(transformation(extent={{-22,-160},{-2,-140}})));
public
  PD P9(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-160},{26,-140}})));
  TD T18(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P9.t)},
    arcWeightOut={pre(P9.t)},
    firingCon=pre(P9.t) > 0)
            annotation(Placement(transformation(extent={{44,-160},{64,-140}})));
  TD T19(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P10.t) == 0)
            annotation(Placement(transformation(extent={{-24,-194},{-4,-174}})));
  TD T20(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P11.t) == 0)
            annotation(Placement(transformation(extent={{-24,-228},{-4,-208}})));
  TD T21(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P12.t) == 0)
            annotation(Placement(transformation(extent={{-24,-260},{-4,-240}})));
  TD T22(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P13.t) == 0)
            annotation(Placement(transformation(extent={{-24,-294},{-4,-274}})));
  PD P10(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{4,-194},{24,-174}})));
  PD P11(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{4,-228},{24,-208}})));
  PD P12(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{4,-262},{24,-242}})));
  PD P13(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-296},{26,-276}})));
  TD T23(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P10.t)},
    arcWeightOut={pre(P10.t)},
    firingCon=pre(P10.t) > 0)
            annotation(Placement(transformation(extent={{44,-194},{64,-174}})));
  TD T24(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P11.t)},
    arcWeightOut={pre(P11.t)},
    firingCon=pre(P11.t) > 0)
            annotation(Placement(transformation(extent={{44,-228},{64,-208}})));
  TD T25(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P12.t)},
    arcWeightOut={pre(P12.t)},
    firingCon=pre(P12.t) > 0)
            annotation(Placement(transformation(extent={{44,-262},{64,-242}})));
  TD T26(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P13.t)},
    arcWeightOut={pre(P13.t)},
    firingCon=pre(P13.t) > 0)
            annotation(Placement(transformation(extent={{44,-296},{64,-276}})));
  TD T27(
    nIn=1,
    nOut=1,
    delay=0.001,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P14.t) == 0)
            annotation(Placement(transformation(extent={{-20,-334},{0,-314}})));
  TD T28(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P15.t) == 0)
            annotation(Placement(transformation(extent={{-20,-368},{0,-348}})));
  TD T29(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P16.t) == 0)
            annotation(Placement(transformation(extent={{-22,-402},{-2,
            -382}})));
  TD T30(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P17.t) == 0)
            annotation(Placement(transformation(extent={{-22,-436},{-2,
            -416}})));
  TD T31(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P18.t) == 0)
            annotation(Placement(transformation(extent={{-22,-468},{-2,
            -448}})));
  TD T32(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P19.t) == 0)
            annotation(Placement(transformation(extent={{-22,-502},{-2,
            -482}})));
  PD P14(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{8,-334},{28,-314}})));
  TD T33(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P14.t)},
    arcWeightOut={pre(P14.t)},
    firingCon=pre(P14.t) > 0)
            annotation(Placement(transformation(extent={{48,-334},{68,-314}})));
public
  PD P15(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{8,-368},{28,-348}})));
  PD P16(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-402},{26,-382}})));
  PD P17(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-436},{26,-416}})));
  PD P18(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-470},{26,-450}})));
  PD P19(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{8,-504},{28,-484}})));
  TD T34(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P15.t)},
    arcWeightOut={pre(P15.t)},
    firingCon=pre(P15.t) > 0)
            annotation(Placement(transformation(extent={{46,-368},{66,-348}})));
  TD T35(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P16.t)},
    arcWeightOut={pre(P16.t)},
    firingCon=pre(P16.t) > 0)
            annotation(Placement(transformation(extent={{46,-402},{66,-382}})));
  TD T36(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P17.t)},
    arcWeightOut={pre(P17.t)},
    firingCon=pre(P17.t) > 0)
            annotation(Placement(transformation(extent={{46,-436},{66,-416}})));
  TD T37(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P18.t)},
    arcWeightOut={pre(P18.t)},
    firingCon=pre(P18.t) > 0)
            annotation(Placement(transformation(extent={{44,-470},{64,-450}})));
  TD T38(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P19.t)},
    arcWeightOut={pre(P19.t)},
    firingCon=pre(P19.t) > 0)
            annotation(Placement(transformation(extent={{46,-504},{66,-484}})));
  TD T39(
    nIn=1,
    nOut=1,
    delay=0.001,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P20.t) == 0)
            annotation(Placement(transformation(extent={{-22,-534},{-2,
            -514}})));
  PD P20(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-534},{26,-514}})));
  TD T40(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P20.t)},
    arcWeightOut={pre(P20.t)},
    firingCon=pre(P20.t) > 0)
            annotation(Placement(transformation(extent={{46,-534},{66,-514}})));
  TD T41(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P21.t) == 0)
            annotation(Placement(transformation(extent={{-22,-568},{-2,
            -548}})));
public
  PD P21(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-568},{26,-548}})));
  TD T42(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P21.t)},
    arcWeightOut={pre(P21.t)},
    firingCon=pre(P21.t) > 0)
            annotation(Placement(transformation(extent={{44,-568},{64,-548}})));
  PD P22(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{4,-602},{24,-582}})));
  PD P23(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{4,-636},{24,-616}})));
  PD P24(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{4,-670},{24,-650}})));
  PD P25(nOut=1, nIn=1)
    annotation(Placement(transformation(extent={{6,-704},{26,-684}})));
  TD T43(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P22.t)},
    arcWeightOut={pre(P22.t)},
    firingCon=pre(P22.t) > 0)
            annotation(Placement(transformation(extent={{44,-602},{64,-582}})));
  TD T44(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P23.t)},
    arcWeightOut={pre(P23.t)},
    firingCon=pre(P23.t) > 0)
            annotation(Placement(transformation(extent={{44,-636},{64,-616}})));
  TD T45(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P24.t)},
    arcWeightOut={pre(P24.t)},
    firingCon=pre(P24.t) > 0)
            annotation(Placement(transformation(extent={{44,-670},{64,-650}})));
  TD T46(
    nOut=1,
    nIn=1,
    delay=delay,
    arcWeightIn={pre(P25.t)},
    arcWeightOut={pre(P25.t)},
    firingCon=pre(P25.t) > 0)
            annotation(Placement(transformation(extent={{46,-704},{66,-684}})));
  TD T47(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P22.t) == 0)
            annotation(Placement(transformation(extent={{-24,-602},{-4,
            -582}})));
  TD T48(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P23.t) == 0)
            annotation(Placement(transformation(extent={{-24,-636},{-4,
            -616}})));
  TD T49(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P24.t) == 0)
            annotation(Placement(transformation(extent={{-24,-668},{-4,
            -648}})));
  TD T50(
    nIn=1,
    delay=0.001,
    nOut=1,
    arcWeightIn={pre(Puffer.t)},
    arcWeightOut={pre(Puffer.t)},
    firingCon=pre(Puffer.t) > 0 and pre(P25.t) == 0)
            annotation(Placement(transformation(extent={{-24,-702},{-4,
            -682}})));
equation
  fire=T1.fire or T2.fire or T3.fire or T4.fire or T5.fire or T6.fire;
  when fire then
     fireTime=time;
     ani=true;
  end when;
  fireColor=if (fireTime+settings.timeFire>=time and settings.animateTransition and ani) then {255,255,0} else {128,255,0};

  connect(Puffer.outTransition[1], T1.inPlaces[1]) annotation(Line(
      points={{-49.2,13.0417},{-30,13.0417},{-30,84},{-14.8,84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[2], T2.inPlaces[1]) annotation(Line(
      points={{-49.2,13.125},{-30,13.125},{-30,50},{-14.8,50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[3], T3.inPlaces[1]) annotation(Line(
      points={{-49.2,13.2083},{-46,13.2083},{-46,16},{-16.8,16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[4], T4.inPlaces[1]) annotation(Line(
      points={{-49.2,13.2917},{-30,13.2917},{-30,-18},{-16.8,-18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[5], T5.inPlaces[1]) annotation(Line(
      points={{-49.2,13.375},{-30,13.375},{-30,-50},{-16.8,-50}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[6], T6.inPlaces[1]) annotation(Line(
      points={{-49.2,13.4583},{-30,13.4583},{-30,-84},{-16.8,-84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[1], T7.inPlaces[1]) annotation(Line(
      points={{28.8,84},{36,84},{36,86},{42,86},{42,82},{53.2,84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[1], P1.inTransition[1]) annotation(Line(
      points={{-5.2,84},{-2,84},{-2,86},{2,86},{2,84},{7.2,84}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T2.outPlaces[1], P2.inTransition[1]) annotation(Line(
      points={{-5.2,50},{-2,50},{-2,52},{2,52},{2,50},{7.2,50}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T3.outPlaces[1], P3.inTransition[1]) annotation(Line(
      points={{-7.2,16},{5.2,16}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T4.outPlaces[1], P4.inTransition[1]) annotation(Line(
      points={{-7.2,-18},{5.2,-18}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T5.outPlaces[1], P5.inTransition[1]) annotation(Line(
      points={{-7.2,-50},{-7.2,-52},{5.2,-52}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T6.outPlaces[1], P6.inTransition[1]) annotation(Line(
      points={{-7.2,-84},{-8.88178e-016,-84},{-8.88178e-016,-86},{7.2,-86}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P2.outTransition[1], T8.inPlaces[1]) annotation(Line(
      points={{28.8,50},{34,50},{34,52},{40,52},{40,48},{51.2,50}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P3.outTransition[1], T9.inPlaces[1]) annotation(Line(
      points={{26.8,16},{26.8,16},{51.2,16}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P4.outTransition[1], T10.inPlaces[1]) annotation(Line(
      points={{26.8,-18},{40,-18},{51.2,-18}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P5.outTransition[1], T11.inPlaces[1]) annotation(Line(
      points={{26.8,-52},{40,-52},{51.2,-52}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P6.outTransition[1], T12.inPlaces[1]) annotation(Line(
      points={{28.8,-86},{51.2,-86}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T7.outPlaces[1], P7.inTransition[1]) annotation(Line(
      points={{62.8,84},{68,84},{68,-122.958},{103.2,-122.958}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T8.outPlaces[1], P7.inTransition[2]) annotation(Line(
      points={{60.8,50},{68,50},{68,-122.875},{103.2,-122.875}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T9.outPlaces[1], P7.inTransition[3]) annotation(Line(
      points={{60.8,16},{68,16},{68,-122.792},{103.2,-122.792}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T10.outPlaces[1], P7.inTransition[4]) annotation(Line(
      points={{60.8,-18},{68,-18},{68,-122.708},{103.2,-122.708}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T11.outPlaces[1], P7.inTransition[5]) annotation(Line(
      points={{60.8,-52},{60.8,-121},{103.2,-121},{103.2,-122.625}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T12.outPlaces[1], P7.inTransition[6]) annotation(Line(
      points={{60.8,-86},{68,-86},{68,-122.542},{103.2,-122.542}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T13.outPlaces[1], Puffer.inTransition[1]) annotation(Line(
      points={{-83.2,14},{-83.2,14},{-70.8,14}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T13.inPlaces[1], inPlaces1) annotation(Line(
      points={{-92.8,14},{-110,14}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P7.outTransition[1], T14.inPlaces[1]) annotation(Line(
      points={{124.8,-122},{131.2,-122}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T14.outPlaces[1], outPlaces1) annotation(Line(
      points={{140.8,-122},{186,-122},{186,-126}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T15.outPlaces[1], P8.inTransition[1]) annotation(Line(
      points={{-7.2,-116},{-7.2,-116},{5.2,-116}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P8.outTransition[1], T16.inPlaces[1]) annotation(Line(
      points={{26.8,-116},{51.2,-116}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T17.outPlaces[1], P9.inTransition[1]) annotation(Line(
      points={{-7.2,-150},{-7.2,-150},{5.2,-150}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P9.outTransition[1], T18.inPlaces[1]) annotation(Line(
      points={{26.8,-150},{50,-152},{49.2,-152},{49.2,-150}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T19.outPlaces[1], P10.inTransition[1]) annotation(Line(
      points={{-9.2,-184},{3.2,-184}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T20.outPlaces[1], P11.inTransition[1]) annotation(Line(
      points={{-9.2,-218},{4,-220},{3.2,-220},{3.2,-218}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T21.outPlaces[1], P12.inTransition[1]) annotation(Line(
      points={{-9.2,-250},{-2,-250},{-2,-252},{3.2,-252}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T22.outPlaces[1], P13.inTransition[1]) annotation(Line(
      points={{-9.2,-284},{-2,-284},{-2,-286},{5.2,-286}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P13.outTransition[1], T26.inPlaces[1]) annotation(Line(
      points={{26.8,-286},{38,-286},{49.2,-286}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P12.outTransition[1], T25.inPlaces[1]) annotation(Line(
      points={{24.8,-252},{49.2,-252}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P11.outTransition[1], T24.inPlaces[1]) annotation(Line(
      points={{24.8,-218},{38,-218},{49.2,-218}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P10.outTransition[1], T23.inPlaces[1]) annotation(Line(
      points={{24.8,-184},{36,-184},{49.2,-184}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Puffer.outTransition[7], T15.inPlaces[1]) annotation(Line(
      points={{-49.2,13.5417},{-32,13.5417},{-32,-112},{-32,-116},{-16.8,
          -116}},
      color={0,0,0},
      smooth=Smooth.Bezier));

  connect(Puffer.outTransition[8], T17.inPlaces[1]) annotation(Line(
      points={{-49.2,13.625},{-32,13.625},{-32,-150},{-16.8,-150}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Puffer.outTransition[9], T19.inPlaces[1]) annotation(Line(
      points={{-49.2,13.7083},{-32,13.7083},{-32,-184},{-18.8,-184}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Puffer.outTransition[10], T20.inPlaces[1]) annotation(Line(
      points={{-49.2,13.7917},{-32,13.7917},{-32,-218},{-18.8,-218}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Puffer.outTransition[11], T21.inPlaces[1]) annotation(Line(
      points={{-49.2,13.875},{-32,13.875},{-32,-250},{-18.8,-250}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Puffer.outTransition[12], T22.inPlaces[1]) annotation(Line(
      points={{-49.2,13.9583},{-49.2,-283},{-18.8,-283},{-18.8,-284}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T16.outPlaces[1], P7.inTransition[7]) annotation(Line(
      points={{60.8,-116},{70,-116},{70,-122.458},{103.2,-122.458}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T18.outPlaces[1], P7.inTransition[8]) annotation(Line(
      points={{58.8,-150},{82,-150},{82,-122.375},{103.2,-122.375}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T23.outPlaces[1], P7.inTransition[9]) annotation(Line(
      points={{58.8,-184},{82,-184},{82,-122.292},{103.2,-122.292}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T24.outPlaces[1], P7.inTransition[10]) annotation(Line(
      points={{58.8,-218},{58.8,-170},{103.2,-170},{103.2,-122.208}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T25.outPlaces[1], P7.inTransition[11]) annotation(Line(
      points={{58.8,-252},{82,-252},{82,-122.125},{103.2,-122.125}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T26.outPlaces[1], P7.inTransition[12]) annotation(Line(
      points={{58.8,-286},{82,-286},{82,-122.042},{103.2,-122.042}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P14.outTransition[1], T33.inPlaces[1])
                                               annotation(Line(
      points={{28.8,-324},{36,-324},{36,-322},{42,-322},{42,-326},{53.2,
          -324}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T27.outPlaces[1], P14.inTransition[1])
                                               annotation(Line(
      points={{-5.2,-324},{-2,-324},{-2,-322},{2,-322},{2,-324},{7.2,-324}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T28.outPlaces[1], P15.inTransition[1])
                                               annotation(Line(
      points={{-5.2,-358},{-2,-358},{-2,-356},{2,-356},{2,-358},{7.2,-358}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T29.outPlaces[1], P16.inTransition[1])
                                               annotation(Line(
      points={{-7.2,-392},{5.2,-392}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T30.outPlaces[1], P17.inTransition[1])
                                               annotation(Line(
      points={{-7.2,-426},{5.2,-426}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T31.outPlaces[1], P18.inTransition[1])
                                               annotation(Line(
      points={{-7.2,-458},{-7.2,-460},{5.2,-460}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T32.outPlaces[1], P19.inTransition[1])
                                               annotation(Line(
      points={{-7.2,-492},{0,-492},{0,-494},{7.2,-494}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P15.outTransition[1], T34.inPlaces[1])
                                               annotation(Line(
      points={{28.8,-358},{34,-358},{34,-356},{40,-356},{40,-360},{51.2,
          -358}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P16.outTransition[1], T35.inPlaces[1])
                                               annotation(Line(
      points={{26.8,-392},{26.8,-392},{51.2,-392}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P17.outTransition[1], T36.inPlaces[1])
                                                annotation(Line(
      points={{26.8,-426},{40,-426},{51.2,-426}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P18.outTransition[1], T37.inPlaces[1])
                                                annotation(Line(
      points={{26.8,-460},{49.2,-460}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P19.outTransition[1], T38.inPlaces[1])
                                                annotation(Line(
      points={{28.8,-494},{51.2,-494}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T39.outPlaces[1], P20.inTransition[1])
                                                annotation(Line(
      points={{-7.2,-524},{-7.2,-524},{5.2,-524}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P20.outTransition[1], T40.inPlaces[1])
                                                annotation(Line(
      points={{26.8,-524},{51.2,-524}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T41.outPlaces[1], P21.inTransition[1])
                                                annotation(Line(
      points={{-7.2,-558},{-7.2,-558},{5.2,-558}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P21.outTransition[1], T42.inPlaces[1])
                                                annotation(Line(
      points={{26.8,-558},{50,-560},{49.2,-560},{49.2,-558}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T47.outPlaces[1],P22. inTransition[1]) annotation(Line(
      points={{-9.2,-592},{3.2,-592}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T48.outPlaces[1],P23. inTransition[1]) annotation(Line(
      points={{-9.2,-626},{4,-628},{3.2,-628},{3.2,-626}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T49.outPlaces[1],P24. inTransition[1]) annotation(Line(
      points={{-9.2,-658},{-2,-658},{-2,-660},{3.2,-660}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(T50.outPlaces[1],P25. inTransition[1]) annotation(Line(
      points={{-9.2,-692},{-2,-692},{-2,-694},{5.2,-694}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P25.outTransition[1],T46. inPlaces[1]) annotation(Line(
      points={{26.8,-694},{51.2,-694}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P24.outTransition[1],T45. inPlaces[1]) annotation(Line(
      points={{24.8,-660},{49.2,-660}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P23.outTransition[1],T44. inPlaces[1]) annotation(Line(
      points={{24.8,-626},{38,-626},{49.2,-626}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(P22.outTransition[1],T43. inPlaces[1]) annotation(Line(
      points={{24.8,-592},{36,-592},{49.2,-592}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Puffer.outTransition[13], T27.inPlaces[1]) annotation(Line(
      points={{-49.2,14.0417},{-49.2,-321},{-14.8,-321},{-14.8,-324}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[14], T28.inPlaces[1]) annotation(Line(
      points={{-49.2,14.125},{-30,14.125},{-30,-358},{-14.8,-358}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[15], T29.inPlaces[1]) annotation(Line(
      points={{-49.2,14.2083},{-32,14.2083},{-32,-392},{-16.8,-392}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[16], T30.inPlaces[1]) annotation(Line(
      points={{-49.2,14.2917},{-34,14.2917},{-34,-426},{-16.8,-426}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[17], T31.inPlaces[1]) annotation(Line(
      points={{-49.2,14.375},{-49.2,-455},{-16.8,-455},{-16.8,-458}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[18], T32.inPlaces[1]) annotation(Line(
      points={{-49.2,14.4583},{-49.2,-490},{-16.8,-490},{-16.8,-492}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[19], T39.inPlaces[1]) annotation(Line(
      points={{-49.2,14.5417},{-50,14.5417},{-50,-524},{-16.8,-524}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[20], T41.inPlaces[1]) annotation(Line(
      points={{-49.2,14.625},{-38,14.625},{-38,-558},{-16.8,-558}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[21], T47.inPlaces[1]) annotation(Line(
      points={{-49.2,14.7083},{-49.2,-585},{-18.8,-585},{-18.8,-592}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[22], T48.inPlaces[1]) annotation(Line(
      points={{-49.2,14.7917},{-58,14.7917},{-58,-626},{-18.8,-626}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[23], T49.inPlaces[1]) annotation(Line(
      points={{-49.2,14.875},{-24,-532},{-18.8,-658}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Puffer.outTransition[24], T50.inPlaces[1]) annotation(Line(
      points={{-49.2,14.9583},{-86,14.9583},{-86,-692},{-18.8,-692}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T33.outPlaces[1], P7.inTransition[13]) annotation(Line(
      points={{62.8,-324},{62.8,-225},{103.2,-225},{103.2,-121.958}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T34.outPlaces[1], P7.inTransition[14]) annotation(Line(
      points={{60.8,-358},{84,-358},{84,-128},{103.2,-128},{103.2,-121.875}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(T35.outPlaces[1], P7.inTransition[15]) annotation(Line(
      points={{60.8,-392},{86,-392},{86,-126},{103.2,-126},{103.2,
          -121.792}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(T36.outPlaces[1], P7.inTransition[16]) annotation(Line(
      points={{60.8,-426},{82,-426},{82,-121.708},{103.2,-121.708}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T37.outPlaces[1], P7.inTransition[17]) annotation(Line(
      points={{58.8,-460},{84,-460},{84,-121.625},{103.2,-121.625}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T38.outPlaces[1], P7.inTransition[18]) annotation(Line(
      points={{60.8,-494},{80,-494},{80,-121.542},{103.2,-121.542}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T40.outPlaces[1], P7.inTransition[19]) annotation(Line(
      points={{60.8,-524},{84,-524},{84,-121.458},{103.2,-121.458}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T42.outPlaces[1], P7.inTransition[20]) annotation(Line(
      points={{58.8,-558},{84,-558},{84,-121.375},{103.2,-121.375}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T43.outPlaces[1], P7.inTransition[21]) annotation(Line(
      points={{58.8,-592},{58.8,-358},{103.2,-358},{103.2,-121.292}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T44.outPlaces[1], P7.inTransition[22]) annotation(Line(
      points={{58.8,-626},{58.8,-372},{103.2,-372},{103.2,-121.208}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T45.outPlaces[1], P7.inTransition[23]) annotation(Line(
      points={{58.8,-660},{58.8,-393},{103.2,-393},{103.2,-121.125}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T46.outPlaces[1], P7.inTransition[24]) annotation(Line(
      points={{60.8,-694},{86,-694},{86,-126},{103.2,-126},{103.2,
          -121.042}},
      color={0,0,0},
      smooth=Smooth.None));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-800},
            {100,100}}),
                      graphics), Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-100,-100},{100,100}}),
                                      graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,170,170},
          fillPattern=FillPattern.HorizontalCylinder),
                                          Text(
          extent={{0,59},{0,40}},
          lineColor={0,0,0},
          textString="Waiting"), Text(
          extent={{-4,137},{-4,118}},
          lineColor={0,0,0},
          textString="%name"), Text(
          extent={{-2,-17},{-2,-34}},
          lineColor={0,0,0},
          textString="d=%delay")}));
end Waiting;
