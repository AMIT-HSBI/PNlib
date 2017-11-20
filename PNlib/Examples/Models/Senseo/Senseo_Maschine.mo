within PNlib.Examples.Models.Senseo;
model Senseo_Maschine
  "Senseo machine: the functionality of the Senseo machine (step 4, 6, 7, 8, 9, 10)."
  parameter Real Psenseo=1.450 "power of senseo machine [kW]";
  parameter Real c=4.182 "specific heat capacity [kJ/(kg*K)]";
  parameter Real k=0.01177 "proportionality factor for cooling water";
  parameter Real TE=20 "Environment temperature [°C]";
  parameter Real TC=10 "Temperature of new water [°C]";

  PNlib.Components.TC heating(
    nIn=3,
    nOut=1,
    maximumSpeed=Psenseo/(c*water_hc.t))
                            annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-14,82})));
  PNlib.Components.TA TA1(testValue=0)
               annotation(Placement(transformation(
        extent={{-5.99995,-2.00001},{6.00002,2.00001}},
        rotation=270,
        origin={-40,96})));
  PNlib.Components.TA TA2(testValue=0.34)
    annotation(Placement(transformation(extent={{-86,78},{-70,84}})));
  PNlib.Components.PC TW(
    nIn=2,
    nOut=3,
    maxMarks=90,
    startMarks=20) "water temperature"
    annotation(Placement(transformation(extent={{10,72},{30,92}})));
  PNlib.Components.TC pumping(
    maximumSpeed=0.1,
    nOut=2,
    nIn=1,
    arcWeightOut={1,TC/water_hc.t})
            annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-144,64})));
  PNlib.Components.TC cooling(
    nIn=2,
    maximumSpeed=k*(TW.t - TE),
    firingCon=TW.t > TE)
    annotation(Placement(transformation(extent={{62,72},{82,92}})));
  PNlib.Components.TD stopornext(
    nIn=2,
    firingCon=true,
    delay=1,
    nOut=1)
    annotation(Placement(transformation(extent={{158,100},{178,120}})));
  PNlib.Components.PC water_hc(
    nIn=1,
    nOut=2,
    startMarks=0.25,
    maxMarks=0.25) "water in heating chamber" annotation(Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-144,30})));
  PNlib.Components.TD T1(
    nIn=2,
    nOut=1,
    arcWeightIn={90,1},
    delay=1) annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={52,36})));
  PNlib.Components.TA TA3(testValue=90)
               annotation(Placement(transformation(
        extent={{-6,-2},{6,2}},
        rotation=270,
        origin={46,60})));
  PNlib.Components.PD decision(
    nIn=1,
    maxTokens=1,
    nOut=2,
    enablingType=PNlib.Types.EnablingType.Probability,
    enablingProbOut={0.7,0.3}) annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={32,-32})));
  PNlib.Components.TD T2(
    nIn=1,
    nOut=1,
    delay=1)
            annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-10,-10})));
  PNlib.Components.TD T3(
    nIn=1,
    nOut=1,
    delay=1)
            annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-8,-54})));
  PNlib.Components.PD onecup(nIn=1, nOut=1,
    maxTokens=1)                 annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-46,-10})));
  PNlib.Components.PD twocups(nIn=1, nOut=1,
    maxTokens=1)                  annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-46,-54})));
  PNlib.Components.TD T4(nIn=1, nOut=1,
    arcWeightOut={1})        annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,-10})));
  PNlib.Components.TD T5(nIn=1, nOut=1,
    arcWeightOut={2})        annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-74,-54})));
  PNlib.Components.TC scalding(
    maximumSpeed=0.003125,
    nIn=3,
    nOut=2,
    arcWeightIn={1,1,TW.t/water_hc.t})
            annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-144,-30})));
  TA       RA1(testValue=0)
               annotation(Placement(transformation(extent={{-7,-2.00002},
            {7,2.00002}},
        rotation=90,
        origin={-36,41})));
  PNlib.Components.PC coffee_cup(nIn=1, nOut=1)
                         annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-144,-74})));
  inner PNlib.Components.Settings settings
    annotation(Placement(transformation(extent={{156,-158},{182,-132}})));
  PNlib.Components.PD ready(
    maxTokens=1,
    nIn=1,
    nOut=1,
    startTokens=0)
    annotation(Placement(transformation(extent={{-102,-130},{-82,-110}})));
  PNlib.Components.TD T7(
    nIn=2,
    nOut=2,
    firingCon=pre(disamount.t) > 0,
    arcWeightIn={pre(disamount.t)*0.125,pre(disamount.t)},
    arcWeightOut={pre(disamount.t),1},
    delay=1)                             annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-144,-108})));
  PNlib.Components.PD amountCups(nIn=1) annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-144,-152})));
  PNlib.Components.PD disamount(nIn=3, nOut=2) annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-106,-32})));
  PNlib.Components.PD P1(
    nOut=3,
    maxTokens=1,
    nIn=1)  annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-34,158})));
  PNlib.Components.PD P3(       nOut=1, nIn=1,
    maxTokens=1)             annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={92,142})));
  Modelica.Blocks.Interfaces.RealOutput coffee_cup_ annotation(Placement(
        transformation(extent={{-114,-84},{-94,-64}}),
                                                     iconTransformation(extent={{100,40},
            {120,60}})));
  Modelica.Blocks.Interfaces.IntegerOutput amount_cups_ annotation(Placement(
        transformation(extent={{-124,-162},{-104,-142}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,190})));
  Interfaces.TransitionIn watertank_[2]
    annotation(Placement(transformation(extent={{-200,72},{-180,92}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,-124})));
  Interfaces.TransitionOut stopornext_ annotation(Placement(transformation(
          extent={{202,100},{222,120}}),
                                       iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-94,-120})));
  Interfaces.PlaceIn startheating_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-34,190}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-96,94})));
  Interfaces.PlaceIn padinsert_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={92,190}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-22,190})));
  Modelica.Blocks.Interfaces.RealOutput tw_ annotation(Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,124}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,152})));
  IA IA1(testValue=1)
    annotation(Placement(transformation(extent={{24,134},{40,140}})));
