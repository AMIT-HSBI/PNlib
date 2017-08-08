within PNlib.Examples.Models.Printing;
model Maculation "maculation of the printing process"
 parameter Real time_between_macus=18000
    "expected time between two maculations";
 parameter Real time_channel_out=1000
    "Time from pressing the button to the first channel out";
 parameter Real time_macu=600 "expected time of the maculation (button press)";
 parameter Real time_macu_roleChnage=300
    "expected time of the maculation (role chnage)";
 Real NumberMacu=Bundle_in_macu_press.t;
 Boolean macu=bundle_channelOut.t>0;
 Real color[3]=if macu then {255,0,0} else {0,255,0};
 Real h=if pre(bundle_channelOut.t) > 1 then 1/time_macu else 1/time_macu_roleChnage;
  TD channelOut1(
    nIn=2,
    arcWeightOut={1},
    nOut=1,
    delay=time_channel_out)
    annotation(Placement(transformation(extent={{-66,-6},{-46,14}})));
  TD channelOut(
    nIn=2,
    arcWeightOut={2},
    nOut=1,
    delay=1)
    annotation(Placement(transformation(extent={{-64,-64},{-44,-44}})));
  PD start_channelOut(
    nIn=1,
    nOut=1,
    maxTokens=1)
    annotation(Placement(transformation(extent={{-128,-64},{-108,-44}})));
  TDS       pressing_button(nOut=1,
    firingCon=start,
    nIn=1,
    h=1/time_between_macus)
    annotation(Placement(transformation(extent={{-190,-64},{-170,-44}})));
  PD bundle_channelOut(
    nOut=4,
    nIn=2,
    maxTokens=2)
    annotation(Placement(transformation(extent={{4,-28},{24,-8}})));
  TDS Stop_macu(
    nIn=1,
    nOut=1,
    h=h,
    arcWeightIn={pre(bundle_channelOut.t)})
    annotation(Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={56,8})));
  PD bundle_not_channelOut(
    startTokens=1,
    maxTokens=1,
    nOut=3,
    nIn=2) annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-14,36})));
  TA       TA4(testValue=0)
               annotation(Placement(transformation(extent={{-10.0003,-3.5},{10.0001,
            3.50001}},
        rotation=90,
        origin={-54.0001,84.5})));
  TA       TA3(testValue=0)
               annotation(Placement(transformation(extent={{-12.0001,
            -3.99999},{11.9999,4}},
        rotation=0,
        origin={102,-18})));
  TC Macu_press(
    nIn=2,
    nOut=1,
    maximumSpeed=speed,
    arcWeightIn={0,1})
    annotation(Placement(transformation(extent={{128,-28},{148,-8}})));
  PC Bundle_in_macu_press(nIn=1, reStart=reStart)
    annotation(Placement(transformation(extent={{172,-28},{192,-8}})));
  Interfaces.TransitionIn ausschleussen_[2]
    annotation(Placement(transformation(extent={{-198,-6},{-178,14}}),
        iconTransformation(extent={{-200,-10},{-180,10}})));
  Interfaces.PlaceOut makulatur_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-52,110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,90})));
protected
  outer Boolean start;
  outer Boolean reStart;
  outer Real speed;
public
  Interfaces.TransitionIn buendelinMakuPresse_ annotation(Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={120,108}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,90})));
  Modelica.Blocks.Interfaces.RealOutput macuBundle_  annotation(Placement(
        transformation(extent={{172,2},{192,22}}), iconTransformation(extent={{180,
            -12},{200,8}})));
  TD T1(
    nIn=2,
    nOut=2,
    arcWeightIn={pre(bundle_channelOut.t),1})
    annotation(Placement(transformation(extent={{-154,46},{-134,66}})));
  TD T2(nIn=1, nOut=1)
    annotation(Placement(transformation(extent={{-154,-6},{-134,14}})));
  PD P1(nIn=2, nOut=1)
    annotation(Placement(transformation(extent={{-110,-6},{-90,14}})));
  IA IA1(testValue=1)
         annotation(Placement(transformation(
        extent={{-11,-3.99999},{11.0001,3.99999}},
        rotation=180,
        origin={-75,-76})));
