within PNlib.Examples.Models.Printing;
model PrintingMachine "printing machine"

  TC printing(
    nOut=2,
    maximumSpeed=speed,
    nIn=1)
    annotation(Placement(transformation(extent={{-146,70},{-126,90}})));
  PC printed_paper(
    nIn=1,
    nOut=1,
    reStart=reStart) "[m]"
    annotation(Placement(transformation(extent={{-94,70},{-74,90}})));
  TC cutting(
    nIn=1,
    nOut=1,
    maximumSpeed=speed,
    arcWeightIn={1.2})
    annotation(Placement(transformation(extent={{-64,70},{-44,90}})));
  PC Sections(
    nIn=1,
    nOut=1,
    reStart=reStart) "m"
    annotation(Placement(transformation(extent={{-30,70},{-10,90}})));
  TC fold(
    nIn=1,
    nOut=1,
    arcWeightOut={2},
    maximumSpeed=speed)
    annotation(Placement(transformation(extent={{4,70},{24,90}})));
  PC FoldedSections(
    nIn=1,
    nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{40,70},{60,90}})));
  TC bundle(
    nIn=1,
    nOut=1,
    arcWeightIn={2},
    maximumSpeed=speed)
    annotation(Placement(transformation(extent={{74,70},{94,90}})));
  PC Bundle(
    nIn=1,
    nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{-172,-6},{-152,14}})));
  TC chainUp(
    nIn=1,
    nOut=2,
    maximumSpeed=speed)
    annotation(Placement(transformation(extent={{-140,-6},{-120,14}})));
  PC Bundle_on_chain(
    nIn=1,
    nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{-96,-6},{-76,14}})));
  TC       Chain_to_macu_press(
    nIn=2,
    nOut=1,
    arcWeightIn={1,999},
    maximumSpeed=speed)
    annotation(Placement(transformation(extent={{-54,-6},{-34,14}})));
 PC bundle_at_macu_press(
    nIn=1,
    nOut=2,
    reStart=reStart)
            annotation(Placement(transformation(extent={{-6,-6},{14,14}})));
  PC                        Chain_full(nOut=1, nIn=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{-100,-42},{-80,-22}})));
  TA       TA1(testValue=999)
    annotation(Placement(transformation(extent={{-7.49998,-2.50001},{7.49994,2.50001}},
        rotation=90,
        origin={-62.5,-6.5})));
  TC       chain_up2(
    nOut=2,
    maximumSpeed=speed,
    arcWeightIn={1,0},
    nIn=2) annotation(Placement(transformation(extent={{50,-6},{70,14}})));
  PC Bundle_on_chain2(
    nIn=1,
    nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{104,-6},{124,14}})));
  TC       chain1(
    nIn=2,
    nOut=2,
    arcWeightIn={1,999},
    maximumSpeed=speed)
    annotation(Placement(transformation(extent={{156,-6},{176,14}})));
  PC                        Chain_full2(nIn=1, nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{102,-42},{122,-22}})));
  TA       TA2(testValue=999)
               annotation(Placement(transformation(extent={{-8.5,-2.50012},{8.5,
            2.50015}},
        rotation=90,
        origin={135.5,-5.5})));
  PC                        Counter_exemplars(nIn=1, nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={180,68})));
  PC                        Exemplars(nIn=1, nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{-164,-100},{-144,-80}})));
  TC Exemplars_Packets(
    nIn=1,
    nOut=1,
    arcWeightIn={240},
    maximumSpeed=1)
    annotation(Placement(transformation(extent={{-122,-100},{-102,-80}})));
  PC Packets(
    nIn=1,
    nOut=1,
    reStart=reStart)
    annotation(Placement(transformation(extent={{-84,-100},{-64,-80}})));
  TC Packets_Pallet(
    nIn=1,
    nOut=1,
    arcWeightIn={100})
    annotation(Placement(transformation(extent={{-42,-100},{-22,-80}})));
  PC Pallets(nIn=1, reStart=reStart)
    annotation(Placement(transformation(extent={{-4,-100},{16,-80}})));
  Interfaces.TransitionIn drucken_
    annotation(Placement(transformation(extent={{-214,70},{-194,90}}),
        iconTransformation(extent={{-166,-10},{-146,10}})));
  Interfaces.TransitionIn maku_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-134}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-122})));
  Interfaces.PlaceOut ausschleussen annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={28,-134}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={74,-122})));
protected
  outer Real speed;
  outer Boolean reStart;
