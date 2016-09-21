within PNlib;
model Settings "Global Settings for Animation and Display"
  parameter Integer showPlaceName=1 "show names of places" annotation(Dialog(enable = true, group = "Display"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer showTransitionName=1 "show names of transitions" annotation(Dialog(enable = true, group = "Display"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer showDelay=1 "show delays of discrete transitions" annotation(Dialog(enable = true, group = "Display"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer showCapacity=2 "show capacities of places" annotation(Dialog(enable = true, group = "Display"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer animateMarking=1 "animation of markings" annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer animatePlace=1 "animation of places" annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Real scale= 1 "scale factor for place animation 0-100"
                                             annotation(Dialog(enable = if animationPlace==1 then true else false, group = "Animation"));
  parameter Integer animateTransition=1 "animation of transitions"
                                                             annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Real timeFire= 0.3 "time of transition animation"
                                             annotation(Dialog(enable = if animationTransition==1 then true else false, group = "Animation"));
  parameter Integer animatePutFireTime=1
    "animation of putative fire time of stochastic transitions" annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer animateHazardFunc=1
    "animation of hazard functions of stochastic transitions" annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer animateSpeed=1 "animation speed of continuous transitions" annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer animateWeightTIarc=1
    "show weights of test and inhibitor arcs" annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer animateTIarc=1 "animation of test and inhibition arcs"
                                                             annotation(Dialog(enable = true, group = "Animation"), choices(choice=1 "on",
                 choice=2 "off", __Dymola_radioButtons=true));
  parameter Integer N=10 "N+1=amount of levels" annotation(Dialog(enable = true, group = "Level Concentrations"));
  parameter Real M=1 "maximum concentration" annotation(Dialog(enable = true, group = "Level Concentrations"));
  parameter Boolean showTokenFlow = false annotation(Dialog(enable = true, group = "Token flow"));
  parameter Integer globalSeed = 30020 "global seed to initialize random number generator" annotation(Dialog(enable = true, group = "Random Number Generator"));
  annotation(defaultComponentName = "settings", defaultComponentPrefixes = "inner", missingInnerMessage = "The settings object is missing",
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100, -100},
            {100, 100}}),
                       graphics={Rectangle(
          extent={{-98, 98}, {98, -98}},
          lineColor={0, 0, 0},
          fillPattern=FillPattern.Solid,
          fillColor={255, 255, 255}),
                              Text(
          extent={{0, 22}, {0, -22}},
          lineColor={0, 0, 0},
          fillColor={255, 255, 255},
          fillPattern=FillPattern.Solid,
          textString="SETTINGS")}), Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-100, -100}, {100, 100}}),
        graphics));
end Settings;
