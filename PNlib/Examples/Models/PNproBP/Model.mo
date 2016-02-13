within PNlib.Examples.Models.PNproBP;
model Model "Top Model"
  extends Modelica.Icons.Example;
  parameter Integer Nr_Consultant=2 "Number of consultants";
  parameter Integer Nr_Advisor1=2 "Number of advisor type 1";
  parameter Integer Nr_Advisor2=1 "Number of advisor type 2";
  parameter Integer Nr_Controller=1 "Number of Controllers";
  parameter Integer Nr_Installer=2 "Number of installers";
  parameter Integer Nr_Accountant=2 "Number of accountants";
  parameter Real time_between_requests=1.5 "Expected time between two requests";
  parameter Real time_consulting=1 "Time for consulting";
  parameter Real time_preparing=3 "Time for offer preparing";
  parameter Real time_planning=1.5 "Time for order planning";
  parameter Real time_controlling=2 "Time for offer controlling";
  parameter Real time_installation=4 "Time for installation";
  parameter Real time_accounting=1 "Time for order accounting";

  TS RaiseRequest(nOut=1, h=1/time_between_requests)
    "a request is raised from a customer"
    annotation (Placement(transformation(extent={{-400,90},{-380,110}})));
  PD Request(
    nIn=1,
    enablingType=2,
    nOut=1) "Request of a custumer is available"
    annotation (Placement(transformation(extent={{-358,90},{-338,110}})));
  PD Consultants(
    enablingType=2,
    nOut=1,
    nIn=1,
    startTokens=Nr_Consultant,
    maxTokens=Nr_Consultant)
           annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-302,140})));
  PD Solution(nOut=1, nIn=1) "A solution for the customer wish has been found"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-154,104})));
  PD Complete(nIn=1, nOut=1) "Consulting is completed"
    annotation (Placement(transformation(extent={{-256,90},{-236,110}})));
  PD Offer(nOut=1, nIn=1) "The offer is complete"
    annotation (Placement(transformation(extent={{-42,94},{-22,114}})));
  PD No_Solution(nIn=1) "No solution for the costumer wish has been found"
    annotation (Placement(transformation(extent={{-164,60},{-144,80}})));
  PD Advisor1(
    nOut=1,
    enablingType=2,
    nIn=1,
    startTokens=Nr_Advisor1)                    annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-96,144})));
  TD Offer_to_Customer(
    nOut=1,
    delay=8,
    nIn=1,
    arcWeightIn={pre(Offer.t)},
    arcWeightOut={pre(Offer.t)}) "The offers of a day are sent to the customer"
    annotation (Placement(transformation(extent={{4,94},{24,114}})));
  PD Offer_at_Customer(nIn=1, nOut=1) "The offer has arrived the customer"
    annotation (Placement(transformation(extent={{56,94},{76,114}})));
  PNproBP.XOR Replying(upperProb=0.8, lowerProb=0.2)
    "Does the customer answer to the offer?"
    annotation (Placement(transformation(extent={{202,94},{222,114}})));
  PD Answer(nOut=1, nIn=1) "Answer from the customer"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=0,
        origin={270,108})));
  PD Order(nIn=2, nOut=1) "The customer gives the order"
    annotation (Placement(transformation(extent={{376,56},{396,76}})));
  PD No_Order(nIn=2) "no order"
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},
        rotation=180,
        origin={392,114})));
  PD Advisor2(
    enablingType=2,
    startTokens=Nr_Advisor2,
    nOut=1,
    nIn=1) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={324,-32})));
  PD planned_order(nIn=1, nOut=1) "The order is planned"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={234,-112})));
  PD material_order(nIn=1, nOut=1)
    "The planning is complete and the material can be ordered"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={240,-68})));
  PD Material_supplied(nIn=1, nOut=1) "The required material is supplied"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={124,-68})));
  PD Installation_possible(nIn=1, nOut=1) "the installation is possible"
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={8,-68})));
  PD Installer(
    startTokens=Nr_Installer,
    nOut=1,
    nIn=1)  annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-46,-28})));
  PD Installation_complete(nIn=1, nOut=1) "The installtion is complete"
                                                    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-124,-66})));
  PD Invoice(nIn=1, nOut=1)
    "the invoice is complete and is sent to the customer"
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-242,-66})));
  PD Order_complete(nIn=1) "the order is completed"
                                            annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-334,-66})));
  inner Settings settings(scale=10, showCapacity=2)
    annotation (Placement(transformation(extent={{-420,166},{-386,200}})));
  PNproBP.Parallel Consulting(
    nIn=2,
    nOut=2,
    delay=time_consulting,
    noParallel=Nr_Consultant) "the customer is coundeled"
    annotation (Placement(transformation(extent={{-312,90},{-292,110}})));
  PNproBP.XOR Resluting(upperProb=0.9, lowerProb=0.1)
    "Result of the Consulting"
    annotation (Placement(transformation(extent={{-214,90},{-194,110}})));
  PNproBP.Parallel Preparation(
    nIn=2,
    nOut=2,
    delay=time_preparing,
    noParallel=Nr_Advisor1) "Preparation of an offer"
    annotation (Placement(transformation(extent={{-104,94},{-84,114}})));
  PNproBP.XOR Resulting2(upperProb=0.5, lowerProb=0.5) "Result of the answer"
    annotation (Placement(transformation(extent={{310,98},{330,118}})));
  PNproBP.Parallel Accounting(
    noParallel=Nr_Accountant,
    nIn=2,
    nOut=2,
    delay=time_accounting) "Accounting of the order"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-174,-66})));
  PNproBP.Parallel Planning(
    noParallel=Nr_Advisor2,
    nIn=2,
    nOut=3,
    delay=time_planning) "The order is planned"
            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={326,-68})));
  PNproBP.Parallel Controlling(
    noParallel=Nr_Controller,
    nIn=3,
    nOut=2,
    delay=time_controlling) "Control the order"
            annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={74,-68})));
  PNproBP.Parallel Installation(
    arcWeightIn={1,2},
    nIn=2,
    nOut=2,
    delay=time_installation,
    noParallel=2,
    arcWeightOut={2,1}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-46,-68})));
  PNproBP.Workload w_Consultants
                             annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-303,169})));
  PNproBP.Workload w_Advisor                annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-95,169})));
  PNproBP.Workload w_Advisor2
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={323,-3})));
  PNproBP.Workload w_Installer
                              annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-45,-3})));
  PNproBP.TotalNumber t_Auftraege annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-349,125})));
  PNproBP.TotalNumber t_Order   annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={387,91})));
  PNproBP.TotalNumber t_solution
                                annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-155,131})));
  PNproBP.TotalNumber t_Offer   annotation (Placement(transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-33,129})));
  PD No_Answer(nOut=1, nIn=1) "Nor answer from the customer"
    annotation (Placement(transformation(extent={{260,60},{280,80}})));
  PNproBP.XOR Calling(upperProb=0.8, lowerProb=0.2)
    "Call the customer to get the answer"
    annotation (Placement(transformation(extent={{310,60},{330,80}})));
  PD WaitingTime_over(nOut=1, nIn=1) "The waiting time of the answer is over"
    annotation (Placement(transformation(extent={{150,94},{170,114}})));
  PNproBP.Waiting Waiting(delay=40) "Waiting of the answer from the customer"
    annotation (Placement(transformation(extent={{102,94},{122,114}})));
  PNproBP.Waiting Supply(delay=40) "Waitin on the required material"
                                      annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={182,-68})));
  PNproBP.Waiting Payment(delay=40) "Wait for payment"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-280,-66})));
  PD Accountant(
    startTokens=Nr_Accountant,
    nOut=1,
    nIn=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-178,-22})));
  PNproBP.Workload w_Accountant             annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=90,
        origin={-179,5})));
  PD Controller(
    enablingType=2,
    nOut=1,
    nIn=1,
    startTokens=Nr_Controller)
           annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={72,-24})));
  PNproBP.Workload w_Advisor1
    annotation (Placement(transformation(extent={{-5,-5},{5,5}},
        rotation=90,
        origin={71,5})));