equation
  connect(TA1.outTransition, heating.inPlaces[1]) annotation(Line(
      points={{-34.303,90.0173},{-34.303,82.009},{-18.8,82.009},{-18.8,
          81.3333}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(TA2.outTransition, heating.inPlaces[2]) annotation(Line(
      points={{-68.7302,81},{-18.8,82}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(heating.outPlaces[1], TW.inTransition[1]) annotation(Line(
      points={{-9.2,82},{0,82},{0,81.5},{9.2,81.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TW.outTransition[1], cooling.inPlaces[1]) annotation(Line(
      points={{30.8,81.3333},{42,81.3333},{42,81.5},{67.2,81.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pumping.outPlaces[1], water_hc.inTransition[1]) annotation(Line(
      points={{-144.5,59.2},{-144.5,50},{-144,50},{-144,40.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TW.outTransition[2], TA3.inPlace) annotation(Line(
      points={{30.8,82},{51.697,82},{51.697,67.9221}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA3.outTransition, T1.inPlaces[1]) annotation(Line(
      points={{51.697,54.0173},{51.697,45.0087},{51.5,45.0087},{51.5,40.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[1], decision.inTransition[1]) annotation(Line(
      points={{52,31.2},{52,-32},{42.8,-32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(decision.outTransition[1], T2.inPlaces[1]) annotation(Line(
      points={{21.2,-31.5},{8,-31.5},{8,-10},{-5.2,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(decision.outTransition[2], T3.inPlaces[1]) annotation(Line(
      points={{21.2,-32.5},{8,-32.5},{8,-54},{-3.2,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T2.outPlaces[1], onecup.inTransition[1]) annotation(Line(
      points={{-14.8,-10},{-25,-10},{-25,-10},{-35.2,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T3.outPlaces[1], twocups.inTransition[1]) annotation(Line(
      points={{-12.8,-54},{-35.2,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(onecup.outTransition[1], T4.inPlaces[1]) annotation(Line(
      points={{-56.8,-10},{-63,-10},{-63,-10},{-69.2,-10}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(twocups.outTransition[1], T5.inPlaces[1]) annotation(Line(
      points={{-56.8,-54},{-69.2,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(water_hc.outTransition[1], scalding.inPlaces[1]) annotation(Line(
      points={{-144.5,19.2},{-144,8},{-144,-25.2},{-144.667,-25.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(RA1.outTransition, heating.inPlaces[3]) annotation(Line(
      points={{-34.4748,42.8586},{-34.5238,42.8586},{-34.5238,82.6667},{
          -18.8,82.6667}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(water_hc.outTransition[2], RA1.inPlace) annotation(Line(
      points={{-143.5,19.2},{-143.5,14},{-34,14},{-34,26.6363},{-34.4748,
          26.6363}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(scalding.outPlaces[1], coffee_cup.inTransition[1])
                                                         annotation(Line(
      points={{-144.5,-34.8},{-144.5,-34},{-144,-34},{-144,-63.2}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(coffee_cup.outTransition[1], T7.inPlaces[1]) annotation(Line(
      points={{-144,-84.8},{-144,-103.2},{-144.5,-103.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T7.outPlaces[1], amountCups.inTransition[1]) annotation(Line(
      points={{-144.5,-112.8},{-144.5,-119},{-144,-119},{-144,-141.2}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(T7.outPlaces[2], ready.inTransition[1]) annotation(Line(
      points={{-143.5,-112.8},{-144,-112.8},{-144,-120},{-102.8,-120}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T4.outPlaces[1], disamount.inTransition[1]) annotation(Line(
      points={{-78.8,-10},{-95.2,-31.3333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T5.outPlaces[1], disamount.inTransition[2]) annotation(Line(
      points={{-78.8,-54},{-95.2,-32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(disamount.outTransition[1], T7.inPlaces[2]) annotation(Line(
      points={{-116.8,-31.5},{-126,-31.5},{-126,-94},{-143.5,-94},{-143.5,
          -103.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(disamount.outTransition[2], scalding.inPlaces[2]) annotation(Line(
      points={{-116.8,-32.5},{-126,-32.5},{-126,-12},{-144,-12},{-144,-25.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(scalding.outPlaces[2], disamount.inTransition[3]) annotation(Line(
      points={{-143.5,-34.8},{-143.5,-46},{-90,-46},{-90,-32.6667},{-95.2,
          -32.6667}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(P1.outTransition[1], TA1.inPlace) annotation(Line(
      points={{-34.6667,147.2},{-34.6667,114.361},{-34.303,114.361},{
          -34.303,103.922}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(P1.outTransition[2], stopornext.inPlaces[1])
                                                     annotation(Line(
      points={{-34,147.2},{-34,110},{163.2,110},{163.2,109.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ready.outTransition[1], stopornext.inPlaces[2])
                                                        annotation(Line(
      points={{-81.2,-120},{116,-120},{116,110.5},{163.2,110.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P3.outTransition[1], T1.inPlaces[2]) annotation(Line(
      points={{92,131.2},{92,48},{52,48},{52,40.8},{52.5,40.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(coffee_cup.pc_t, coffee_cup_) annotation(Line(
      points={{-133.2,-74},{-104,-74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(amountCups.pd_t, amount_cups_) annotation(Line(
      points={{-133.4,-152},{-114,-152}},
      color={255,127,0},
      smooth=Smooth.None));

  connect(stopornext.outPlaces[1], stopornext_) annotation(Line(
      points={{172.8,110},{212,110}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(watertank_[1], TA2.inPlace) annotation(Line(
      points={{-190,77},{-190,81},{-87.2698,81}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(watertank_[2], pumping.inPlaces[1]) annotation(Line(
      points={{-190,87},{-190,82},{-144,82},{-144,68.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.inTransition[1], startheating_) annotation(Line(
      points={{-34,168.8},{-34,190}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P3.inTransition[1], padinsert_) annotation(Line(
      points={{92,152.8},{92,190}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pumping.outPlaces[2], TW.inTransition[2]) annotation(Line(
      points={{-143.5,59.2},{-143.5,52},{0,52},{0,82.5},{9.2,82.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TW.outTransition[3], scalding.inPlaces[3]) annotation(Line(
      points={{30.8,82.6667},{34,82.6667},{34,10},{-143.333,10},{-143.333,
          -25.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TW.pc_t, tw_) annotation(Line(
      points={{20,92.8},{20,124}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(P1.outTransition[3], IA1.inPlace) annotation(Line(
      points={{-33.3333,147.2},{-32,147.2},{-32,138},{22.7302,138},{
          22.7302,137}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(IA1.outTransition, cooling.inPlaces[2]) annotation(Line(
      points={{41.2698,137},{60,137},{60,82.5},{67.2,82.5}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},
            {220,200}}),
                    graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{
            220,200}}),
        graphics={Bitmap(
          extent={{-238,180},{254,-180}},
          imageSource="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"
               + "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"
               + "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")}),
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{220,
            200}}), graphics));
end Senseo_Maschine;
