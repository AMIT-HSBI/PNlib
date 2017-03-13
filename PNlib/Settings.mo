within PNlib;
model Settings "Global Settings for Animation and Display"
  parameter Boolean showPlaceName=true "show names of places" annotation(Dialog(enable = true, group = "Display"));
  parameter Boolean showTransitionName=true "show names of transitions" annotation(Dialog(enable = true, group = "Display"));
  parameter Boolean showTime=true "show Time variables of discrete transitions" annotation(Dialog(enable = true, group = "Display"));
  parameter Boolean showCapacity=false "show capacities of places" annotation(Dialog(enable = true, group = "Display"));
  parameter Boolean animateMarking=true "animation of markings" annotation(Dialog(enable = true, group = "Animation"));
  parameter Boolean animatePlace=true "animation of places" annotation(Dialog(enable = true, group = "Animation"));
  parameter Real scale= 1 "scale factor for place animation 0-100" annotation(Dialog(enable = if animationPlace then true else false, group = "Animation"));
  parameter Boolean animateTransition=true "animation of transitions" annotation(Dialog(enable = true, group = "Animation"));
  parameter Real timeFire= 0.3 "time of transition animation" annotation(Dialog(enable = if animationTransition then true else false, group = "Animation"));
  parameter Boolean animatePutFireTime=true "animation of putative fire time of stochastic transitions" annotation(Dialog(enable = true, group = "Animation"));
  parameter Boolean animateHazardFunc=true "animation of hazard functions of stochastic transitions" annotation(Dialog(enable = true, group = "Animation"));
  parameter Boolean animateSpeed=true "animation speed of continuous transitions" annotation(Dialog(enable = true, group = "Animation"));
  parameter Boolean animateWeightTIarc=true "show weights of test and inhibitor arcs" annotation(Dialog(enable = true, group = "Animation"));
  parameter Boolean animateTIarc=true "animation of test and inhibition arcs" annotation(Dialog(enable = true, group = "Animation"));
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