initial equation
  Functions.Random.initRandom(1);
equation

  connect(RaiseRequest.outPlaces[1], Request.inTransition[1])    annotation (
      Line(
      points={{-385.2,100},{-358.8,100}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));

  connect(Offer_to_Customer.outPlaces[1], Offer_at_Customer.inTransition[1])
    annotation (Line(
      points={{18.8,104},{55.2,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));

  connect(Offer.outTransition[1], Offer_to_Customer.inPlaces[1])
                                                                annotation (
      Line(
      points={{-21.2,104},{-21.2,104},{9.2,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Request.outTransition[1], Consulting.inPlaces1[1])
                                                           annotation (Line(
      points={{-337.2,100},{-313,99.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Consultants.outTransition[1], Consulting.inPlaces1[2])
                                                           annotation (Line(
      points={{-312.8,140},{-332,140},{-332,100.5},{-313,100.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Consulting.outPlaces1[1], Complete.inTransition[1])
                                                            annotation (Line(
      points={{-291,99.5},{-272,100},{-256.8,100}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Consulting.outPlaces1[2], Consultants.inTransition[1])
                                                           annotation (Line(
      points={{-291,100.5},{-291,100},{-266,100},{-266,140},{-291.2,140}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Complete.outTransition[1], Resluting.inPlaces1)
                                                    annotation (Line(
      points={{-235.2,100},{-235.2,100},{-215,100}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Solution.outTransition[1], Preparation.inPlaces1[1])
                                                            annotation (Line(
      points={{-143.2,104},{-124,104},{-105,103.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Advisor1.outTransition[1], Preparation.inPlaces1[2])
    annotation (Line(
      points={{-106.8,144},{-138,144},{-138,104.5},{-105,104.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Preparation.outPlaces1[1], Offer.inTransition[1]) annotation (Line(
      points={{-83,103.5},{-42.8,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Answer.outTransition[1], Resulting2.inPlaces1)      annotation (Line(
      points={{280.8,108},{280.8,108},{309,108}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Preparation.outPlaces1[2], Advisor1.inTransition[1])
    annotation (Line(
      points={{-83,104.5},{-46,104.5},{-46,144},{-85.2,144}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Resulting2.outPlaces1, No_Order.inTransition[1])
                                                    annotation (Line(
      points={{331,112},{381.2,113.5}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Resulting2.outPlaces2, Order.inTransition[1])  annotation (Line(
      points={{331,104},{344,104},{344,65.5},{375.2,65.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));

  connect(Consultants.pd_t, w_Consultants.u)
                                     annotation (Line(
      points={{-302,150.6},{-302,163},{-303,163}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(No_Answer.outTransition[1], Calling.inPlaces1)     annotation (Line(
      points={{280.8,70},{309,70}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Calling.outPlaces1, No_Order.inTransition[2])
                                                       annotation (Line(
      points={{331,74},{354,74},{354,114.5},{381.2,114.5}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Calling.outPlaces2, Order.inTransition[2])        annotation (Line(
      points={{331,66},{375.2,66.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(WaitingTime_over.outTransition[1], Replying.inPlaces1)
                                                              annotation (Line(
      points={{170.8,104},{170.8,104},{201,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Replying.outPlaces1, Answer.inTransition[1])      annotation (Line(
      points={{223,108},{223,108},{259.2,108}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Replying.outPlaces2, No_Answer.inTransition[1])         annotation (
      Line(
      points={{223,100},{236,100},{236,70},{259.2,70}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Offer_at_Customer.outTransition[1], Waiting.inPlaces1)
                                                                annotation (
      Line(
      points={{76.8,104},{101,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Waiting.outPlaces1, WaitingTime_over.inTransition[1])
                                                        annotation (Line(
      points={{123,104},{123,104},{149.2,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Resluting.outPlaces1, Solution.inTransition[1])
                                                         annotation (Line(
      points={{-193,104},{-193,104},{-164.8,104}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Resluting.outPlaces2, No_Solution.inTransition[1])   annotation (Line(
      points={{-193,96},{-183.5,96},{-183.5,70},{-164.8,70}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Advisor2.pd_t, w_Advisor2.u)                   annotation (Line(
      points={{324,-21.4},{324,-9},{323,-9}},
      color={255,127,0},
      smooth=Smooth.None));
  connect(w_Installer.u, Installer.pd_t)
                                       annotation (Line(
      points={{-45,-9},{-46,-17.4}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(t_Auftraege.u,Request. pd_t) annotation (Line(
      points={{-349,119},{-349,118.5},{-348,118.5},{-348,110.6}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(t_solution.u, Solution.pd_t)
                                     annotation (Line(
      points={{-155,125},{-155,125.5},{-154,125.5},{-154,114.6}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(w_Advisor.u, Advisor1.pd_t)                              annotation (
      Line(
      points={{-95,163},{-96,154.6}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(t_Offer.u, Offer.pd_t)     annotation (Line(
      points={{-33,123},{-33,123.5},{-32,123.5},{-32,114.6}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(Accountant.pd_t, w_Accountant.u) annotation (Line(
      points={{-178,-11.4},{-178,-1},{-179,-1}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(Order.outTransition[1], Planning.inPlaces1[1])    annotation (Line(
      points={{396.8,66},{416,66},{416,-67.5},{337,-67.5}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Advisor2.outTransition[1], Planning.inPlaces1[2]) annotation (Line(
      points={{334.8,-32},{350,-32},{350,-68.5},{337,-68.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Planning.outPlaces1[1], Advisor2.inTransition[1]) annotation (Line(
      points={{315,-67.3333},{294,-67.3333},{294,-32},{313.2,-32}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Planning.outPlaces1[2], material_order.inTransition[1]) annotation (
      Line(
      points={{315,-68},{250.8,-68}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(material_order.outTransition[1], Supply.inPlaces1) annotation (Line(
      points={{229.2,-68},{193,-68}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Supply.outPlaces1, Material_supplied.inTransition[1]) annotation (
      Line(
      points={{171,-68},{134.8,-68}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Planning.outPlaces1[3], planned_order.inTransition[1]) annotation (
      Line(
      points={{315,-68.6667},{282,-68.6667},{282,-112},{244.8,-112}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Material_supplied.outTransition[1], Controlling.inPlaces1[1])
    annotation (Line(
      points={{113.2,-68},{99.1,-68},{99.1,-67.3333},{85,-67.3333}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Controlling.outPlaces1[1], Installation_possible.inTransition[1])
    annotation (Line(
      points={{63,-67.5},{40.9,-67.5},{40.9,-68},{18.8,-68}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(planned_order.outTransition[1], Controlling.inPlaces1[2]) annotation (
     Line(
      points={{223.2,-112},{102,-112},{102,-68},{85,-68}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Installation_possible.outTransition[1], Installation.inPlaces1[1])
    annotation (Line(
      points={{-2.8,-68},{-18.9,-68},{-18.9,-67.5},{-35,-67.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Installer.outTransition[1], Installation.inPlaces1[2]) annotation (
      Line(
      points={{-35.2,-28},{-22,-28},{-22,-68.5},{-35,-68.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Installation.outPlaces1[1], Installer.inTransition[1]) annotation (
      Line(
      points={{-57,-67.5},{-72,-67.5},{-72,-28},{-56.8,-28}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Installation.outPlaces1[2], Installation_complete.inTransition[1])
    annotation (Line(
      points={{-57,-68.5},{-56,-68.5},{-56,-66},{-113.2,-66}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Installation_complete.outTransition[1], Accounting.inPlaces1[1])
    annotation (Line(
      points={{-134.8,-66},{-148.9,-66},{-148.9,-65.5},{-163,-65.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Accountant.outTransition[1], Accounting.inPlaces1[2]) annotation (
      Line(
      points={{-167.2,-22},{-150,-22},{-150,-66.5},{-163,-66.5}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Accounting.outPlaces1[1], Accountant.inTransition[1]) annotation (
      Line(
      points={{-185,-65.5},{-212,-65.5},{-212,-22},{-188.8,-22}},
      color={0,0,0},
      smooth=Smooth.Bezier,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Accounting.outPlaces1[2], Invoice.inTransition[1]) annotation (Line(
      points={{-185,-66.5},{-207.7,-66.5},{-207.7,-66},{-231.2,-66}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Invoice.outTransition[1], Payment.inPlaces1) annotation (Line(
      points={{-252.8,-66},{-269,-66}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Payment.outPlaces1, Order_complete.inTransition[1]) annotation (Line(
      points={{-291,-66},{-323.2,-66}},
      color={0,0,0},
      smooth=Smooth.None,
      arrow={Arrow.None,Arrow.Filled}));
  connect(Controller.pd_t, w_Advisor1.u)
                                       annotation (Line(
      points={{72,-13.4},{72,-1},{71,-1}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  connect(Controller.outTransition[1], Controlling.inPlaces1[3])
                                                               annotation (Line(
      points={{82.8,-24},{102,-24},{102,-68.6667},{85,-68.6667}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Controlling.outPlaces1[2], Controller.inTransition[1])
                                                               annotation (Line(
      points={{63,-68.5},{54,-68.5},{44,-68},{44,-24},{61.2,-24}},
      color={0,0,0},
      smooth=Smooth.Bezier));
  connect(Order.pd_t, t_Order.u) annotation (Line(
      points={{386,76.6},{386,76.6},{386,85},{387,85}},
      color={255,127,0},
      smooth=Smooth.Bezier));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-420,-145},
            {420,200}}),
                    graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-420,-145},{420,200}})),
    experiment(StopTime=320));
end Model;
