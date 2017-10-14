within PNlib.Examples.Models.Senseo;
model Insert_Pad
  "Insert pad: coffee pads are inserted to the Senseo machine (step 5)."

  Components.TS inserting2(
    nIn=1,
    nOut=1,
    arcWeightOut={1},
    h=1/20) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={62,40})));
  Components.PD puffer(
    nOut=1,
    maxTokens=1,
    nIn=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={4,40})));
  Interfaces.TransitionOut insertpad_    annotation(Placement(transformation(
        extent={{-20,-10},{0,10}},
        rotation=0,
        origin={110,40}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={110,-40})));
  Real color[3]=if fac<1 then {80,0,0} else {255,255,255};
  Real startTime;
  Real fac=if (time-startTime)/60<1 and startTime>0 then (time-startTime)/60 else 0;
  Real recsize[2,2]={{-100,80},{-100+200*fac,-80}};
  Interfaces.PlaceIn insert_ annotation(Placement(transformation(extent={{-112,30},
            {-92,50}}), iconTransformation(extent={{-120,-50},{-100,-30}})));
equation
  when  puffer.t>0 then
    startTime=time;
  end when;
  connect(puffer.outTransition[1],inserting2. inPlaces[1]) annotation(Line(
      points={{14.8,40},{57.2,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(inserting2.outPlaces[1], insertpad_) annotation(Line(
      points={{66.8,40},{100,40}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(puffer.inTransition[1], insert_) annotation(Line(
      points={{-6.8,40},{-102,40}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation(Diagram(graphics), Icon(graphics={Rectangle(
          extent={{-100,80},{100,-80}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Rectangle(
          extent=DynamicSelect({{-100,80},{100,-80}},recsize),
          lineColor={0,0,0},
          fillColor=DynamicSelect({255,255,255},color),
          fillPattern=FillPattern.Solid), Text(
          extent={{-78,20},{80,-12}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="Insert Pad")}));
end Insert_Pad;