public
  Modelica.Blocks.Interfaces.RealOutput number_exemplars_ annotation(
      Placement(transformation(extent={{142,58},{162,78}}),
        iconTransformation(extent={{150,70},{170,90}})));
  Interfaces.PlaceOut exemplare_ annotation(Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={178,130}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-90,120})));
  PC Counter_paper(nIn=1, reStart=reStart)
    annotation(Placement(transformation(extent={{-96,102},{-76,122}})));
  Modelica.Blocks.Interfaces.RealOutput papier_total_ annotation(
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-86,140}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={160,40})));
equation
  connect(printing.outPlaces[1], printed_paper.inTransition[1])
                                               annotation(Line(
      points={{-131.2,79.5},{-113,79.5},{-113,80},{-94.8,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(printed_paper.outTransition[1], cutting.inPlaces[1])
                                               annotation(Line(
      points={{-73.2,80},{-58.8,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(cutting.outPlaces[1], Sections.inTransition[1])
                                               annotation(Line(
      points={{-49.2,80},{-30.8,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Sections.outTransition[1], fold.inPlaces[1])
                                               annotation(Line(
      points={{-9.2,80},{9.2,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(fold.outPlaces[1], FoldedSections.inTransition[1])
                                               annotation(Line(
      points={{18.8,80},{39.2,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(FoldedSections.outTransition[1], bundle.inPlaces[1])
                                               annotation(Line(
      points={{60.8,80},{79.2,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle.outPlaces[1], Bundle.inTransition[1])
                                               annotation(Line(
      points={{88.8,80},{112,80},{112,48},{-182,48},{-182,4},{-172.8,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Bundle.outTransition[1], chainUp.inPlaces[1])
                                               annotation(Line(
      points={{-151.2,4},{-134.8,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(chainUp.outPlaces[1], Bundle_on_chain.inTransition[1])
                                               annotation(Line(
      points={{-125.2,3.5},{-96.8,3.5},{-96.8,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Bundle_on_chain.outTransition[1], Chain_to_macu_press.inPlaces[1])
                                               annotation(Line(
      points={{-75.2,4},{-62,4},{-62,3.5},{-48.8,3.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Chain_to_macu_press.outPlaces[1], bundle_at_macu_press.inTransition[
    1])                                        annotation(Line(
      points={{-39.2,4},{-6.8,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA1.outTransition,Chain_to_macu_press. inPlaces[2])
                                             annotation(Line(
      points={{-61.2879,-4.93079},{-61.2879,3},{-48.8,3},{-48.8,4.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA1.inPlace,Chain_full. outTransition[1])
                                             annotation(Line(
      points={{-61.2879,-22.3117},{-61.2879,-32},{-79.2,-32}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Chain_full.inTransition[1], chainUp.outPlaces[2])
                                                annotation(Line(
      points={{-100.8,-32},{-118,-32},{-118,4.5},{-125.2,4.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(chain_up2.outPlaces[1], Bundle_on_chain2.inTransition[1])
                                               annotation(Line(
      points={{64.8,3.5},{78,3.5},{78,4},{103.2,4}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Bundle_on_chain2.outTransition[1], chain1.inPlaces[1])
                                               annotation(Line(
      points={{124.8,4},{161.2,4},{161.2,3.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Chain_full2.inTransition[1],chain_up2. outPlaces[2])
                                                annotation(Line(
      points={{101.2,-32},{76,-32},{76,4},{64.8,4},{64.8,4.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Chain_full2.outTransition[1],TA2. inPlace)
                                             annotation(Line(
      points={{122.8,-32},{138.4,-32},{138.4,-23.0261},{137.268,-23.0261}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(TA2.outTransition,chain1. inPlaces[2])
                                             annotation(Line(
      points={{137.268,-3.32772},{136,-6},{136,4},{161.2,4},{161.2,4.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(chain1.outPlaces[2],Counter_exemplars. inTransition[1])
                                                annotation(Line(
      points={{170.8,4.5},{180,4.5},{180,57.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Exemplars.outTransition[1], Exemplars_Packets.inPlaces[1])
                                                annotation(Line(
      points={{-143.2,-90},{-116.8,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Exemplars_Packets.outPlaces[1], Packets.inTransition[1])
                                                 annotation(Line(
      points={{-107.2,-90},{-84.8,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Packets.outTransition[1], Packets_Pallet.inPlaces[1])
                                                 annotation(Line(
      points={{-63.2,-90},{-36.8,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Packets_Pallet.outPlaces[1], Pallets.inTransition[1])
                                                 annotation(Line(
      points={{-27.2,-90},{-4.8,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(chain1.outPlaces[1],Exemplars. inTransition[1])
                                               annotation(Line(
      points={{170.8,3.5},{182,3.5},{182,-54},{-186,-54},{-186,-90},{-164.8,-90}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(printing.inPlaces[1], drucken_)
                                         annotation(Line(
      points={{-140.8,80},{-204,80}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_at_macu_press.outTransition[1], chain_up2.inPlaces[1])
    annotation(Line(
      points={{14.8,3.5},{55.2,3.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(chain_up2.inPlaces[2], maku_) annotation(Line(
      points={{55.2,4.5},{50,4.5},{50,-134}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(bundle_at_macu_press.outTransition[2], ausschleussen)   annotation(
      Line(
      points={{14.8,4.5},{28,4.5},{28,-134}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Counter_exemplars.pc_t,number_exemplars_)  annotation(Line(
      points={{169.2,68},{152,68}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Counter_exemplars.outTransition[1], exemplare_) annotation(
      Line(
      points={{180,78.8},{180,130},{178,130}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(printing.outPlaces[2], Counter_paper.inTransition[1])
    annotation(Line(
      points={{-131.2,80.5},{-120,80.5},{-120,112},{-96.8,112}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Counter_paper.pc_t, papier_total_)  annotation(Line(
      points={{-86,122.8},{-86,140}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,
            -125},{200,125}}),
                         graphics), Icon(coordinateSystem(preserveAspectRatio=true,
          extent={{-200,-125},{200,125}}), graphics={Bitmap(
          extent={{-168,110},{172,-112}},
          imageSource="/9j/4AAQSkZJRgABAQEAlgCWAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMgIyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAHhAoEDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD2IClxSCnVgkMMUYpaa8ixrljxV2Qh1FVvtq9dpx61NHKsq7kORTUkx2H0UUVYgooooAKKKKACiimySLFGzucKoyaLgOqpe6lbWAzO+GPRV5Y/hWbd6zNKSlopQdN7df8A61ZotC7l5mLsepJzmsZVUtilFli6166u8paJ5KHjceWP+FUY7LLF5WLMTkk8k1fjgwOBiplhx2rKU29y1GxWjgAACgCrCQgc1MExUirU3KsRrGB2qQJUix561KsYFAiJYyakWP1qQLTsYpiGhcdqeBQBThTsIAKMUuKXFMVyOeaO1t5J5m2xxqWZvQDrTbK7g1CziurWQSQSruRx3FQ61C0+h30SkBnt3AJOOxqv4Vtms/CumQOQWS3QHByM4q+XS4uhq4pcUUtHKIKKM8ZqndavY2efOuEDD+EHJ/IU9EBcormrrxlbpkW0Duexc7R/jWLd+Lb6YECVYl9Ixg/nRzIDu5Z4oF3TSIg9WOKy7nxRp9uSEkaZh2jHH5157cam0rFpHaRvViTVZruRug/OldhY7K78ZzNkW0UcQ9WO4/4ViXmu3Vznz7l2H93dgfkKxC7t95j+FN+UdaB2LjXvZc/hUTTu3oPrzUO7PCjP0oJI+8Qv1OKLBcexLj52JHpTPLjH8IppkX+8W/3RUUwWaPyWynmnYGGWPPoBQBIVjbhR+VNMLjoxUe5xV600PUHTYiOIwSFLAJkduK0rfwhO+DLIB64Gf1NJ8o7M55QRwZ8+yjNDzbPuxO59zj+VdlB4Vsov9e+7/eb/AAq7HaadaD5I0z7AUcwreZwcS3LKXeIwRDrJsOBTylqy7nvGY/7uf613b39sikCNSP8Aa5rKu59PcM4gtwqMDIFQcj3qXJjUUZWhaRBrMsiWzTyeVjeVQBVz05roIfDlhB99VZh/eOanguLGzt9hV1LLuYW/ygenTrWTd3dyJCIlzGRkM5wT+FO7Y3oR6aLD/hK78FQHgiCovHGWIJHp0Area+t4/uouffmuKu9Mubi9F7BdJb3XRnVc7h6H1/8ArVbhtmEf+lXLzvnqPlH5CnysVzoZdbROAwHsKqtq7yZ2K7fhWeiRRn5Ixmp0imlPyQufwNHKA9ry5kPQKPds1ExmYcy4+gq0ml3sn/LPaPc1YTQLh/8AWOo+nNGiCzMry1/jdm+poCRL91B+VbyeHo1/1kjH8cVOmk2Uf3sH6nNHMgs+5zm4scYyfenrDPJ92Nj+FdIEsofuhfwFI19bp0Ao5gsjCXTLp/4MD3NTx6DM33mA/Cr8msxoONoqpL4gQA5kA/Gi7DREsfh+MY3uT+lTrpFnGcsFJ9+axZvE0Y/5aD86zbvxdBbgGWXaD0z3o16hfsdgI7SHhQoHsMUjXdvH0AriX8QTyLuSNtp5BJxWPJ4ruZc+XEcZIyTSSQXZ6S+qxoOAKrS62o7gV5pJrmoSfxIgP41We8u5fv3LfhxVWFqejzeIUXOZBWfP4ohTrMPzrgW+b78kjfVqaUjB+7+dFgOun8XwgnDlj7VQl8Wu3EcTn9K58zRoOSq/lTTdx7gu8ZPQUBY1pPEF9KflQLn1NVpNQvpTzMFHsKzjeptZt4Cg4J96ct5EDiTJJ/utRcNCwxlk/wBZcSN+NR+TH3yx9zQLq0Y8Ssv+8KkCxuP3c8TZ7bsGi4xgVF6KKU47intDIvVGx7DNRFsdR+dFwDZH6CijctFFwPpMUtcAvxJsIfEM2mbJl8mQxtKx4yOpx6V3VvOtxEHUggjtRFkk1Z2pS7GAPStCqeo23nwEgEkDkDuKc9gR5j4p+J+paN4glsdOgg8i3ID+apJc4yfoK7bw5r8Wt6dZ6lAnlC4BEkWfusOtcrrvgqDWLv7RIjtIBgvGcEgdMg10nhzRxp0ENuibIoh8qZyRnqTUK2liorudXRQOlFdJAUU1mC9TQrqx4NK6AdRRRTAQ1FON0TA9CKkNRscjFc85DSMfyMHAGKcIQKssvzHigRk1ibEATFPCE9qmCD0p+3AoAjEVPCAU8CnAVSC40CnhaULWWNVlHimTTGRBAloLjfzuzuxj6VSVybmqBRismXxJabitpHNckdWRMIv1JrNuNau5+A+xfRafLYnmOkluYbdSZpVX6mqX9u25mWONWYE43EcVzLOWbLEk+pNLG2JVPvTSEzr/AO1LbONxBps+rW8NvJKp3bBuK5xkd6wnPzmopRvhkX+8pH6VVhF+48T2F5ZTQq5QyxsgY84yMZosNdtbXS4LYSK0sMYjB6KcDFeco3yD6Uu4+pp2A6vU9S8Q3L7tP1SxgAOVG3qPQ5FXLXW9ZFp5c01g8448wH+nSuJ8xh/EfzpDM4Jw5596Vhm/e3+s3TMHnWUZxtSYAD8OKzmttTYkLasT1yOf5VhS3MqXUoDnkg8/Sk/tCdJIyJCOcdaVg0NKeHUY2Ikt5APXYR/Sqx8z+JT+dPTWryP7szj6MamXxJe4+eVmH+1hv50wuirvbPCHPtzTILoTxlwVVQSOTz+VaH/CQFxiaC3cf7UK/wBMU9dV09zmTT7XoAdoZM/kaAuZouYi2A7OfRRirUNtdz/6i0Y+7DP862bLWNJgA8vToU/3JP8AEVrxeILBxhEaM/8AAX/rSd+ge6YFv4c1G4A8xhGvpnP8q0oPByLg3Ex/MLWn9u88fubxV9mRl/lVaS21KX/UyWzj2l5/XFT7w7roSRaJpdrywViPbP8AOsu+vbSw8V2EjxqLYxOsbHor+/pUsum6rgmSKYj/AGMEfpVC504TRtHd20jq3UOCaLMdzem8QwxZ2tGCOy4zVPStdn16AyW0MmQSCCemDjOao2ujmKFls7CRQw67Tz+JrS8GabcWWkxsqlY5EyuMEnLE0mrAkOv4r+2gEjbBubAG7OKyLiWdUDTXO1c87V6CuvvdKm1BFWado0Vs4GK5/wAUeHom0j7HZzgX15IIYmdiQB1Y8egBoTQWMrw1b3fiW0lu0tW8gSmON3kwHA781rPoepQ28kcFjalpCPmNwBgA+mK6XRtPttK0a3srH/UwrtB9T3P4mnC4juIS8Lq6glcj1HWuGrimpcqNY00QvottbR+dcysUVcYC8DjAxWbLoE88u1ZyUT5dzLzXQ3lrb31r5VzHuTcGAzjkdK5zWvEcWlXrwPIVON2Gr0HUckjBU4xV+pYj8MRL/rZyR7cVZTRtOh5YBj/tHNchceN4udjM30FUJvGMr58uNj9anUd/I9DBsLf7qJ+Apr6pboTtArzNvEt5IeQQPY1E2rXLnp/30xosPU9Hl8QRJ3UVSm8ToOkn4CuCFxeTkCMZPpGmT/Wrceh67ffcs7xx7oVH64qlB9h8r6nSTeJSM/e/Hj+dZ83ijk/vEH1bP8qrQ+AdcnYB7aOLPeWUZ/Kpp/h1rSKDF9mm/wByT/Gn7OTFyoltNWgvT++1aC1z2kjf/DFX5dIS5h3WOv2czehO3+tctdeE9dtVJk02cqO6Dd/KsaeGe2bE8MkTf7alT+tJwmh8pv6lpetW5JMsTp6xvn+dYM6XIb9883Hviolu5VHyyuPYNQbuY9XJ+tLUGMivoNPvVmuHYIEI5G7JrP1zW4tVlg8mORhExJJHXp/hV6VhMuJVVh7jNWdN05YrhyYQA0W4YHX0rObjD3mUry0RWTxfb42yRzKOmODTICTAp6Z5/M5pbnT47YxsQrSMNzAj7pphc9xVU1G14ilfZknOeTTGLdiKaZB70ZU960II5Xfadh5qlL5p5Jb8TWjtWjavoKFoBj7TzuVqaUO0/K3J+XA/lW1tX+6KTao7VVxWMdkbqA2VPzcfdP8AnvSrC548tjnpjv8AjWvxS5ouOxlraSkkhSB71Olo2fmNXd1G7mlcLDVDpjYzDHoSKmW4n6MwYejAGo99IXpWAn89v+eUP/fNFV99FFgO61zwja6xrP8AadrcfZrhmDSjGQx9R6GvR/D6+XaJGCSqIACe+KzIPDeyXJjc89GcYro7S2+zR443HrjoKlNhpaxYooorREET28Uhy8asfUinxxJGMIoUewp1LTSQXCkY7VJ9BS0hGQR61T2A5Dxtrd9pfhm6utM/4+lZV3bc7FJ5bFcv8PPG2q6tqM1jqT+ftiMiTbcFSOxx1Brs9VtZldti78jDIR94f1rL0+xFuzC0sUti/wB9lTaPxNc9/vNIpXO0t5RNCrjuKlqvYx+XaqvPTvU5rdP3SHuIaibrUppjCsZDiQFfmzRinHrSM6RLvldUQdSxwKixo2IFpQtYdtrIs4ZVmuPtrtM7RunQIT8oz7Cqtxr13OSEYRL6J1/Oq5SeY6kKfSl2n0rJtdRn+zRncDkdxVfWdSuBpM7oQHjXepHUEGr5ETzG+BisDUJrceILqPegn/s7GO/3jXNL4o1HH+uJ+tOXXrm6kCzLG2/5SxUE4+tC0C5pG922ogjTChcZNVabmjdQA4mgNhh9aYTSbqANZzzn1FN70hOY0PqtJnFUI4l18uSRf7rsP1NMzVjUF2ajcr6SH9earUAGaQmikJpgULvi8J9UH6ZqvKeFPow/nVi/jV5Yyw5wQDVR4U2H73HP3jSAp6l54njaKRlBXnDEd6haa7VVKXB+7yCynn8RVrU2CJG5z3HFUWuF2KTuxyOhqlYTJ2vb1ZMAgrwfuA/yNSLqN2JSrRLtB67SOKptcR4UlwMjjI/+tTjPF5nDr2PUUWQXLCa0xJDxKCAT9/0+op6a0jKzGJsDHRgf61XByx78npSeWCGDJ1Hcf/WosgLy60iqG3zJzjof6VOniEpjbfyLnkZYisgRRBcbF657UjQoyjGeB2J/xosB0cfie8VsR6i2fTfVgeKdSP8Ay9Fx781yLW6GUPz6/wCeKiW1VSwVgMgijlA7VfFOoL0lP4Eip4PGeo26BI5WRB/CDwK4Ty5ljOyVhg54Y0GW7UIRM3TkE+/0pcgHoQ8c3p+/831FQy+J1nuorhwyyRqVUg9AevHrXC/a7wSsCQRzj5RSf2lcLHlolJB7ZFLkHc9G/wCExuBaLBa3ht8Z+bywxJPrT/Dvif7NNdjUtQeeNsCOMRgbD1J49c15sdUI25iOGHJBp3mMtw/zHkA1lLDQktUVGo0etaRrVpJFdfargvPvJTDEjB6delc74gtpLzUzPGPNXYqhgckY7Vy2lTt9rddx+aPPX0NaTSOGyHIP1pLDxi00aSrykuVjjayJ96Nl/Ck8k04Xc6jHmNj3qxaXcs11FE+CHYL09aqUWtSFJEdpFDHcq9xAZ4x1TeUz+Irr9N1/QLQDd4dCH1DCT/0KoYdLlQg+Ujf7yg1oxWcbKBLpVo/uNyn9DWaqtFuJqQeONHUBUgmhH/XIcflU7eMrKTH2eaFsjkSMUI/OsoaJYS9bCaP/AK5y5/Qil/4Ra2k+4blP9+MH+VDqyezFyLqXzqd7dzQvE8DBW8wKGRsYHTrnJqlBf6nYW9ugitogsG4iaQMUcklhnI55ph8G/wDPOVT9VK0w+DJf9k/Tmlzy7j5UTz+L5FK7pYFOOdsmfzFUp/GVvIm2dRMPQpu/DnrSyeEXj+8D+AqpL4cCDkj8SBU37sLdjF1nVdJvmJi0dUJ/iUBP5VzVxFGzZihMf/As12E+iqmeKoTads/hFXGSBo5doWxgg0ubnYE86TaBgDNbUttjtVZ4WFU2nuLbYzPLb3pPLarzRH1qMw/7RqkxMqGM9xTTCPpVowjuSaTyV9KYioYfR8U0hh0cGrvlL/dFN2D0FMCl5jA8jNNN0g+8fyq/s55o8tR0RR+FMRQ+0xnpu/BTS+eT92KU/wDAav7fSlxRdAZ+6Zvu27fiQKXZcn+BB9Wq9ijbRcCj9nuD1dB9BR9jlP3pz+Aq9tpCKLgUvsB/57y/pRV7iii4HvkevaW/3b+D/vqrKanZP927gP8A20FeJCd8dWpTduB1P5VipNBynuK3MLfdljP0YVIHB6EH8a8KF3Nu+9ge1TpqM0fSVvzNV7Rhynt+aM14umuXiDi4lH0kYVOnibUE+7dTf9/TVe08hcp7DS15InjDU06Xcv4tmrCeONUU/wDHwx+qg0/aoOVnqEkKSriRQw96iWygRgQmSOmSTivO08e6kvV1P1jFXIPGmrzgNFZtMucFkhJA/KlzJvYLM7+kNcZP4v1K0CedY5LDOFifjPTNK/im/u7XekaWwPXIO8/gelPmFZnSvqKR6hJbyoY0SISeaxwpySMfXirYw6gqQQeRXnUtzJO26WRnPX5jmuptJS1nCQT90d6EkxmpLJHFIFkkRCRkBjjNY3iKWCSC33FJUDklQc9uKyfFpcRWjhjwzL19qw7OQl2BJPHc0uW2wXbNOSQM5IGAegFN3VDupd1AzoLFt1nH7DFJfp5mn3K+sTfyqLTGzZD2Y1bI3KVPcEVaJZwKfcU+1T27f6RH/vCoBwNp6g4p8JxMh/2hSYG3uo3VHu5pN1IZJmkzTN1Ju5oA2Izutoj7YozVeG4CWS7s8HFJ9sjz3/KrsI53Wl2avP8A7W1v0/8ArVRNXPENxGNSVgfvRjt6E1QgY3MwihVpHPRVGSaLAOzSMeKnaxu1+9azD/gBqCSGWMEvHIoHqpFFmMp33SI/7RH6VWI61buo3nhH2dGldXDbYxuOOh4/Gs2S8iikKSMVZTg8GizYrkOqsBYo5xww64/rWUJlMGQqnDe3pWjc3MFzZtEkyhj0ySO9UFtWMLqJ4STgj97/AIimhCNIpiQ7fUcZ/oaSVlwhK9V689vwpTZTeRtwjENkYdDxikazn8pMQHIyCAB/Q0wBmjW5zwCSDyRSowEpVXbPI4P/ANemyQz4QmKXO0Z+VuMfQ0OrLdglWALA9D/hQMekr7G/ePwMgkE/40hmby8lxndjlf8A61V0AEjocZww7f4UisDC4B6YPH/1jQIneRtqkNH0pdz+dtyMZ45NV2JMK/eOCR3/APr0OxEiNnAIB5H/ANagCcPJtfI7Z6//AFqYZZNgPPXGMDiogds0ijH8Q7UgkYxHBPBB4J/xoAmM7iRcjOcHpTDckbhtHHXtTHkYBDznH9fpTXc+c6nHOaAJhIJIWckKF9T1qfqgcAk4rNDZiPfBrStyWtxnqBj8qAJtOlxqMQIILBhyPatwmsGM7LmB/SQfrx/Wt1qQCGn20vkXcMp6RurH8DUdNJqWtBo9bh1/SWPyxuf+AVoQ6xZuB5cD/iAK8+t53j0+OaG3adtoOxWAPTk81q+EtYl1+H7RHYPBaZKrM8gOWHUbev41wu61N9zt11BGA2wH8TTxdsekaj61yp8VwQ6umlrpepyXroXSIRBcqP4sk9K6S4mt9Pszc300dtCoyzysABTvMVoomNxKem0fQUxppT/GfwFc8PiF4WM3l/2vGD/e2Nt/PFXj4q8PCNHOs2W1/unzRzU2l1C8S5I0h/jaqVwrN1JP1qRfEWgy/d1ixJ/67LUi3On3YP2e/tJe3yTKf60uVjUkYN2nWsa5Tk10uoQqM7HRv91ga5264JqojZkzIMmqcic1fmPJqnJWiJKjpUTLVh6harQiErTCKlIppFUIiIppFSN1phqkIQLzzS4FJmunj8KQppgu57h2LIH2KuMZ96TkluOMXLY5fj0pcVsT6VbwQlz5zYIGB1qH7BbuqmN5Ocnt2p3Q3BmZijIFaD6fFhNpmO5d3Qccgf1p0OlJMm7zGUZI6elF0LkZmFqStK40lYYXcSk7RnpWbzTvcTi0FFJiiiwWOuWDTnYKM5PAFSvpNqqlmR1A5J9Kuvb6QBvikZZFOV571eeSxmhZGu+GXBBxWI7nPfYtPPSfH/AqP7OsT0uR+daJ0HRz0uyP+BCkPhvS2+7e/qKAM/8Asq2PS6H5ij+xoT0uRV7/AIRaxP3b7H4igeGLeJhIt2JNvOw9G9qAKcfh1p3Cwy72PACjNTP4Pv0UsY5AByTsrWtt8U8TJ8gVgQEGBXXNNIyMN7cjHWtIxTE5WOBtrGGygTfbK04+80mSf++e1dH4cvJhLMvmHBUHHasIbn5YknoSa0tCOy9I/vIaaeotWbOuXc40iZ0kIZMMCOowa5M3Mlz88rF26ZJrqtUXzNLul9Ym/lXHQHMQqmSicGuo0t92nQ+wxXK10WivnTwD2Yikhsr+K13aZG392UfqCK5uzPzt9K6nxIu/RJj/AHSrfrXJWh/et9KbEjQ3Uu6oweKM0hm5pD5tnHo1aAPNc/aTPHDLsYjkHin/AG2cdJDVJXEYN0vl3c6f3ZGH602Jv3qf7wrP1K8lGp3OW58w810OhaZBfaKLyVpPODN908cdOKGgRLu5o3VEGp8cojfcRmkA8K7H5VJ+gpTDIBkjH1NMbUwobIGEHO5un1qtLqsb7UM8SFyMbTz+dOzA0lP+g/8AA6hzUiH/AIl5/wB+oc1Yjn/ER/06L/rn/WpPCLf8VJb/AEb+RqHxF/x+xf8AXP8ArVCyvZtPukubZgsqZwSM9eKAR6yWfdwRjHequqFjol5vxu8l/wCVcOPGurDq8J+sYpJ/GWpXNvJBIINkilWwmDg0Bcx9K11/DV5JfND58TR+WyBtp6ggg9qyNXvftuq3FyFVDK5YqpyFPpUmrDGmS47bf5isu6u4fPZ1jeJZGJwTnnoeaEBM8pSIbW28cZ7VPBD9osmuVmj2h9jBgAV98elUbjpGPpRKSLchccsP5UNAXhalmwrW7c4zx7f405bMBx5nlKgI3MpzgHHPH+8Kx9jbeF70fvFAKgj86Vguawhb5mjAKBiu4ORnr/hTmSdMjEnBxxJ9f8Kx2aQAct+dKZZN33m9/m/z607Bc1Q8zAHMuCe5BpoEr5AXPY7o15rME8ocje+M+tNNzM6MGZiDzzSsFzVuLeSBik0EQIPIMffHsarlYiADFEMcDBYYFU47mSNDtY4z3yad9tkHO4EkYORTSC5Z/dGTeV+bPaQ/1qPyIsEAPz7qaiF2VO3amDxSLdjzRIUXcMHpkH8KLAPaCPywAZBjPVB/SmmJfMDeYffKkU0XCggmPOaPtC8fIQcdQaYAsSjI8xccEfX8qs2pwhVmUsSTwfWq6iSVj5Yk6dhmtG20bUJIkmgt7iQsSpVYW3D68dKLD5X2IJGAjJBB2kH8jmugY5XPY81mjwjr01o8cOgXTu7BhIYypUDt+NdhpXhu8l0aO31O1e1vEbJkwG3jPseOP5Umh2Zz9Ixrr18GWw+/c3DfRAP51BeeHdPtUKxpdTzEZAMiqo+p/pUtlQhzOyOWXWNaeX7Jp7pHFGuC5XoPcmtTSJ9U0K0jhsNYljiXLbPKUrk9etTPp0yLz5KgdFVxxVffJuCG3cds5GK5pRk/hR7dHD4OnH95NNkk+oazcavHqh1llvEiMCyLAowhOSMdK5jxD4g1XUZWg1TUJrxYHITfgDPrgV1aWm8fNIq/XmtWG9023RYvssBdAAz/AGZTuPrk1pTUvtHHjlhUl7Hc8k8/f0jJPsKkSKaT7lpKx/2Yya9gTWLUD5Csf0hC/wAhUw1qI8C7x+JFbHm6HkC6RqMwxHpV230hb/CrMHhbW3+7pF4PQ7Ntev204vPuX8IH+3OBUZkJJ+fdjjhs0fINDzO08JeJIpVlitLqF15DeYFIP516MbK6ktYTMY/OKL5nzj72Of1qXd60mazlBS3GpW2KL6RO3/LSEfV6iOhSN1uYB+Z/pWmWpCxoVND5mZR8PA/evE/BCaT/AIR2D+K7c/SP/wCvWmWNNJp8iFzMzv8AhH7IfenuD9FAo/sTTl6/aW/4GB/SrxNMY1XKg5mVf7J0xf8Al3kb6ymlFhpq9LFD/vOxqVjzSZosF2NFtZL0sLYD3BP9aS71maG1nclPJiXy0j28Fvp7cUsj+XGzHqOg9TXP69PsWK0U8KNz+5p2QXfczjqF0CT9okyeevFOXWLyPOJAfqoqmTzTTRyoLs1F8Q3S8MkbD6EVIviI/wAduPwasWkJqXBD55G/Fr1pLMouoX8n+Idc+g4rXg1bwt5P73T4iyqc4dwWI6ce9cPSZpOmug1UfU0/+Emg/wChfi/77NFZeaKfIP2jPo3+x7Ey4On25jwMEIMj604+H9LY82EH/fNePfbrm5le4eaUNKxcgOcDJzjrViG4upAfLa4bH91mqfaLsSoSPVj4a0huunw/lTT4V0Y9dPi/DP8AjXn9vYapPAsqvKik4+eUqf1q9/wj2vgZEzke1z/9empp9BuEludgfCWin/lxQfRm/wAajfwnpEal47QK6jKkO3B/OuSOheIx0knP0uf/AK9Imk+JEkUlrkqGBI+0Z4/OhyXYXK+5qPbgLkelbMTZjU+oFZP2lGQD1pI9YWONVMRJAxnNRAJGb5eJZV9JG/mas6fiK9jJOAciqi3KzXNw4G0eaeCaGlXKAMCS3QULcOh0szI9vIu5TuUjr7VxFmwaLAOcHFaO73rn9Bf91cqT92U1ciVubHQ1ds7qWC3ZUbaN3Ssq51NbLaHx83TAyTViyn+0WjS/N8zZ5GP0oitRsm1nULhtHugXyNnpXL6PeST3pV2yNhNbupnOl3X/AFzNcxobf8TEe6GqexK3OoRgCC3SlN5CnRQPc8VEDVKTS4Jrh5ZC53HOM4AqEUzYtJfNimYFTnkbTmjdUVhEkFvJHENqheBSk1pHYlnJ6qf+Jpc/7/8AQVraL4n/ALP09bA2wcMx+fdjG6sjVjjVbj/eH8hVWE4njP8AtD+dNgjss0uaZnk0ZrMZUuNLiubppZHfDADaDili0u0hdWSP5lOQSas5ozVXdg0L8Zzp5/36izUkJ/4lzf74qEmrWwjA8Qn/AE2L/rn/AFrJzWp4hP8ApkP/AFzP86yc0gFNHSmk0haiwGdqWpiAGEpl3XK8ZFX/ABDp+hJ4Y0+XSZhJdSsplXdnPHJI7EdKwdfBe+iCnny/61DFMZIFAjjRY+Dj7zH3p2DoTz8lMdgKbKHlTy4kd2Jz8q57V1emPjTLY7UB8sc7BmrouJQOJGH04pXDQ4iPSNRkTEdlOxJ7QmpH0LVI4lL2UiDPdcf1rsTPK33pHP1Y1WvyTZnJJ+YdfxprUNDnV8Oas4Ui3CDH8coX+taemeFFldxquoJZjjYyOso98jOarhtrkGpkehqw00WrjwfYRsTD4mtpPYwP/gaoDw1EpO/V4D2+WFj/AEFWgc0tIoqr4cslXDam7d/ltv8AE1ag0XQosG4e/uMdl2xj+tLRTEaUU2gQQmKPRQ6t1Mj5Y/jWfLaaI8hZNLZQf4ftBxTKMUBqSw2ujmVFfTYUjJ+Z2Zn2++MjNdFa3fgzTwrJoL3cq/xy4Vfyyf1rme1FNBdnbP8AE0QKEstDtolUYAZun5AVVl+KGtP/AKmGzhHshP8AM1yJXJpuKBGxf+Ldb1OUPcX8oA6JEdi/kKptqN23W5mP/AzVQU4UwJTcTN96aQ/8CNW9PY4kySenU1Qq5YH5ZMeopCL+aSmg8UZoAdnFR3A2Xcy56N/QU7qRUV6f9Pn/AOuho6Ag3e9NLH1qPdSbqVhkmRjnFMZiGODj6UAio5G+c0gJVuZlPyyyAezGnrqV2v3bmQfjmqm6kzRYC+NavV/5bZ+qinjX7sdfLb6rWYTxTc0WA2F8Rz/xQxn6EipovEkYf/SLV2X0jkAP6isAmmk9aLAdafEmjyEA219F7q6v/hTv7Z0RlJF3doQPuvb5z+INccTximE0WA6kazZN/wAtsfVTUqahaucLcRfnXHls00miwHZyujncskbJEvmMQ4/D/GuNupzcXEkrH7xzUTHmmk0wAmk6UE03NAC5ppoNITxSAQ0lLmkoATNFLRQB00bkKB5b8eorV0e9e38/buXIHbHemmL9725FJPmGB24wcA4rna0Eqrehoy6u7Lgsa7DRdQF5pcUm4bh8rc9xXmDXGe9QzXcoI8uV1GOQrEUQTRpK57KJR6j86eJBjqPzrxE310P+XiX/AL7NJ/aF12uZv++zWupFzrbnUXtywRWc7yMDr1qwkhMSE55HesGKclFJOSR1rXifNtGfUUojZFHNsubkf9NM/mBTbaNheiRp3YFuE7Cq0j7b64/4Cf0qS3l/fJ/vClbUOhplsN+Nc/o7bZb1fSU/zNbjn5z9a57T22X98v8A00J/U1cthLc2CQxBIBIq1A37iTHqKz99W7R8wS/UVMdxsbqBzYXA/wCmbfyrldFONSj91P8AKuouzmzmHqjfyrk9IONSh9wR+lXLYlbnUhqA1R7qXNZlF20OUm/3aQnmksTkTf7lITWkdiWcrrHGq3H1H8hVOM4kT/eH86ua1xqs34fyqgD8yn3FMEdnmjNMB4pc1mMdmjNNzRmmBoQn/iWv/vioM1LCf+JXJ/viq+6tEIwvELf6XD/1zP8AOsjNaniE/wClQf7h/nWTmgBS1NJpCeaaTQBQ1Kx+1xtIh/frtCDOBjnP9Kf4Ts7BtbWx1793BPhfN34MZ6g56c4x+NWGB9Kybwp/aQWReCgGfSh7Amdvc21vZXD21kWNtEdsRZgx29skcGo+9QaTbSvpVr5cUjL5YwVUkVc+xXR6W03/AH7NShkOagvj/oTD/aX+tXxp14elpP8A9+zVXVLae2tCJ4pIyWUgOpGetVHcRiSDjPpSo1BFRqdrEVbQkWUepVbNVlNSBsVDKuWO1LUStkU8GgYuKKWigBKKWjFACdaQingUYpiGAUoFOApcUANxxVuy4R/rVbFWbThW+tAi0DS5poNGaBD0GZFHqRVa+b/iYXB/6at/OrMPM8Y9WA/WqNyc3c//AF0b+Zp9AEzSE03NITSHccXxTC2WJpM+tNJoAXNBNNzSE80AKTSZppNITQApNNLUhNNJpAKWppamlqaTRYY4tTSaQmm5oACaQmgmkoEBNNoNJmgYd6SjPNFACGk7UppO1IBKKM0UAehlT5oO2oNRU/2fNx0GasveyR432DruxyyMMVBdX0c9tNCYtjMhHQ1l0ME7M53ecUZyKbjAFGcClHc6nqhrGmZpWPNMJ5rQzNmB8wp9K2rZs2cX4/zrAtmzbxn2rbtGzZJ7EilHcplO4ONQl91U06F8TJz/ABCo7s41A+8Q/maah+dfrSe4kbcjYkb61zts23V74f7Wf1rdlb941c/Gca7eD15/lVvYXU0g1XbJsxzfhWcDV2wP+uH+z/WojuMknOYJB6of5VyGmNjUYM+uP0rrZDlGHqDXG6ecahD/AL+K0kJbnVbqXdUeeKSshmhp7ZaUesZpSai00/v3Hqhp5Nax2BnL65/yFZP91f5Vn5wR9av67xqje6rWaTTEjs1bKj6Cl3VFGf3a/Qfyp2ayGP3UueKZmjNMDSt+dLm/31qt3qxa/wDIMn9nWqx61othMwfEX/HzB/uH+dZFa3iL/j4g/wBw/wA6xzTEBpKKTpQAvU1kXsrC/aNSMOBuyBngevatess2cl/r4t4P9bIMLu6Z20DR7P4DYr4I00gEjYf5mui3sGxyO+a86tZLay1XwrYw30qWslu3nIsxClh0yc8ZOfyqDwnrt6/jm5tPtU1xZl5QN7FhgHg1nqUz0OVtR81vINsY/wCHeWz+NcZ8QzMYbP7SUMmDny846+9d4rZArhviT1s/90/zqo7ks4EimNEzfMilsdcVIas2fKSZ9K1JMz7WI1XejruOBkdTTBq0H+1+VGpDaLXH/PQ/yrK2MAPkfp/dNS0NGymqwN90OfwqRdXtz03H6CsFdu8hwAR2bI7GnQ5WYKQRuGORUjubx1e2VgGLAn2qQajC04hw/mk7Qm3nPpWHdhTGgEe4n+LuKqkHOTv3dc4OadgTOqa7RGZXSVWXqCh4o+2Rekn/AHwaw49b1GGPy1uXZPR0DfzFQNc3Mgkla4ZSuCQTjPPYd6QXOmF5F6P/AN8Gl+1xf7f/AHwa5M31wv8Ay8S59zUkF/cPu/fynHoCcUAdT9qh9W/75NBu4AQCxBPQbTzWBHqDf8tbmcL/ALA5H51esby2uL6G3a7ukWTKh3UcMQcfhnFK4zS+1Q/3j/3yat2kiyRsyHI3Vz13dTWt5JbrdFmTGc+uOa19GleWw3ucsXPNO4jSzRmm0VQizZ83sAP/AD0X+dZs5zcSn1dj+prSsOdQt8/89F/nWQ5+dj6mn0AXdjrTSc0hNITzQApNR+ag/jX86dnmuPnmdrxiCBhz3IB570hnW+Yh6Ov50F1/vL+Yrj5biTzCAwA/2SeKWNppScTbMf3mxmkB124eo/OkJrkzNPEzLK8isMcHr/nFXp2+z6VYXAZ3a483ILdg2BQBuHPpTCetc8upMtuQUJYDG7ec59cUy31R41IkBc567sUAdEaaTWL/AGwP+eZ/76NL/a4P8B/M0Aa5NJWV/a2R939TTTqeT94igDWNJmssakO8n6U7+0k/56D8jSA0qTrWeNRXPMi4+hp66ghB3SpmgLlykqxBFZ3EatHqEe7urDGKz7+8itJhHFKs/HzFeg9qLAWKTFZ39rf9M/1o/tYf88z+dAzQorP/ALVH/PI/nRRqB9TNeWDMA01uTjcMsOlQ3K6ddW0sW+0/eIVzle4xXinhWaCPWbmKaWQo9uphHUZ46+nU13enDTizpNLakHkEuPyqJSt0JirnG+INC/sG9jt2vIJvMTerRn3xWSxABAYEj0Ndb4vtrS4aEaXPbNcR5DIh5xXESJLHqrG4/wBbswT61nHVmm0SZjURPWnk0xuhxWpmalmd1pGa2rNv9DHs5rF00Zsl+prXtTi2Yf7X9KlbldCteH/TlPrF/X/69IpwaLrm9iPqjfzFFD3BGtKfnP0rns7fEdwPVM/yrekOSD6qP5VgTceJG94/6Vb2Ety+DVzT25lz/cqlVuwP7xx6oahbjJ2NcXanbqMXtLj9a7ImuLj+XUl9pf61bEtzqiaTNIetFZjLumH/AEoj1Q/yp5NRaYf9MH+6f5U8mtI7CZzOvn/iZ/VBWWTwa0/EPGoqf+mYrKJ4NMSOyiOYk/3R/KpKhtzmCP8A3B/KpAayKHUueKbmjOaYzStP+QZcf7y/zqsTU9mf+JbdfVT+tVs1otiWYXiL/Xwf7p/nWOa2PEX+tg/3T/OsY9KYhKKKM0AONZN5qVzZ3zC3kEe3DAgDIOPWtWsLVFLXsny5yo5/CgD1Xw/e2EXhfR9M1CJvt08fmRxm3JLAknIOKvW+saGk815HIsaQYjlk8kgBuwPFUNNGoaifDfiCO2jMFnbGJ4xJh2JGCRxjt0qtJpWqnw1rGlGzRp766+0xsJBtVSQSCfXj9ajUux2I8R6WphRr6JZJQCgYFcg9DyK5z4kn5rT/AHT/ADrK8V2Go67dadPbWUkUcMCQuzEZDZ9B2FXfHxPkaeG5IiAzVRWpLOKNWbI/u5PpVU9as2n+rk+laiMvUif9F56OT+lZf9q3oA/eLx/s1o6kebf/AHj/ACrG2P8A3algTLcyzu7yElwM5XA7GkN/PNNF5rAgH0pI4j5bscA9gVzURjfH3Rwc1NwNu3KLNEZZREi/eYruH0xVWe6uR8y7VXYJDjnIY8U90EtuyswXcOp6DimWthealbtsiEcWxIvNkYIg2+pNVcRAl/KZArSgg+1Q3N1OxKMwK9elSXllHZSBFuIbl8ZJhJKqfTJ6/hTbpdrKV6PEG/Gp1GVmfzWyeOKRLiaBj5cjJnrtOM0hyOoFLHhnG4UDLMN3eSq2J5OO2avWklwZjdTvkW0W9RjHzdF/U/pTIIlGSAASatieyFrLBJM6vIykkJkYGeP1/SkBn6u7tqM0jAfMRyOo4FdRoGTpMZbqWY/rWBqL2VwpaF2MhOWyOvtXQaE2/R4WxjJb+dMDRpc0lFMRa00j+0rcnoGz+QrGJzWvYnF2pzjAY/8AjprGzwPSqWwATSZozSUAGcVyLwbnZi+d7HGK6xjwa5GJljuT5gBGfyqWBCRg9RjPWl568MK0bdF/d5RcMzNk9CN3H8qiu5Fubvbaxoq/dGOM+9AXK29ZHzLuye+c1fkCXdjaQrwlsrKDn72WzmowI0xCmJCOOvH50kwSMbI5Q57iIcD8aBF+x8Ox31o8jahbW4V9uJmwTVq6+H95aKjNcwYfoRn/AAqnpVror4bVbm4V9+PLjTIx6lq9J1tUEFvH0QKcc9ulD2GtXY83PhWUSeWb2139dpJBpT4OvAeJYPzP+FXby00m41TbNeSRzZAAUcZ7c10rxhkKNnHTrzWTm0WkcWfCF+P44P8Avo/4Uw+E9QHTyD/20rrzbRxkMC/y9Msa53WNcuYJQts2wc5OOTTUmwaSObuIXtbl4JRh0ODg55plbOt6b9ns7a9eYyTXXzSA9MkZ4rGX+6fwq07ksK0bSPNuh2qc5JyKzu9alsqi3iJbBC5xTQiQwpgfKv5Unkpx8q5+lP2p/ePr1oAXjBzTEMMKcYjX8qinhVbd2CKCBVgj3qC7OLZ+eeKBmZj3op2PpRUgdvp6WEVtFdjU916U8trdUIZAR1z0OK6G2ubW1tYHEQVHwQ6oDub/ACK4iysR5a3IOSeMV1kVmuo6FFbs7oQ2dyjPSsnqxbRNaHV9IuIy9zfiKRDtCm33VjaxYjULqXU7CRp7SCELJKU2bW9MfiKW18OWtvKGkklmXurADNaM01haaPf2cOLcyx70jd8lyPSgaa7nJkgVo6dLosqhLx3E3fD4rKc8VmXMYkJOOR3q7Dud48FnCFWwZ2iIydxzzUlv/qn+ornvCzEWEqkk4k7/AEroLY/LJ9BU7MZXuf8Aj7gPsw/SlpLvie2P+0R/46aWk9xIvscoh/2RWHc8eIoz/ej/AKGton9zEf8AYrFvjjX7X3TH86voHUu1asP9ef8AcNVasWJ/0ke4P8qhDJiea41/l1I+03/s1dgTzXH3Xy6lJ7S/1q2StzqCeaSjOaQmoKLemn/TU/GpW4JqDTz/AKbF9alc4Y1cdhM5vxF/x/R/9c/61knpWv4i5u4j/sf1rJxmmJHW2xzaw/7g/lUwqvaH/Q4f9wVNmsix+aM03PpS5piNCyP/ABLrr/gP86rGp7I/6Bd/7o/mKr5rRbCZieIf9bB9GrHrY8Q/fg+jVjUxBSZ5opKBj81NBpy3OJGAOT1qCoJtUu7R/Lhk2oOny0pJvYEeseF57O38O21rJcwo8e4bWcAjk1tKIJGBSWJuOzg15LZyvcWUMsh3O6gsfWpxwOOPpU2Hc9VFmCuAM89q4r4jrsls1xg7D/OsRLmaP7k0i/RzVbVLma4gQzyvIVOAXbOBTjuJmUasWpxFJ9KrmpYDiKT6VqhGVqBy1uO26rhsICP9dbj6yCqF6SzQgcnPSs0qykhkII4II6VElcaZo6jEkJURSo2VJOxwcVnIvmEJux1OTUi5+zvwef8AZBFJbSrDco7rlB1AA9KSQMvxyRxtEk5YxgYcIQSR7VTusK7hC5iVvlDHOP6U2GNvvcFTnBAqaaJ5mkSMEtuzgemKokp+YMHPHpUlxK4hgZCQdmMj0zVuTTJDmOCLKsykSMeV45H0qKazcrFCh3uGZRkYzigZVgWORW86ZYznjcDz+VSCKBGBW6TIOfutUo0a7LcqAPXIp0mizh8RkMvqeDSsx3Ea5iSZWVt4HP3eM59KpSNmTd1/Cr39izlMll3Z6Z7UJodwyktIgOeBmiwXKiN5jFenf9K7LQONEtvcE/rXKyaZJbAyO6lQPx6V1miLt0W0H+x/Wiwi/RRRmmBYszidie0Tnn/dNY3ata3IHnEnpC/8qyKtbAGaaaDSGkA2Q/u3P+ya4/ywzKBgZ7k110v+pkzwNp/lXKSwqhYA5BA59M1LGRxl9wVCck4wO9PnURXDRochflJ7E96uQ2sMbeYj7iq7sA5IPp+lUSq9d4I9+KQhyIWOC1Xgs0MOPNwh7B1FVYI0ZxujZgf7hH9aml8mNQyRyqp6b0FMDZ0PUbCKS3hn0gXczSgeaXJ6njj2rvdfYJJGGBICc8e9cl4XuteQ2MdtbI1izj5zGv3SeTnr611mu7jc5jQuAg6UpfCOO5xL3mlPrHlT2LeYXCiQk9e3HaulbIHvWLb3epjVhHJpn+jM+PMEeCo9c1usvrWMty1Y57WtbeyG2BVL5wS3aobLTV1W1huL+NcS52bCQQP8itC/0K3vmzLLs5z8pGc1PaW0em2ax/afMSFTt3EcU79EBwF3cSyyeU8jNHESsYY/dGar9wae4JyxHBJ5qW5gSGKFl3ZlQScnoOn9DWpBCw5IrSguYViUMy5C46VnyLtcg0ygRr/aYWP3lPpSiaIL95c/WqelLu1KLIyBk4+gp2rkfbyAMYVRj04pgWTJGRncPwNQ3jL5HBzkjvWfR2ouFhMGiloqRnV6Y3+iFfRyK6fTctaqBv4J+6wFcVa3PlN5GCS8mN3pXX6QCLZhgPhv4iB296y6k/ZNHb7SfjMKzdR0e61O5hNpC0nkKzud+7aBWhz2WMf8DWrFhex2ssiyTJC0qFYyG6t1xVER1ZxsltMRxFJ/3yapvZzluIZP++TXXad48hkIj1GIK/QseP1rXbU9MnG5ZG2kdQAf607mhyGgQyQRTrIjLlgRkYrdterj1X+tS3k1qVHkuzt3BXFQ28iiRt2VG08mgCG+GGtz/wBNQPzBo70t86SLH5Z3MJVPApCDmkxlwHNtF9D/ADrF1M41mxPrx+tbMfNsnsTWNrHGoWLf7WP1qugdS9mp7M/6Un1qA9altT/pUf1qEMnY4JrjtSJXU5/+uma7GT7zfWuO1cY1O4/3s/pWjJ6nTg/KPpRTUO6JD6qKWsyixZHF5F/vVYkP7xvqaq2pxdRH/aFWZuJn+pq4iZz3iH/XwH/ZP86h0aOGW8Ec5wshCA+hNTeI/vwfQisyAlYywPIYEU2COult/scz2+d3lHbn1puaht5TLBG7dWGTUuazGOzSZ5pKKANCxP8AoV3/ALg/mKr55qewP+i3n/XP+oqsa0jsJmP4h+9b/wDAv6Vj1r6//wAu/wDwL+lY9MQUY5pKMnNAx1Zl8GN0cK7cDoMitOoZtYFm5iMRYjnIpMEamm5/sy2zkHYMgilvLkwqEQgMecnnApbGbz7KGXGN65x6VmXkpkuHPYHFSMSe7v4ozJbzrKF5ZHQA4/Cqn9uz3SBHRAQe1SCUqwPpWbcRCG6JXhc8fSqiJmtBI0gJcD8KtRcRP9KqWZzBn3rRsEWSXY4yD29atEmDcEmWAgkYOcjt71fvtNi4ubjUpbhZBnz0gyD+vBqLWYY4dSaONdqrwAe2RVWBZ9OJaDUooweoUls/hUspEcsdpuCwzSSIeWYx4I+gzzURSwHWa4P0Qf41ea8NxeRPcXCuCMFoY8ED6dzVRntbibfJFM5xgbWC59zSAbG0RYpAZDGOQXHNW4ZBHJKQPm6D8jVdYlRw6qFVl4XdkjnvSO215Dt3c9CSP5U0I0V1CQBsQ7ueSrBR+VQZc3ELBfnZmbG4fzqgLhgG220fJycqTk1q3en2y6ZbzwXkchKn9yF2tnHPHtRdjIX1CcMQsakZ6+YKZNd3CkAKh9xJVSKNkUAJ1/2RmrEQBdRLGcEgZ8sZFF2Fh0U08mQTCpB6u/GKVje4ZlEJRQCWVuBmk1SJoWiWDc208ZjCkjuDTXkzG+9ZB3A3YAFCk2DVhk3nsjBjGRjoGGeldRpC7dItQevliuNljLozA5wM5zXaaaNumWo7eUv8qLiLVFFFMB6/6ucj/nk39Kyia084trj/AK54/UVlmrWwATTetKabmkBFeHbZTEHBCH+Vcq5yh3Hkiumvz/oE/wDumuWYtjPHFSxksM72+WjO1iCDUzx77CKQr8xZlAHYKAc/rUUkWEVif4QT+NWEgc2URVgOXbr1GQP6UhEEM0kVrLsAxvX5scgjOBU1vcSXtxHDPIWQgjkYwACeKiVC48ocZOTzxkU61iIulyQNoZufYGgBbeQvdKpdlj2lvlbGOM01L65x/wAfMoAGR85xUcDhxIpwMrnJ9ucUMsX2EyBz5pfBU+nrQMszrObh1guZnVVU5Mh5yB/U1H9rmysbyALnBLH+vWr4th/ZNzdK/wAygRgdiOO9WtN0OG/tfPlVhCuApJxu9T+dK4GRt+0xhY5CjbsHcTj6g+lVnZ0HlliQOOvWr+oQwWsjwwbt6Occ5wKLNLM3iRXiyPGx2gx9QcD/AOvR5gVrXT5rt3iTCyqNwjckFvpVi20aae3nllPlxxRls9cn0rr7/T4bq3R2+V0GY5l4Zazrdki8OXUkrDaQQcnqdo/rSuBmQ+Hp7+Npo3RfmKlT2Ipr+Fr1enlt9DXV6DG0Wi23mAh3Bds+pP8A+qtCjUDgBoOpW7h448MOhVhUM2k6i7l5YJGY9T1zXomAewphRf7op6gebPYXKDLwSAD/AGai8mQDOxsH2NemGJD1UVFLDGqZCjj2o1A838tvQ/lRXTfak/vw0UXZVihaYdpCQCQQ2a6zQJGmgl3AcMDyu7saxodKu+dtrIc/7Bre8O2N5D5++3lTcAeVI6Gsb3E42VjS2N2B/CGqOqlYTaS3GRElwu4sgAA6VsiyumP+qfr3NUtS0q5uLZV8ndhwSp7iquZJWZwl1GPMcr03HH0qva5WQYJA+tdDL4bvizARqFycfNVBtGubSfbMoX0J6H6GrTRdjW0ttlwrYBwM4POa66DW4AmJLdB6lflrlLCDY4yecYxWkYsoR6gipeoRVkbEus2MkTAAZIwAJBWMXYngD6dDVKCKMxIdozitiwuvsjEmNH3f3hnFIZEsqpAFdXDbjxsNZeqxyXM1q0EUrbHyTsIwOK7KPVrSRQJEkVv9nBFNkvLF1PzzDPqg/wAadwObPWpIOJ4z/tCiRvmOxSy54I6/lTY2BkXB6EcUhluX77fWuP1sY1Sb8D+ldpMAJG+tchry/wDE0k91X+VaEm5bnNtEfVB/KnmorI7rGA/9MxU2KzKHwcXEZ/2hVq5/4+H/AN41UTiVPqKuXP8Ar3+tXEGc94j6W5/3qyoj+6b8K1vEX+rgP+0R+lZEJ+Rx9KolHSWH/HjF/u1Yqrp3/HjF9P61arIsKXPNJQOtIRf08/ubr/rmarGrGnn93cj1iNVs81rHYTMnXvuwH3b+QrnLm9MMuxVyR610ev8A+rg/3j/KuYuE3TsT7VQhh1CU9FApn2uduOlKY6VU9qAIpLqdULFuBVJp5HkLnknird6NsK4HVsVQDkH5SQKTBHa6SSdKtSRz5YqtpVquoa5a2khwk04Rj7Z5qxo5zpFqTz+7FZ0zyWWol42KyRvvVh27g1DKRq+NdKt9F8RSW1oCIWjWRVJztz2/SuZvADGp74xWjqeqXWr3z3l7J5kzgAnGBgdsVk3T7mC0RBmlp5/cGrqOURipIIBwR2qlp4xC31qy3Eb/AENbIgybuV5pleRyzsDkk9eKzihH/LReB61cuDyn0NZ5k4wKgaJVZdmQWB9e9OU7lxuKj1xUKn5DUibwvyKfqBQMsW5w5UOWUDuMVMwyznJHNU0jk3EmNvyqeJXL8pKPfZmgCYbc53HjkcVCWTzvM/eFvTIqyIJXGFEv/fAFI+lXrEbIzj3YCgRG5+dGAOAMZBqaG8jilQyBgB9TT/7Dv5FAXYD7tR/wjF+/35I/++jQ9RoS9vlu5EZVGFB9arvOWt5lIAyAOOvWrY8J3J+9cxj6Zpf+EeMAIe46+i0kklZA23qzLnk/0RgCAcAcd67WyGLC3HpEv8q5WfSIIbaQi5YsfVK663XbbQj0RR+lMRJRRSUwCQ4tZ8dwB+tZprRmOLSX3wP1rONX0AaaQ0p6U09aQipqZ26dOfb+tYzWAQDzGOevC+2a3LtlFs5dSykYIFZRlgIxvmA9DzUsoq3hJmZQOMKNv0FS2skoT5GZQo+b5cA1Mi2TS+ZLK5P0xVgpavnZLnHqakDPjdQCAX37i33aY8jMdxVs4IrQNqmcqwP0NI1rhQcA59DTAynQKxZM56AEU0xORyuK1Gjx1jP1BpPLUn+IfUUATWnh+ee1QvceWjDcFAJq7/YuoPbi3a/YwDA2AHpWjaapEltFGVb5FC5x6Craalbnq2PqKjUDkNS0WXT4vNaZXDNtHUE1b8MRNNrvmggJGhYg9TngVs6oLe9iwZFYAFh7Grmn2NnaKrQJEJCuCw6mmDK2t6bcar5SRTCJYyTkA5NQ2PhWGHZ9pnlmRDu8snC7vXFb2cijNAxeMcCg0ZpM0CCkNLmmk0AFQ3AzEcZqXNZmt3b29mRGcMxAz6Zpgjn/AOxl/wCflfzoqj5Y/vSf99UUcrK5j6At3h1K2FzYNuXHzRg8r/iKiKMffvXBW+qXvhPUpgSwETHfHn869A0vVbHxLaLcWTqJ2GSmcBj/AENefCrKm1Gpt0ZrOCa5okRjJ7f/AKvWmNblhzj/AD/T3qw7bGIZWUg854//AFGmGUDt0P0//VXYtVcwKE1gGJ6Dp1/z/wDWqpLpe5SkgV0PUEflWs8uDwv9P/1fyqBp2HRQMfp/n8qYGAfDnlSeZAzDj/Vk9/Y1AVaN9sgKMOqsMEV0LzydlAP06f8A1v0qrdx/ao9kyBl7cdPpQBy1vj51z91jV9R8oqG50AxMz6dIYyefLfJU/TuKlTegCSDbIANy5/zmhgRXgKpGwOMSDP5GoSOMbj+dT3vNox9GU/rVQZ7mkwRdUfKK3LTS7C4UfvTI2PusdpB9qxI+UFSrIyHINAzZl8P2gJBhY5OfmZjVWXRLEMT9mTnrkVQOvT20rxefOAnYNxS/8JPLtObif9KYhs8KwysiABV6AVFSvOdRIndi+eA3Qim+U6n5JAw9HGP1FIYq8MD71euV/fNWeX2H94jJ79R+Y4q3c6hZiQ5uYug/i9qqImYviJf9HhP+2f5VjQjKv9K2daniu7eNLdvMcPnCgmsyG2nCyEwyAAc/KeKsSNvTf+PGP8f51bqnpn/Hin1NXMViWFFFFAFzTz8s4/6ZGqueas2B5m/65N/KqhPNax2Je5na9/qYD/tH+Vc5N/rTXQ66f3EP++f5VgS/6xqoRDinKAByOaXpRHZTX86wwHAOct2HFICveo0luuyNj8wIwKqxQEISY8spwQQeK661mns4FgikhVE6DaW+vJ98n8azdRt22TTrMxZ8FkVcBsUr3GX9KXGl249EqHVrNpEE0YyV4YeoqfSTu0u3bGMrVzFSM5FyEQs5wB61STdNMXIwAa7STTrSZt0kCE+vSo5LK3iwREGB7HtVREzLsYyYT71NMu2J/wDdNWiqAYRAo9qr3J/dv/umtEhGRFFHNLtkBI2MRg45qsdOQyYXK4PrmrELbblM/wB00OxMnB6VAFqG3t8EyQqcdSRWlHJYxoAkcYX021lWxZllyc8ipAOvtUtjNdb+yVuRD9OlSi/sXHAh+gesYLwc1UuYI9ufLUn6UJhsdVG9jKPmjdfdTkU77LYv92Zx9RXDZ8pvkLof9hiKnj1O7i+7ct9HUGmFztPsIx+6mU/Wk8q8j+7tYVyy69cxgb1hkHsStW4fEwH+shmQeqncKAubD3NzGTuhH4Comvw334mH4VFF4ktZMA3Cj2cYq7Hf2069IpB/ssKB3M67ktprZ+gOPpWknCKOwA/lTZ4rGWF90JBxxTx0FNCYUUUUxEdz/wAeze7CqB61euji2x/tCqJq1sA0mkopO1AEF0wWElm2jI5qiVSTnzIj9au3cYki2tnGe1Z76f3jJ+hqGMDbKf4B+BqNrRfRgKBYzg8HH41Ktncg8TY/E0hFc2q4+WRgfegRzKfll4+tWxbygfNKp+q0hhjBy8i5/CgCsTcjO3JXt0NKs8oIDxfpVgNBH/y1H50nnW7MAHyxOABmgZYinXAyhFSiWM+1Sw6ZcTymNFAfaWAJ6gelKukzN12ipuBGWjxwf1oDKP48H60sunSxyomQdxAJ9M1dXQM/ekY/gKAKYuzH0uCPoamj1KfI2zk/rVtfD8I67j9TUi6HCv3V/wDHqAIV1G7X7wDD6U8avMPvQg/TNPOkLjhm/wC+qYdHweHcfjRoA4az/egb8DTv7XTvE4qI6Q2eJH/MVG+jyH/lq/5U9Blr+1oCOQ4/CsjXL6K4RVjLH5snip20WTtIfyqC40uSGJneThQTyKAMXI9vyopPtn+x+tFVcLHYas8l1LcyOQzSg7vY4xWZo93d6L5F5YuxVgDJHnrVyS8UardWrACQNkA/xAiq2mZOnIO4yv61xuKcbPY3jvc9U0TxFZeJrVQ8gS5X5dx6g+jVYntnt5Nki4I5GOc+49a8fi+02Uq3tg5WUfeXs1ej+FfG1trNuLS/4kXgqfvIfUe1c3NPD76x/IqUFPVLU1GXGP0/+t/hURXPT/D/APVV+7tGhAdWDxNysg6H6+lVCMHAzx+Y/wARXdCakro5mraMh2e3Sgp6j/P+fSpMcj9P/rUpUYP68fz9KoRTdBnnvUFzaQXC/vFG4fxDqPxq88eScjk9ff8AxqPyht/z/n86AOc1DTrryGjt3jkUkH95wRg1mMzxttljZG9D/Q967B7bg4OMfp/hVaSxEi7XUMp7GkBjQHMan2qXtUs9hJbDMUZaIehyRUCuHHynOOtMDPvlxfy+4U/pVcqCKt34/wBPPvGtV8c0mgReseLZR2yasYqCy/1GPc1ZxxQM3LG101lUrJ+8xyJTgZ9jVySxijYsII0J6nYMH8ehrmlcqetWI9aks3MSXGx9obaemD7GmBsSQBUwEULnjjgf0qBoATyOf1quviK5Pa0Pr+7AzThrshB/0W0K9wFP+NOwihfQCO4woAGM8Cq2Ks314L11xGIdo4MZJ/PNUyky9llH+xwfyNTYY6kpqyKzbc4b+6wwaf3oGWbH/WSf9c2/lVSrVn/rm90b+VVM81pHYlmfrg/0aL/f/oax1sprgPJGFKr1JYCtjWjm1j/66f0NZMVvPdN5dtFJK54xGpJ/SmIhigDYL8j0rUtvkwFGAOwrW0r4e6/eqpa0+zIf4p2C/p1rrLT4aW9nF5mq6lwOoiAUfmalvuUlfQ87k+V26YBqWDSL/U1KWdnPNnj5EOPzr1/SvDegJ+9srWCcqcGRz5hB/HgVo3EF0pza3KRIOPKeIFf05FHMNqzszyceGNW0+0Tz7CRVA/gwwH5VV8hwSCOR29K9dE17Gf31mGHTfbuGB/A4NFxplper/pNpG5x/EoyPx61NxHkQibPSoLtSqrmvTLnwbp8pPkvLA3oG3D8jWFqPgO8bBt7iGUDoGBQ/4VUWriZwjY9KrXafunx/dNdLd+GNSswTLaPtH8SjcPzFY9xZnDKwwSMYrS6Ec0kLNNFt5JDcflTWUqTwa1xpc8UsckMiEoGwHFV3hu4AQ9uSP7yfNSAj06CWcSiJd3QmrDWlxGx3QuB9KjGpEO7BVjkYAZC7Ont0qzFrFwvUhhWbWo0yvgruBB/GpDZSgLIYjKhGcLzVxNXjlBE8IPvjNVxHZli0NzLEScgZxikMjs9Dl1dpVtbCbdEAzhGHAPsay2sImzsn2kdQ6Y/lW75V6R+5vlcY/iz/AErMm0m9BLEg98J3qkIyJ0IX1AOM1EgweCRVqe3mjjCyo649RUCoQOlMA3sOCc+x5qRArEkxqCBnI4phHNPHRhQIkt7yRZlRJp1BYDG7IPPvXcHqa4S0G69iHrIv867s/eP1poBD0opTSUwIbs/uQP8Aa/pVE1cvP9Un1NUzVrYBppppe9IaAK94zpaySRqC6DIrDfVro4wVGfQVrandi2typUsZAVGO3+c1zh4xUMZO+o3R/wCWx/AU8STSKC00h/GqR61cj/1YoEPCZByzH6ml8tfQfjSqBtNLikAm1R0UVPYrvvoFx1kX+dQ4q3pK7tWth/00BoYHYyxsNrwnbLGdyH3qyrfaIhcQodjfeAH3G7g1HV3SLtba5a1nP+jXPHsretTsNGJcHdqUY/21/rWnmoL7T/s+q70mjkjWQjKnnOKlFMOo7rS02igBaQ0UlAC000tITSASs3W32abN/umtGsbxG+3T3HrgfrTGjksiijAophc7fVNOjmmW5AIuVOQy98Vm2dxHHK9sco+4sAe+T2ro5gWPuKxdW0lJnNxE7C4UZGOOa44y6M6pRtqhIzww9GIqCS2K3CXFufLmQ5yOM1HZXRdjFN8swOSvrV1xmNsdSOKbQLXU67wj46EjmxvsbvulW6OPUe9dfNZpJD9osmMkP90feSvGXtPNiV1+WUDqPauk8LeNLjTrhba+cg9A7dD7H/GuRxlQfNT27DcVU+Lc7b8ufyb/AAoxn1GPzH+IrQj+zatF5tptSYjLR9m+lVXjKkghgR1Hda7KVaNVXicsoOLsyuU6dMHpzwfp6Gk2/X8ufxHepTkdxz37H60nfGDx2zyPoa2JIGXA6dOnp+BqEryc/jx/MVZYdwfqcfzFQsnOMfhn+RoAi3DaD/X+tUbqxguCWAKSD+JeD+VaWzOeue/HP4jvUTwgjgcdvT/61AHMXmk3XmtMJUl42hcbeB7+tZrMyOVdSjDsRiuwlgcNwDn9f/r1WnsY7lNssYI9cdP8KAMfT33RN7NVwHim/wBn/YUJXeyE9eu2lBBGQQR6igB3UVmaqv8Ap6H1hX+ZrT7Vn6uP9Ktz6wn9DTAzGXmo2Q9ifzqwwphHNSM0dGyLdwST8/etCqGl8ROP9qr+KAFbDLtdQ6+jDNR+Sv8AA7xn0PzD9ef1qSgUAEHnwyblhM3BGIjk9PQ4rNM9x/z6sP8AedRWxa8XC/j/ACrKfrWkdhM2PDL6FJMyeI4U3lwYQ75j/H3+tep6fDYxQL/Z8cCR448pQP5V4NqmDYOCARkfzpPDniO60eZo1vHijOCm5sqD6UPTUa1PoQgHqKoazpqanpklsV+9grzjBHeuJ0/4lvCFXUYRIv8Az0jrrdN8WaTqijyLpA5/hY4NQmpFLmg+ZC6Dpb6TBLDsCo77x82T+NaTKvOM59BxUisrjKkEe1KRnqKajYUpuT5pbkHlqr5VQCfWjy2wfX3qcDA4oosSVmiz1AzUTRVbkZIxl2VR7mqUuoQJ9zc/0FKwDDER0yPpVW60u1vVIubWGUerIM/nRJqcr58qAqPUr/jVCX+0LiRSZAiBs8kk/l0o0RWpVn8C6XdsfszPbv6K+4fr/jWLefD2/iy1tLFOo9flNdchdDlM5HcGpv7SaFN86ooHctindCPLb/w7eW6EXdg5X127h+YrDk0a2JO1Hib/AGTj9K9nfxRY7JCRvdATt9fxqSKw0zX7FLiWyj/eDPzLyPxp6geFvo8qBvJnDezrj+VU5bS6iHzwEj1Q5r228+Henz820kkJPYHI/I1z198PdRgybeSOZfQ/KaQHlYm2NjcyEdjkVZS+uFHyyEj35rqL7w/fWwIvLGQKO5TI/OsaXSbVzwhjb/ZOKBEP9qybQHVHHuKjaWyuD+9tkBPccU6TR5MfuZ846BxVZ7K7h+/BvHqhzTAe+l2koJhkZD6ZDVWOkTbWZCrD34NNLhWw26M/7QxViOZ1Q7HzSAqWdlJHqMG5CB5i89e9dkRzWBY3DveRI4VsuOcc10RFVECM0hFPxTSMGqEVb0/Kg+tUzVu+/g+lVDVgNpppxppoAx9fPEQ9iax261q68f3sQ9F/rWU33qhjGd6vIMKKojqKvr0FAh6/dP1paF+7RSAK0NDXdq8Ptk/pWfWp4dXOqg/3UY0mB1YpWXeuDwexoFL2oGVY737TcJCVIaMliexxxVysrT+b6VvRT+p/+tWpQAtGaSjNAC0U3NGaAF70hoJpCaACuf8AE7/6Oq+rf0rfzXMeJ3y8S+5NAzBopM+1FMk9WlhByQtUmUhmCqCT61pTA44GKzpdyucYrz+U9BSsc/q+izy3AuoWVWVdw2/rUVhf/aB5cvyzL1HrXQOzHoxHtisDVtMJP2i2yrrzxWkXfRkONndFqNhhh/tGo7i3SdcEfN2I7VU0+884OsmBKDyPX3q6HNNqwr3Lnh/xJcaFN5V07GBT8rjqo/qK9VsdRtdct0LSKJSuUlU8NXi11+9KRNwrcZqTRtbu/DlwEfMlsTkp6e61zVKDT9pS3HdNcsj2C4tpLeQpIuG/RvpUO3IIxwOo7j6UaH4ltNZskSdxJE33X7qfQ1cu7J7Yhid0Z+7IP61tQxKqaPRnPUpuDKJXjOf+BD+tMKdsDnt2NTkc9g3r2amFeCAPqh/pXSZkW368du4pCOM547sP6in4yO5H6rQVPX/x4f1pgV3Axg4x29D9PSoyoJxzn07irDIecLg+nY1CV9sjup6j6UARrGDk9fUgfzFUrnSY5CXhPkyHuPun8K0Rk8/k3p9aGOACOD39DQBzkqzWjbbmPaP745U1R1Z1eS0KsD8jdDnvXVSbWDIy5Dfwn+lZV1oljMciHY/99OGFMDnTUZq3d6ZdWmWC+dF/eQcj6iqIcMPlOfWpGaml8pJ9RWgKzNIbJlH0rTpgL3pO9LRSAfb8XCfWsx/vH61pwf8AHxH9azX+831rSGwmUdTH+gSfh/OsAgEYPSug1H/jwl+g/nWAelUIltndUAViB6VcjZgwYHDeoOKo2x+UfSn3mfJUgkHNRyoq502m+K9T09wkF6xx/A5zXWaf8TZ0AW+tQw/vJ/hXj0rvJgsfmHRh1rT0vW4rSAwahayXC7srMkm11Hoc8GhxaGmnue5WHjzR73AM3lMez8Vtpd214gMFyCD3Rq+f/tEU6CWFJPKbkB8bh+VLDqM9s+ba5kiPoGIpXHyo99ksPMXKyncDkEgNWfcadqCyF4pFfnIUEgD6CvLbLx5rdlgeeJlHZxXRWPxXIwL6zPuyHNO1xWaOhmN8lyDcRyxooxwCVP1qaa/hSIsjbm7CorL4h6JeYDT+Ux7PxWrHNpGoN5sbwO5/iU4P5ilyh6nPzanctCXt448A4Lv0z+grn7pL2/uN91dBlP3VjfC/pXoi6NZkk5eTIxiRy4x9DS/2Tbo2Ut4AfXYM0WaC6PPbfTX8p1iV5S5CsY1LEDPrXd6NG0FhHG67CP4T1FWjbsoxt49ulDQh48ZZHHRl6ihtiJTKmQu4ZPanHI9a4vxXdau1rJpenxm4vHwVltwQ0Yz/ABZ4GfrU/hbw9rml3CXGo61PPGy/NaOMgEj19vaiLdtRtJHVlEc/MoNZeoeHdJvATc20WfXbg/mK0WLnvj6VEY+c9/WncRyF34C0+Qk2txLCe2RuH+NY114Ev4gTbvFcAdNpwfyNeimOmmLPakB4"
               + "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")}));
end PrintingMachine;