equation
  connect(pressing_button.outPlaces[1], start_channelOut.inTransition[1])
    annotation(Line(
      points={{-175.2,-54},{-128.8,-54}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(start_channelOut.outTransition[1], channelOut.inPlaces[1])
    annotation(Line(
      points={{-107.2,-54},{-58.8,-54.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_channelOut.outTransition[1], Stop_macu.inPlaces[1])
    annotation(Line(
      points={{24.8,-18.75},{56,-18.75},{56,3.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Stop_macu.outPlaces[1], bundle_not_channelOut.inTransition[1])
    annotation(Line(
      points={{56,12.8},{56,36.5},{-3.2,36.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_not_channelOut.outTransition[1], channelOut1.inPlaces[1])
        annotation(Line(
      points={{-24.8,36.6667},{-66,36.6667},{-66,36},{-76,36},{-76,3.5},{
          -60.8,3.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_not_channelOut.outTransition[2], channelOut.inPlaces[2])
    annotation(Line(
      points={{-24.8,36},{-84,36},{-84,-53.5},{-58.8,-53.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_not_channelOut.outTransition[3], TA4.inPlace)
    annotation(Line(
      points={{-24.8,35.3333},{-52,35.3333},{-52,63.2203},{-52.5808,
          63.2203}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(TA4.outTransition, makulatur_) annotation(Line(
      points={{-52.5808,86.3954},{-52.5808,91.1977},{-52,91.1977},{-52,
          110}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_channelOut.outTransition[2], TA3.inPlace)     annotation(Line(
      points={{24.8,-18.25},{60,-18.25},{60,-18},{88.0951,-18}},
      color={0,0,0},
      smooth=Smooth.None));

  connect(TA3.outTransition, Macu_press.inPlaces[1])  annotation(Line(
      points={{115.905,-18},{115.794,-18},{115.794,-18.5},{133.2,-18.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Macu_press.outPlaces[1], Bundle_in_macu_press.inTransition[1])
    annotation(Line(
      points={{142.8,-18},{171.2,-18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Macu_press.inPlaces[2], buendelinMakuPresse_)  annotation(Line(
      points={{133.2,-17.5},{120,-17.5},{120,108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Bundle_in_macu_press.pc_t, macuBundle_)    annotation(Line(
      points={{182,-7.2},{182,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(channelOut1.outPlaces[1], bundle_channelOut.inTransition[1])
    annotation(Line(
      points={{-51.2,4},{-24,4},{-24,-18.5},{3.2,-18.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(channelOut.outPlaces[1], bundle_channelOut.inTransition[2])
    annotation(Line(
      points={{-49.2,-54},{-24,-54},{-24,-18},{-10,-18},{-10,-17.5},{3.2,
          -17.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_channelOut.outTransition[3], T1.inPlaces[1])     annotation(
      Line(
      points={{24.8,-17.75},{72,-18},{72,94},{-172,94},{-172,55.5},{
          -148.8,55.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[1], bundle_not_channelOut.inTransition[2])
    annotation(Line(
      points={{-139.2,55.5},{-58,56},{28,56},{28,35.5},{-3.2,35.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ausschleussen_[1], T1.inPlaces[2]) annotation(Line(
      points={{-188,-1},{-192,4},{-172,4},{-172,56.5},{-148.8,56.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ausschleussen_[2], T2.inPlaces[1]) annotation(Line(
      points={{-188,9},{-192,10},{-194,6},{-194,4},{-148.8,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T2.outPlaces[1], P1.inTransition[1]) annotation(Line(
      points={{-139.2,4},{-110.8,4},{-110.8,3.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(P1.outTransition[1], channelOut1.inPlaces[2])    annotation(Line(
      points={{-89.2,4},{-60.8,4.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(T1.outPlaces[2], P1.inTransition[2]) annotation(Line(
      points={{-139.2,56.5},{-120,56.5},{-120,4.5},{-110.8,4.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_channelOut.outTransition[4], IA1.inPlace)
    annotation(Line(
      points={{24.8,-17.25},{38,-17.25},{38,-84},{-50.0317,-84},{-50.0317,
          -85.4545}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(IA1.outTransition,pressing_button. inPlaces[1]) annotation(
      Line(
      points={{-75.5239,-85.4545},{-196,-85.4545},{-196,-54},{-184.8,-54}},
      color={0,0,0},
      smooth=Smooth.None));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-100},
            {200,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-200,-100},{200,100}}), graphics={
        Rectangle(
          extent={{-180,80},{180,-80}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({0,255,0},color),
          fillPattern=FillPattern.Solid),
        Bitmap(
          extent={{-168,58},{-72,-46}},
          imageSource="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"),
        Text(
          extent={{-50,8},{156,-18}},
          lineColor={0,0,0},
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid,
          textString="Maculation Press")}));
end Maculation;
