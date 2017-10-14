within PNlib.Examples.Models.Printing;
model Start_Stop "starting and stop the printing machine"
  import PNlib;
 parameter Integer number_exemplars=100000
    "Number of exemplares that has to be produced";
 parameter Real timeStopping=300
    "Time that is needed to shut down the machine when it is stopped";
 parameter Real setupTime=3600 "Set-up time";
 parameter Real max_Speed=15 "Maximum speed of the machine in m/s";
 Real speed;
 Real stopTime;
 Real stopTime2;
 Real startTime;
 Boolean reStart;
  PNlib.Components.PD Start(
    nIn=1,
    nOut=1,
    maxTokens=1,
    startTokens=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-80,0})));
  PNlib.Components.TD starting(
    nOut=2,
    nIn=1,
    delay=setupTime) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-50,0})));
  PNlib.Components.PD Stop(
    nIn=1,
    maxTokens=1,
    nOut=1,
    startTokens=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={36,0})));
  PNlib.Components.PD Counter_Orders(nIn=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-22,48})));
  PNlib.Components.TD stopping(
    nIn=2,
    nOut=1,
    arcWeightIn={1,1}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,0})));
  PNlib.Components.TA TA5(testValue=number_exemplars) annotation (Placement(
        transformation(
        extent={{-11,-3.99998},{11,3.99998}},
        rotation=90,
        origin={78,-29})));
  Interfaces.TransitionIn exemplare_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-108}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-90})));
  Boolean start=Start.t>0;
  Real color[3]=if start then {0,255,0} else {255,0,0};
  Modelica.Blocks.Interfaces.RealOutput orders_    annotation(Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-54,48}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-90,-10})));
  Interfaces.TransitionOut rollen_wechsel_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-84,-40}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-90,-60})));
  Modelica.Blocks.Interfaces.RealOutput time_counter_ annotation(Placement(
        transformation(extent={{62,74},{82,94}}), iconTransformation(extent={{80,-20},
            {100,0}})));
  PNlib.Components.TD shutDown(
    nIn=1,
    nOut=2,
    delay=timeStopping) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={8,0})));
  PNlib.Components.PD Stop2(
    nIn=1,
    nOut=1,
    startTokens=1,
    maxTokens=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-24,0})));
  Modelica.Blocks.Math.IntegerToReal integerToReal annotation(Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-38,28})));
equation
  reStart = if Stop2.t>0 then true else false;
  when Stop.t>0 then
    stopTime= time;
  end when;
  when pre(Stop2.t)>0 then
    stopTime2 = time;
  end when;
  when start then
    startTime=time;
  end when;
  time_counter_=time-stopTime2;
  connect(TA5.inPlace, exemplare_) annotation(Line(
      points={{79.3839,-52.5844},{79.3839,-52.987},{80,-52.987},{80,-108}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA5.outTransition, stopping.inPlaces[1])
                                                  annotation(Line(
      points={{79.3839,-27.0923},{79.3839,0.5},{64.8,0.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(stopping.outPlaces[1], Stop.inTransition[1]) annotation(Line(
      points={{55.2,5.55112e-016},{46.8,-1.38778e-015}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(starting.outPlaces[1], Start.inTransition[1])
                                                       annotation(Line(
      points={{-54.8,0.5},{-69.2,-1.38778e-015}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Start.outTransition[1], stopping.inPlaces[2])
                                                       annotation(Line(
      points={{-90.8,1.38778e-015},{-94,1.38778e-015},{-94,66},{80,66},{
          80,-0.5},{64.8,-0.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(starting.outPlaces[2], rollen_wechsel_)
                                                 annotation(Line(
      points={{-54.8,-0.5},{-62,-0.5},{-62,-40},{-84,-40}},
      color={0,0,0},
      smooth=Smooth.None));
algorithm
  if Stop.t>0 then
    if (Stop2.t<1 and (max_Speed-max_Speed/timeStopping*(time-stopTime))>0) then
      speed:=max_Speed - max_Speed/timeStopping*(time - stopTime);
    else
      speed:=0;
    end if;
  else
    if Start.t>0 then
      if (time-startTime<timeStopping and (max_Speed/timeStopping*(time-startTime))<max_Speed) then
        speed:=max_Speed/timeStopping*(time - startTime);
      else
        speed:=15;
      end if;
    else
      speed:=0;
    end if;
  end if;

equation
  connect(Stop.outTransition[1], shutDown.inPlaces[1])        annotation(Line(
      points={{25.2,1.38778e-015},{12.8,-5.55112e-016}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(shutDown.outPlaces[1], Stop2.inTransition[1])        annotation(Line(
      points={{3.2,0.5},{-13.2,-1.38778e-015}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Stop2.outTransition[1], starting.inPlaces[1]) annotation(Line(
      points={{-34.8,1.38778e-015},{-44.4,1.38778e-015},{-44.4,
          -5.55112e-016},{-45.2,-5.55112e-016}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(shutDown.outPlaces[2], Counter_Orders.inTransition[1])
    annotation(Line(
      points={{3.2,-0.5},{-4,-0.5},{-4,48},{-11.2,48}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Counter_Orders.pd_t, integerToReal.u) annotation(Line(
      points={{-22,37.4},{-22,38},{-22,38},{-22,28},{-22,28},{-26,28},{-26,28}},
      color={255,127,0},
      smooth=Smooth.None));

  connect(integerToReal.y, orders_) annotation(Line(
      points={{-49,28},{-54,28},{-54,48}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                      graphics), Icon(graphics={Rectangle(
          extent={{-80,60},{80,-80}},
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,0,0},color),
          fillPattern=FillPattern.Solid), Text(
          extent={{0,6},{0,-28}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Stop/Start")}));
end Start_Stop;
