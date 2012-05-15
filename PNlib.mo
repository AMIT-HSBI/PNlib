within ;
package PNlib
  model UserGuide
   extends Modelica.Icons.Information;
    annotation (Documentation(info="<html>
<p>
<h1>Extended Hybrid Petri Nets (xHPN)</h1>
<p>
The xHPN formalism comprises of three different processes, called <b>transitions</b>: discrete, stochastic, and continuous transition,
two different states, called <b>places</b>: discrete and continuous places, and four different <b>arcs</b>: normal, inhibition, test, and read arc. The icons of the formalism are shown
in the following figure.
</p>
<p>
  <img src=\"PNlib/Resources/Images/iconsxHPNklein.png\">
</p>
<p>
Discrete places contain an integer quantity, called <b>tokens</b> or <b>marks</b> while continuous places contain a non-negative real quantity.
These marks initiate transitions to <b>fire</b> according to specific conditions. These firings lead to changes of the marks in the connected places.
</p>
<p>
Discrete transitions are provided with <b>delays</b> and <b>firing conditions</b> and fire first when the associated delay is passed and the conditions are fulfilled.
These fixed delays can be replaced by exponentially distributed random values, then, the corresponding transition is called <b>stochastic transition</b>.
Thereby, the characteristic parameter &lambda; of the exponential distribution can depend functionally on the markings of several places and is recalculated at each point in time
when the respective transition becomes active or when one or more markings of involved places change. Based on the characteristic parameter, the next <b>putative firing time</b> &tau;=time+Exp(&lambda;)
of the transition can be evaluated and it fire when this point in time is reached.
</p>
<p>
Both - discrete and stochastic transitions - <b>fire</b> by removing the arc weight from all input places and adding the arc weight to all output places.
On the contrary, the firing of continuous transitions takes places as a continuous flow determined by the <b>firing speed</b> which can depend functionally on markings and/or time.
</p>
<p>
Places and transitions are connected by <b>normal arcs</b> which are weighted by integer and non-negative real numbers, respectively. But also functions can be written at the arcs depending
on the current markings of the places and/or time. Places can also be connected to transitions by <b>test</b>, <b>inhibition</b>, and <b>read arcs</b>. Then their markings do not change during
the firing process.
In the case of test and inhibitor arcs, the markings are only read to influence the time of firing while read arcs only indicate the usage of the marking in the transition,
e.g. for firing conditions or speed functions.
<p>
If a place is connected to a transition by a test arc, the marking of the place must be greater than the arc weight to enable firing. If a place is connected to a transition by an inhibitor
arc, the marking of the place must be less than the arc weight to enable firing. In both cases the markings of the places are not changed by fining.
</p>
</p>
<h3>Example: Arcs of xHPNs</h3>
<p>
The Petri nets at top contain test arcs and the Petri nets at the bottom inhibitor arcs.
Transition T1 is active with regard to a concrete marking m because the token number of P2 is above the weight of the test arc (m(P2)=3&gt;f(P2&rarr;T1)=2).
However, T2 is not active because the marking of P5 is less than the arc weight (m(P5)=1&lt;f(P5&rarr;T2)=2). T3 is also not active because the token number of P8 is
greater than the weight of the inhibitor arc (m(P8)=3&gt;f(P8&rarr;T3)=2). However, T4 is active because the marking of P11 is less than the arc weight (m(P11)=1&lt;f(P11&rarr;T4)=2).
</p>
<p>
  <img src=\"PNlib/Resources/Images/arcsforma.png\">
</p>
<p>
The <b>conversion</b> of a discrete to a continuous marking is realized by connecting a discrete transition to a continuous place and the conversion from a continuous to a discrete marking is
realized by connecting a continuous place to a discrete transition. However, the conversion is always performed by discrete transitions, discrete places can only influence the time
when continuous transitions fire but their marking cannot be changed during the firing process.
</p>
<h3>Example: Basic concepts of hybrid Petri nets</h3>
<p>
The figure shows examples of these two basic principles:
<ul>
<li> T1 can only fire when P1 has more than zero marks and P3 has at least one mark,
<li> T2 can only fire when P4 has at least one mark and P6 has at least 5.4 marks,
<li> T3 fires by removing one mark from P7 and adding 1.8 marks to P8
<li> T4 fires by removing 0.8 marks from P9 and adding one mark to P10.
</ul></li>
<p>
<p>
  <img src=\"PNlib/Resources/Images/hybridPNklein.png\">
</p>
<p>
It is important to mention that a discrete transition fires always in a discrete manner by removing and adding marks after a delay is passed regardless of whether a
discrete or a continuous place is connected to it. However, a continuous transition fires always by a continuous flow so that a discrete place can only be connected to
continuous transition if it is input as well as output of the transition with arcs of same weight. In this way the continuous transition can only be <b>influenced</b> by a discrete
place but the discrete marking cannot be changed by continuous firing.
</p>
<p>
Summarized, an xHPN comprises of:
<ul>
<li>        discrete and continuous places,
<li>        discrete, stochastic, and continuous transitions,
<li>        places can be connected to transitions by normal, test, inhibitor, and read arcs while transitions can only be connected to places by normal arcs,
<li>        arc weights can be functions depending on markings and/or time,
<li>        discrete place must be input as well as output of continuous transitions with arcs of same weights,
<li>        places can be provided with minimum and maximum capacities,
<li>        discrete transitions can be provided with delays,
<li>        stochastic transitions can be provided with hazard functions depending on markings,
<li>        continuous transitions can be provided with maximum speed function depending on markings and/or time, and
<li>        all transitions can be provided with additional firing conditions depending on all possible model variables.
</ul></li>
</p>
<p>
A formal definition of the xHPN-formalism and the corresponding processes is given in [Proﬂ et al.2012].
</p>
<p>
<h2>Possible conflicts in xHPNs</h2>
<h3>Type-1-Conflict</h3>
<p>
Several conflicts can occur when the places have to enable their connected active transitions. Possibly, a discrete place or a continuous place connected to discrete
transitions has not enough marks to enable all output transitions simultaneously or cannot receive marks from all active input transitions due to the maximum capacity.
Then an actual conflict arises that has to be resolved. This can be either done by providing the transitions with <b>priorities</b> or <b>probabilities</b>.
In the first case, a deterministic process decides which place enables which transitions and in the second case the enabling is performed at random;
thereby transitions assigned with a high probability are chosen preferentially.
</p>
<h4>Example</h4>
<p>
Both transitions of the Petri net example are active because of</br>
m(P1)=2&ge;f(P1&rarr;T1)=1</br>
and</br>
m(P1)=2&ge;f(P1&arr;T2)=2.</br>
But P1 can only enable one of them due to its token number. Hence, P1 has a actual conflict. If the enabling is performed by priorities and T2 has priority 1 and T1 has priority 2,
P1 enables T2. T2 is firable and fires by removing two tokens from P1 and adding one to P3.
If the enabling is performed at random, one of the transitions is enabled according to their assigned probabilities, e.g. T1 has the probability 0.7 and T2 has the probability 0.3.

</p>
<p>
  <img src=\"PNlib/Resources/Images/type1klein.png\">
</p>
<h3>Type-2-Conflict</h3>
<p>
Another conflict can occur between a continuous place and two or more continuous transitions when the input speed is not sufficient to fire all output transitions with the instantaneous speed
(type-2-output-conflict) or when the output speed is not sufficient to fire all input transitions with the instantaneous speed (type-2-input-conflict).
 This conflict is solved by sharing the speeds proportional to the assigned maximum speeds (see [Proﬂ2012]).
</p>
<h4>Example</h4>
<p>
The left Petri net has no actual conflict but P2 and P3 of the right Petri net have an actual conflict. Their input speed is not sufficient to fire T5 and T6 with the respective speed.
</p>
<p>
  <img src=\"PNlib/Resources/Images/type2.png\">
</p>
<h3>Type-3-Conflict</h3>
<p>
If a conflict occurs between a place and continuous as well as discrete/stochastic transitions, the discrete/stochastic transitions take always priority
over the continuous transitions.
</p>
<h4>Example</h4>
<p>
The figure shows two examples of type-3-conflicts. At time 0, transition T1 of the left Petri net becomes active and fires continuously. At time 2, the delay of T2 is passed and
it becomes firable. At this point in time, P3 has an actual conflict because it cannot fire token in T1 and T2, simultaneously.
Hence, T2 takes priority over T1 and fires.
At time 0, transitions T3 and T4 of the right Petri net fire continuously.
At time 1, m(P4)=1 and the delay of T5 is passed; hence, P4 has an actual conflict. The conflict only occurs when the marking equals the arc weight.
If m(P4)&lt;f(P4&rarr;T5) or m(P4)>f(P4&rarr;T5), there is no conflict. It is solved by the rule that T5 takes priority over T4 and fires.
This rule is intuitively logical because the firing of a continuous transition is a continuous flow and the firing of a discrete transition is an extreme change of the Petri net marking.
</p>
<p>
  <img src=\"PNlib/Resources/Images/type3.png\">
</p>
<h3>Type-4-Conflict</h3>
<p>
A last conflict can occur when a discrete place has not enough marks to enable all connected continuous transitions. This is solved by prioritization of the involved transitions.
</p>
<h4>Example</h4>
<p>
The figure shows a hybrid Petri net; place P3 has a type-4-conflict. At time 0, P3 can either activate T1 or T2 but not both simultaneously.
This conflict can be solved by prioritization of the transitions. If T1 takes priority over T2, T1 becomes active and fires and if T2 takes priority over T1,
 T2 becomes active and fires. Therefore, all continuous output transitions of a discrete place have to be provided with priorities.
</p>
<p>
  <img src=\"PNlib/Resources/Images/type4.png\">
</p>
<h1> PNlib: A Modelica Library for Modeling xHPN </h1>
<p>
<b>IMPORTANT:</b>
<ul>
<li> the PNlib works only with Dymola
<li> the file random.c has to be located in the current work directory!
<li> if an xHPN model is connected to Matlab/Simulink, the file random.c has to be located in the Source directory of Dymola
e.g. C:\Program Files (x86)\Dymola 2012 FD01\Source
</ul></li>
</p>
<p>
The advanced Petri Net library, called PNlib, enables the modeling of extended hybrid Petri Nets (xHPN).
It comprises
<ul>
<li> a discrete (PD) and a continuous place (PC),
<li> a discrete (TD), a stochastic (TS), and a continuous transitions (TC), and
<li> a test (TA), an inhibitor (IA), and a read arcs (RA).
</ul></li>
<p>
The main package PNlib is divided into the following sub-packages:
<ul>
<li>Interfaces: contains the connectors of the Petri net component models.
<li>Blocks: contains blocks with specific procedures that are used in the Petri net component
models.
<li>Functions: contains functions with specific algorithmic procedures which are used in
the Petri net component models.
<li>Constants: contains constants which are used in the Petri net component models.
<li>Models: contains several examples and offers the possibility to structure further Petri net
models.
</ul></li>
<p>
Additionally, the package contains the component <b>settings</b> which enables the setting of
global parameters for the display and animation of a Petri net model:
<ul>
<li> showPlaceName: displays the names of places,
<li> showTransitionName: displays the names of transitions,
<li> showDelay: displays the delays of discrete transitions,
<li> showCapacity: displays the minimum and maximum capacities of places,
<li> showWeightTIarc: displays the arc weights of test and inhibitor arcs,
<li> animateMarking: animates the current marking in the places; the change of
<li> tokens/marks is displayed in the places during animation,
<li> animatePlace: animates the color of places. Places change their degree of redness
according to the amount of tokens/marks; thereby, the redness degree is scaled by the
parameter scale from 0 to 100,
<li> antimateTransition: animates the color of transitions. Transitions change their color
to yellow when they fire; thereby, discrete transitions blink yellow for specified time units
(timeFire) while continuous transitions are yellow the whole time when they fire,
<li> animatePutFireTime: animates the putative firing time of stochastic transitions; the
putative firing time is displayed under the transition during animation,
<li> animateHazardFunc: animates the hazard function of stochastic transitions; the hazard
function is displayed under the transition during animation,
<li> animateSpeed: animates the instantaneous speed of continuous transitions; the
instantaneous speed is displayed under the transition during animation,
<li> animateWeightTIarc: animates the weights of threshold and inhibition arcs; the
weights are displayed under the arc during animation,
<li> animateTIarc: animates the color of test and inhibitor arcs; the arc is green when the
weight is satisfied and red otherwise,
</ul></li>
<p>
Places, transitions, and arcs are represented by the icons depicted in the figure. Thereby, the
discrete place is represented by a circle and the continuous place by a double circle. The
transitions are boxes which are black for discrete transitions, black with a white triangle for
stochastic transitions, and white for continuous transitions. The test arc is represented by a
dashed arc, the inhibitor arc by an arc with a white circle at its end, and the read arc by an arc
with a black square at its end.
</p>
<p>
  <img src=\"PNlib/Resources/Images/iconsklein.png\">
</p>
<p>
<h2>Connectors</h2>
</p>
<li> The PNlib contains four different connectors: PlaceOut, PlaceIn, TransitionOut, and TransitionIn.
The connectors PlaceOut and PlaceIn are part of place models and connect them to output and input transitions, respectively.
Similar, TransitionOut and TransitionIn are connectors of the transition model and connect them to output and input places, respectively.
The figure shows which connector belongs to with Petri net component model.
<p>
  <img src=\"PNlib/Resources/Images/connectorsklein.png\">
</p>
The connectors of the Petri net component models are vectors to enable the connection to an arbitrary number of input and output components.
Therefore, the dimension parameters nIn and nOut are declared in the place and transition models with the connectorSizing annotation.
<p>
<h2>Places</h2>
</p>
<li> Parameters and modification possibilities of discrete (d) and continuous (c) places:
<p>
<table border=1 cellspacing=0 cellpadding=5>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Default</th>
    <th>Allowed</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>startTokens/startMarks</td>
    <td>scalar</td>
    <td>0</td>
    <td>integers (d)/positive real values (c)</td>
    <td>Marking at the beginning of the simulation</td>
  </tr>
  <tr>
    <td>minTokens/minMarks</td>
    <td>scalar</td>
    <td>0</td>
    <td>integers (d)/positive real values (c)</td>
    <td>Minimum capacity</td>
  </tr>
  <tr>
    <td>maxTokens/maxMarks</td>
    <td>scalar</td>
    <td>infinite</td>
    <td>integers (d)/positive real values (c)</td>
    <td>Maximum capacity</td>
  </tr>
  <tr>
    <td>enablingType</td>
    <td>choice/scalar</td>
    <td>Priority</td>
    <td>priority or probability</td>
    <td>Type of enabling if type-1-conflicts occur; the priorities are defined by the connection indices and the probabilities by the variables enablingProbIn/Out</td>
  </tr>
  <tr>
    <td>enablingProbIn</td>
    <td>vector</td>
    <td>fill(1/nIn,nIn)</td>
    <td>sum must be equal to one</td>
    <td>Enabling probabilities of input transitions</td>
  </tr>
    <tr>
    <td>enablingProbOut</td>
    <td>vector</td>
    <td>fill(1/nOut,nOut)</td>
    <td>sum must be equal to one</td>
    <td>Enabling probabilities of output transitions</td>
  </tr>
  <tr>
    <td>N</td>
    <td>scalar</td>
    <td>settings1.N</td>
    <td>integers (d)</td>
    <td>Amount of levels for stochastic simulation</td>
  </tr>
   <tr>
    <td>reStart</td>
    <td>condition expression</td>
    <td>false</td>
    <td>Boolean condition expression</td>
    <td>Condition for resetting the marking to reStartTokens/Marks</td>
  </tr>
   <tr>
    <td>reStartTokens/reStartMarks</td>
    <td>scalar</td>
    <td>0</td>
    <td>integers (d)/positive real values (c)</td>
    <td>when the reStart condition is fulfilled, the marking is set to reStartTokens/Marks</td>
  </tr>
</table>
</p>
<p>
If the type-1-conflict is resolved by priorities, the corresponding priorities of the transitions are given by the indices of the connections,
i.e. the transition connected to the place with the index 1 has also the priority 1, the transition connected to the place with the index 2 has also the priority 2 etc.
Otherwise, if the probabilistic enabling type is chosen, the corresponding probabilities for the transitions have to be entered as a vector
(numbers separated by commas within braces). Thereby, the first vector element corresponds to the connection with the index 1, the second to the connection with the index 2 etc.
The input of enabling probabilities as vectors in the place model, and not at the corresponding arcs, is necessary due to the fact that properties cannot be assigned to
connections according to the Modelica Specification 3.2.
</p>
<h3>Example: Input of enabling probabilities</h3>
<p>
Place P1 is connected to the transitions T1, T2, and T3 and the connection to T1 is indexed by 1, the connection to T2 is indexed by 2,
and the connection to T3 is indexed by 3. Thus, the corresponding connect-equations are
connect(P1.outTransition[1], T1.inPlaces[1]);
connect(P1.outTransition[2], T2.inPlaces[1]);
connect(P1.outTransition[3], T3.inPlaces[1]);
The enabling probabilities 0.3 for T1, 0.25 for T2, and 0.45 for T3 have to be entered by the parameter vector
enablingProbOut={0.3,0.25,0.45}.
</p>
<p>
  <img src=\"PNlib/Resources/Images/enablingprobklein.png\">
</p>
<h3>Implementation</h3>
<p>
The main process in the place model is the recalculation of the marking after firing
a connected transition. In the case of the discrete place model, this is realized by the
discrete equation
</p>
<pre>
<b>when</b> tokeninout <b>or<\b>  <b>pre</b>(reStart) <b>then</b>
  t = <b>if</b> tokeninout <b>then</b> <b>pre</b>(t) + firingSumIn - firingSumOut <b>else<\b> reStartTokens;
<b>end when</b>;
</pre>
<p>
whereby pre(t) accesses the marking t immediately before the transitions fire. To
this amount, the arc weight sum of all firing input transitions is added and the arc
weight sum of all firing output transitions is subtracted from it. Additionally, the tokens are reset to reStartTokens when the user-defined condition reStart becomes true.
</p>
<p>
The marking of continuous places can change continuously as well as discretely.
This is implemented by the following construct
</p>
<pre>
der(t) = conMarkChange;
<b>when</b> disMarksInOut <b>then</b>
  <b>reinit</b>(t, t+disMarkChange);
<b>end when</b>;
<b>when</b> reStart <b>then</b>
  <b>reinit</b>(t,reStartMarks);
<b>end when</b>;
</pre>
<p>
whereby the der-operator access the derivative of the marking t according to
time. The continuous mark change is performed by a differential equation while the
discrete mark change is performed by the reinit-operator within a discrete equation.
This operator causes a re-initialization of the continuous marking every time
when a connected discrete transition fires. Additionally, the marking is re-initialized by reStartMarks
when the condition reStart becomes true.
</p>
<h2>Transitions</h2>
<p>
Parameters and modification possibilities of discrete (d), stochastic (s), and continuous (c) transitions
</p>
<p>
<table border=1 cellspacing=0 cellpadding=6>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Part of</th>
    <th>Default</th>
    <th>Allowed</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>delay</td>
    <td>scalar</td>
    <td>d</td>
    <td>1</td>
    <td>positive real values</td>
    <td>Delay of timed transitions</td>
  </tr>
  <tr>
    <td>h</td>
    <td>scalar or scalar function</td>
    <td>s</td>
    <td>1</td>
    <td>positive real values</td>
    <td>Hazard function to determine the characteristic value of exponential distribution</td>
  </tr>
  <tr>
    <td>maximumSpeed</td>
    <td>scalar or scalar function</td>
    <td>c</td>
    <td>1</td>
    <td>positive real values</td>
    <td>Maximum speed</td>
  </tr>
  <tr>
    <td>arcWeightIn</td>
    <td>vector or vector function</td>
    <td>d, s, c</td>
    <td>fill(1,nIn)</td>
    <td>integers (d, s) positive real values (c)</td>
    <td>Weights of input arcs</td>
  </tr>
  <tr>
    <td>arcWeightOut</td>
    <td>vector or vector function</td>
    <td>d, s, c</td>
    <td>fill(1,nOut)</td>
    <td>integers (d, s) positive real values (c)</td>
    <td>Weights of output arcs</td>
  </tr>
  <tr>
    <td>firingCon</td>
    <td>condition expression</td>
    <td>d, s, c</td>
    <td>true</td>
    <td>Boolean condition expression</td>
    <td>Firing condition</td>
  </tr>
</table>
</p>
<p>
It has to be distinguished between the following input types: scalar, vector, scalar function, vector function, and condition expression.
The input of the different types is demonstrated by the examples. The input of arc weights as vectors in the transition model and not at the respective arcs is necessary
due to the fact that connections cannot be provided with properties according to the Modelica Specification 3.2.
</p>
<h3>Example: Input of arc weights</h3>
<p>
The figure shows a discrete Petri net. The indices of the connections are written at the arcs within square brackets,
e.g. the connection (P1-T1) has the input index [1] and (T1-P5) has the output index [3].
The input of the arc weights displayed after the indices to property dialog or as modification equation is performed by the vector functions
</p>
<p>
arcWeightIn = {2*P1.t,4} and arcWeightOut = {2,1,5*P1.t},
</p>
<p>
whereby the expression P1.t accesses the current token number of P1. Thus, the weights of the arcs (P1-T1) and (T1-P5) are functions which depend on the token number of P1.
Transitions can also be provided with additional conditions that have to be satisfied to permit the activation. The condition
<p>
firingCon = time>9.7
</p>
<p>
causes that the transition cannot be activated as long as time is less than 9.7.
</p>
<p>
  <img src=\"PNlib/Resources/Images/inputarcweightsklein.png\">
</p>
<h3>Example: Input of maximum speed functions</h3>
<p>
The figure shows two continuous Petri nets. Transition T1 has a maximum speed function which depends on the makings of P1 and P2.
The input of this function to the property dialog or as modification equation is performed by the expression
/<p>
<p>
maximumSpeed = 0.75*P1.t*P2.t,
</p>
<p>
whereby P1.t and P2.t accesses the marks of P1 and P2, respectively. Transition T2 has a maximum speed function that depends on time and can be entered by the expression
<p>
maximumSpeed = <b>if</b> time&le;6.5 <b>then</b> 2.6 <b>else</b> 1.7.
</p>
<p>
  <img src=\"PNlib/Resources/Images/inputmaximumspeedklein.png\">
</p>
<h3>Implementation</h3>
<p>
Based on the current markings of the places, it is checked in the transition model by an algorithmic procedure if the transition can become active.
discrete transition waits then as long as the delay is passed and a stochastic transition waits till the next putative firing time is reached.
Based on this information the places enable some of the active transition to fire.
At this point, several conflicts can occur which have to be resolved appropriately by the methods mentioned in [Proﬂ2012] to get a successful and reliable simulation.
When a transition is enabled by all its connected places, it is firable and reports this via the connector variable fire to the connected places.
The places recalculate then their markings based on this information.
</p>
<h2>Arcs</h2>
<p>
xHPNs comprise four different kinds of arcs: normal, test, inhibitor, and read arc. The Modelica language do not support the assignment of properties
to arcs that are generated by connect equations. Due to that fact, the test, inhibitor, and read arcs are realized by component models which are interposed between places
and transitions (see figure); the normal arc is simply generated by the connect equation. Test and inhibitor arc can be normal arcs simultaneously.
</p>
<p>
 <img src=\"PNlib/Resources/Images/arcsklein.png\">
</p>
<p>
Parameters of test and inhibitor arcs (read arcs have no parameters)
</p>
<p>
<table border=1 cellspacing=0 cellpadding=6>
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Default</th>
    <th>Allowed</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>testValue</td>
    <td>scalar</td>
    <td>1</td>
    <td>integers if connected to discrete places, positive real values if connected to continuous places</td>
    <td>The marking of the place must be greater to enable firing of transitions (test arc), marking of the place hat to be smaller to enable firing (inhibitor arc)</td>
  </tr>
  <tr>
    <td>normalArc</td>
    <td>choice/scalar</td>
    <td>no</td>
    <td>no or yes</td>
    <td>If yes is chosen then is the arc also a normal arc to change the marking by firing (called double arc)</td>
  </tr>
  </table>
</p>
<h2>Animation</h2>
<p>
A possibility to represent the simulation results of an xHPN model is an animation.
Thereby, several settings can be made in the property dialog of the settings-box. These settings are global and, thus, affect all components of the Petri net model.
By using the prefixes inner and outer, it is achieved that the settings are common to all Petri net components of a model.
The settings-box provides several display and animation options mentioned before.
The animation toolbar allows the control of the animation. An animation offers a way to analyze the marking evolutions of large and complex xHPNs.
The figure shows four selected points in time of the animation of an xHPN example.
</p>
<p>
<img src=\"PNlib/Resources/Images/animationklein.png\">
</p>
<p>
All display and animation options are realized with the DynamicSelect annotation.
</p>
<h2>Connection to Matlab/Simulink</h2>
<p>
To simulate the established xHPN model several times with different parameter settings and use the arising simulation results
for parameter estimation, sensitivity analysis, deterministic and stochastic hybrid simulation, or process optimization (see [Proﬂ2012]),
the Modelica models in Dymola are connected to Matlab/Simulink. This is realized with the aid of a Dymola interface in Simulink and
a set of Matlab m-files utilities [Dynasim201]. All markings which should be available in Matlab have to be declared with the
prefix output on the highest level. This is achieved by creating a connector of the output connector
at the top of the place icon. In the case of discrete places it is an orange IntegerOutput connector and in the case of continuous places
it is a blue RealOutput connector. In the figure above the markings of P1, P3, P5, and P6 are available in Matlab.
</p>
<p>
<b>IMPORTANT:</b> the file random.c has to be located in the Source directory of Dymola
e.g. C:\Program Files (x86)\Dymola 2012 FD01\Source
</p>
<p>
<img src=\"PNlib/Resources/Images/simulink.png\">
</p>
</html>"));
  end UserGuide;

  model References
   extends Modelica.Icons.References;
    annotation (Documentation(info="<html>
  <table border=0 cellspacing=0 cellpadding=2>
    <tr>
      <td valign=top>[Proﬂ 2012]</td>
      <td valign=top>S. Proﬂ,
        Hybrid Modeling and Optimization of Biological Processes,
        <i>PhD thesis</i> (in preparation),Faculty of Technology, Bielefeld University, Germany, 2012.</td>
    </tr>
    <tr>
      <td valign=top>[Proﬂ, Bachmann 2012a]</td>
      <td valign=top>S. Proﬂ, B. Bachmann
        Hybrid Modelling and Process Optimization of Biological Systems,
        <i>MATHMOD Conference</i>, Wien, Austria, 2012.</td>
    </tr>
     <tr>
      <td valign=top>[Proﬂ, Bachmann 2012b]</td>
      <td valign=top>S. Proﬂ, B. Bachmann
        PNlib &minus; An Advanced Petri Library for Hybrid Process Modelling,
        <i>Modelica Conference</i> (submitted), Munich, Germany, 2012.</td>
    </tr>
     <tr>
      <td valign=top>[Proﬂ et al. 2012a]</td>
      <td valign=top>S. Proﬂ, S. J. Janowski, B. Bachmann, C. Kaltschmidt, B. Kaltschmidt,
        PNlib - A Modelica Library for Simulation of Biological Systems based on Extended Hybrid Petri Nets,
        <i>3rd International Workshop on Biological Processes & Petri Nets</i> (accepted), Hamburg, Germany 2012.</td>
    </tr>
    <tr>
      <td valign=top>[Proﬂ et al. 2012b]</td>
      <td valign=top>S. Proﬂ, S. J. Janowski, B. Bachmann, R. Hofest‰dt,
        A New Object-Oriented Petri Net Simulation Environment Based on Modelica,
        <i>Winter Simulation Conference</i> (in preparation), Berlin, Germany, 2012.</td>
    </tr>
 </table>
 </html>"));
  end References;

  model Contact
  extends Modelica.Icons.Contact;
   annotation (Documentation(info="<html>
 <p>This package is developed an maintained by the following contributors</p>
  <table border=1 cellspacing=0 cellpadding=2>
    <tr>
      <th></th>
      <th>Name</th>
      <th>Affiliation</th>
    </tr>
    <tr>
      <td valign=top>Library officer</td>
      <td valign=top>
      <a>S. Proﬂ</a><br>
      <a>mailto: sabrina.pross@fh-bielefeld.de</a><br>
      <td valign=top>University of Applied Sciences Bielefeld</td><br>
        <a>Department of engineering and mathematics</a><br>
        33609 Bielefeld<br>
        Germany<br>
       <a>http://www.fh-bielefeld.de/ammo<a>
      </td>
    </tr>
    <tr>
      <td valign=top>Contributor</td>
      <td valign=top>
      <a>B. Bachmann</a><br>
      <a>mailto: bernhard.bachmann@fh-bielefeld.de</a><br>
      <td valign=top>University of Applied Sciences Bielefeld</td><br>
        <a>Department of engineering and mathematics</a><br>
        33609 Bielefeld<br>
        Germany<br>
       <a>http://www.fh-bielefeld.de/ammo<a>
      </td>
    </tr>
  </table>
 <\html>"));
  end Contact;

  model RevisionHistory
  extends Modelica.Icons.ReleaseNotes;
  annotation (Documentation(
  revisions="<html>
<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
    <tr>
      <th>Version</th>
      <th>Revision</th>
      <th>Date</th>
      <th>Author</th>
      <th>Comment</th>
    </tr>
    <tr>
      <td valign=\"top\">1.0.0</td>
      <td valign=\"top\">1</td>
      <td valign=\"top\">2012-05-15</td>
      <td valign=\"top\">S. Proﬂ</td>
      <td valign=\"top\"></td>
    </tr>
</table>
</html>"));
  end RevisionHistory;

    model PD "Discrete Place"
      discrete Integer t(start = startTokens) "marking";
      parameter Integer nIn=0 "number of input transitions" annotation(Dialog(connectorSizing=true));
      parameter Integer nOut=0 "number of output transitions" annotation(Dialog(connectorSizing=true));
      //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
      parameter Integer startTokens = 0 "start tokens"  annotation(Dialog(enable = true, group = "Tokens"));
      parameter Integer minTokens = 0 "minimum capacity" annotation(Dialog(enable = true, group = "Tokens"));
      parameter Integer maxTokens=PNlib.Constants.Integer_inf
      "maximum capacity"                                                               annotation(Dialog(enable = true, group = "Tokens"));
      Boolean reStart=false "restart condition"       annotation(Dialog(enable = true, group = "Tokens"));
      parameter Integer reStartTokens=startTokens "number of tokens at restart"
                                                                                      annotation(Dialog(enable = true, group = "Tokens"));
      parameter Integer enablingType=1
      "resolution type of actual conflict (type-1-conflict)"                                  annotation(Dialog(enable = true, group = "Enabling"),choices(choice=1
          "Priority",      choice=2 "Probability",__Dymola_radioButtons=true));
      parameter Real enablingProbIn[nIn]=fill(1/nIn,nIn)
      "enabling probabilities of input transitions"   annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
      parameter Real enablingProbOut[nOut]=fill(1/nOut,nOut)
      "enabling probabilities of output transitions"   annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
      parameter Integer N=settings1.N "N+1=amount of levels" annotation(Dialog(enable = true, group = "Level Concentrations"));
      //****MODIFIABLE PARAMETERS AND VARIABLES END****//
      Real levelCon
      "conversion of tokens to level concentration according to M and N of the settings box";
      Integer showPlaceName=settings1.showPlaceName
      "only for place animation and display (Do not change!)";
      Integer showCapacity=settings1.showCapacity
      "only for place animation and display (Do not change!)";
      Integer animateMarking=settings1.animateMarking
      "only for place animation and display (Do not change!)";
      Real color[3] "only for place animation and display (Do not change!)";
  protected
      outer PNlib.Settings settings1
      "global settings for animation and display";
      Real tokenscale "only for place animation and display";
      discrete Integer pret "pre marking";
      Integer arcWeightIn[nIn] "Integer weights of input arcs";
      Integer arcWeightOut[nOut] "Integer weights of output arcs";
      Boolean tokeninout "change of tokens?";
      Boolean fireIn[nIn] "Do input transtions fire?";
      Boolean fireOut[nOut] "Do output transitions fire?";
      Boolean disTransitionIn[nIn] "Are the input transitions discrete?";
      Boolean disTransitionOut[nOut] "Are the output transtions discrete?";
      Boolean activeIn[nIn] "Are delays passed of input transitions?";
      Boolean activeOut[nOut] "Are delay passed of output transitions?";
      Boolean enabledByInPlaces[nIn]
      "Are input transitions are enabled by all their input places?";
      //****BLOCKS BEGIN****// since no events are generated within functions!!!
      //change of activation of output transitions
      Blocks.anyChange activeConOut(vec=pre(activeOut) and not disTransitionOut);
      //Does any delay passed of a connected transition?
      Blocks.anyTrue delayPassedOut(vec=activeOut and disTransitionOut);
      Blocks.anyTrue delayPassedIn(vec=activeIn and disTransitionIn);
      //firing sum calculation
      Blocks.firingSumDis firingSumIn(fire=fireIn and disTransitionIn, arcWeight=arcWeightIn);
      Blocks.firingSumDis firingSumOut(fire=fireOut and disTransitionOut, arcWeight=arcWeightOut);
      //Enabling process
      Blocks.enablingOutDis enableOut(delayPassed=delayPassedOut.anytrue,activeCon=activeConOut.anychange,nOut=nOut,arcWeight=arcWeightOut, t=pret, minTokens=minTokens, TAout=activeOut,enablingType=enablingType,enablingProb=enablingProbOut,disTransition=disTransitionOut);
      Blocks.enablingInDis enableIn(delayPassed=delayPassedIn.anytrue,active=activeIn,nIn=nIn,arcWeight=arcWeightIn, t=pret, maxTokens=maxTokens, TAein=enabledByInPlaces,enablingType=enablingType,enablingProb=enablingProbIn,disTransition=disTransitionIn);
      //****BLOCKS END****//

  public
      PNlib.Interfaces.PlaceIn inTransition[nIn](
      each t=pret,
      each tint=pret,
      each maxTokens=maxTokens,
      each maxTokensint=maxTokens,
      enable=enableIn.TEin_,
      each emptied=false,
      each decreasingFactor=1,
      each disPlace=true,
      each speedSum=0,
      fire=fireIn,
      disTransition=disTransitionIn,
      arcWeightint=arcWeightIn,
      active=activeIn,
      enabledByInPlaces=enabledByInPlaces) "connector for input transitions"
                           annotation (Placement(transformation(extent={{-114,-10},{-98,10}}, rotation=0),visible=DynamicSelect(true,if nIn==0 then false else true),
        iconTransformation(extent={{-116,-10},{-100,10}})));
      PNlib.Interfaces.PlaceOut outTransition[nOut](
      each t=pret,
      each tint=pret,
      each minTokens=minTokens,
      each minTokensint=minTokens,
      enable=enableOut.TEout_,
      each fed=false,
      each decreasingFactor=1,
      each disPlace=true,
      each arcType=1,
      each speedSum=0,
      each tokenInOut=pre(tokeninout),
      fire=fireOut,
      disTransition=disTransitionOut,
      arcWeightint=arcWeightOut,
      active=activeOut,
      each testValue=-1,
      each testValueint=-1,
      each normalArc=2) "connector for output transitions"
                             annotation (Placement(transformation(extent={{100,-10},{116,10}}, rotation=0),visible=DynamicSelect(true,if nOut==0 then false else true)));
      Modelica.Blocks.Interfaces.IntegerOutput pd_t=t
      "connector for Simulink connection"                                                 annotation (Placement(
            transformation(extent={{-36,68},{-16,88}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,106})));
    equation
      //****MAIN BEGIN****//
      //recalculation of tokens
      pret=pre(t);
      tokeninout = firingSumIn.firingSum > 0 or firingSumOut.firingSum > 0;
      when tokeninout or pre(reStart) then
        t=if tokeninout then pret + firingSumIn.firingSum - firingSumOut.firingSum else reStartTokens;
      end when;
      //Conversion of tokens to level concentrations
      levelCon=t*settings1.M/N;
      //****MAIN END****//
      //****ANIMATION BEGIN****//
      tokenscale= t*settings1.scale;
      color=if settings1.animatePlace==1 then if tokenscale<100 then {255,255-2.55*tokenscale,255-2.55*tokenscale} else {255,0,0} else {255,255,255};
      //****ANIMATION END****//
      //****ERROR MESSENGES BEGIN****//
      assert(sum(enablingProbIn)==1 or nIn==0 or enablingType==1,"The sum of input enabling probabilities has to be equal to 1");
      assert(sum(enablingProbOut)==1 or nOut==0 or enablingType==1,"The sum of output enabling probabilities has to be equal to 1");
      assert(startTokens>=minTokens and startTokens<=maxTokens,"minTokens<=startTokens<=maxTokens");
      //****ERROR MESSENGES END****//
      annotation (defaultComponentName = "P1",Icon(graphics={Ellipse(
              extent={{-100,96},{100,-100}},
              lineColor={0,0,0},
              fillColor=DynamicSelect({255,255,255},color),
              fillPattern=FillPattern.Solid),
          Text(
            extent={{-1.5,25.5},{-1.5,-21.5}},
            lineColor={0,0,0},
            textString=DynamicSelect("%startTokens",if animateMarking==1 then realString(t,1,0) else " ")),
            Text(
              extent={{-90,130},{-90,116}},
              lineColor={0,0,0},
              textString=DynamicSelect(" ",if showCapacity==1 then if maxTokens>1073741822 then  "[%minTokens, inf]" else "[%minTokens, %maxTokens]" else " ")),
                                              Text(
              extent={{-74,-113},{-74,-138}},
              lineColor={0,0,0},
              textString="%name")}),
                               Diagram(graphics));
    end PD;

    model PC "Continuous Place"
      Real t=if t_<0 then 0 else t_ "marking";
      parameter Integer nIn=0 "number of input transitions" annotation(Dialog(connectorSizing=true));
      parameter Integer nOut=0 "number of output transitions" annotation(Dialog(connectorSizing=true));
       //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
      parameter Real startMarks = 0 "start marks"  annotation(Dialog(enable = true, group = "Marks"));
      parameter Real minMarks = 0 "minimum capacity" annotation(Dialog(enable = true, group = "Marks"));
      parameter Real maxMarks=PNlib.Constants.inf "maximum capacity"       annotation(Dialog(enable = true, group = "Marks"));
       Boolean reStart=false "restart condition"       annotation(Dialog(enable = true, group = "Marks"));
      parameter Real reStartMarks=0 "number of marks at restart"       annotation(Dialog(enable = true, group = "Marks"));
      parameter Integer N=settings1.N "N+1=amount of levels" annotation(Dialog(enable = true, group = "Level Concentrations"));
      parameter Integer enablingType=1
      "resolution type of actual conflict (type-1-conflict)"                                  annotation(Dialog(enable = true, group = "Enabling"),choices(choice=1
          "Priority",      choice=2 "Probability",__Dymola_radioButtons=true));
      parameter Real enablingProbIn[nIn]=fill(1/nIn,nIn)
      "enabling probabilities of input transitions"   annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
      parameter Real enablingProbOut[nOut]=fill(1/nOut,nOut)
      "enabling probabilities of output transitions"   annotation(Dialog(enable = if enablingType==1 then false else true, group = "Enabling"));
      //****MODIFIABLE PARAMETERS AND VARIABLES END****//
      Real levelCon
      "conversion of tokens to level concentration according to M and N of the settings box";
      Integer showPlaceName=settings1.showPlaceName
      "only for place animation and display (Do not change!)";
      Integer showCapacity=settings1.showCapacity
      "only for place animation and display (Do not change!)";
      Integer animateMarking=settings1.animateMarking
      "only for place animation and display (Do not change!)";
      Real color[3] "only for place animation and display (Do not change!)";
  protected
      outer PNlib.Settings settings1
      "global settings for animation and display";
      Real disMarkChange "discrete mark change";
      Real conMarkChange "continuous mark change";
      Real arcWeightIn[nIn] "weights of input arcs";
      Real arcWeightOut[nOut] "weights of output arcs";
      Real instSpeedIn[nIn] "instantaneous speed of input transitions";
      Real instSpeedOut[nOut] "instantaneous speed of output transitions";
      Real maxSpeedIn[nIn] "maximum speed of input transitions";
      Real maxSpeedOut[nOut] "maximum speed of output transitions";
      Real prelimSpeedIn[nIn] "preliminary speed of input transitions";
      Real prelimSpeedOut[nOut] "preliminary speed of output transitions";
      Real tokenscale "only for place animation and display";
      Real t_(start = startMarks) "marking";
      Boolean disMarksInOut "discrete marks change";
      Boolean preFireIn[nIn] "pre-value of fireIn";
      Boolean preFireOut[nOut] "pre-value of fireOut";
      Boolean fireIn[nIn] "Does any input transition fire?";
      Boolean fireOut[nOut] "Does any output transition fire?";
      Boolean disTransitionIn[nIn] "Are the input transitions discrete?";
      Boolean disTransitionOut[nOut] "Are the output transitions discrete?";
      Boolean activeIn[nIn] "Are the input transitions active?";
      Boolean activeOut[nOut] "Are the output transitions active?";
      Boolean enabledByInPlaces[nIn]
      "Are the input transitions enabled by all their input places?";
      //****BLOCKS BEGIN****// since no events are generated within functions!!!
      //enabling discrete transitions
      Blocks.enablingInCon enableIn(active=activeIn,delayPassed=delayPassedIn.anytrue,nIn=nIn,arcWeight=arcWeightIn, t=t_, maxMarks=maxMarks,TAein=enabledByInPlaces,enablingType=enablingType, enablingProb=enablingProbIn,disTransition=disTransitionIn);
      Blocks.enablingOutCon enableOut(delayPassed=delayPassedOut.anytrue, nOut=nOut,arcWeight=arcWeightOut, t_=t_, minMarks=minMarks, TAout=activeOut, enablingType=enablingType, enablingProb=enablingProbOut,disTransition=disTransitionOut);
      //Does any delay passed of a connected transition?
      Blocks.anyTrue delayPassedOut(vec=activeOut and disTransitionOut);
      Blocks.anyTrue delayPassedIn(vec=activeIn and disTransitionIn);
      //Does any discrete transition fire?
      Blocks.anyTrue disMarksOut(vec=fireOut and disTransitionOut);
      Blocks.anyTrue disMarksIn(vec=fireIn and disTransitionIn);
      //Is the place fed by input transitions?
      Blocks.anyTrue feeding(vec=preFireIn and not disTransitionIn);
      //Is the place emptied by output transitions?"
      Blocks.anyTrue emptying(vec=preFireOut and not disTransitionOut);
      //firing sum calculation
      Blocks.firingSumCon firingSumIn(fire=preFireIn,arcWeight=arcWeightIn,instSpeed=instSpeedIn,disTransition=disTransitionIn);
      Blocks.firingSumCon firingSumOut(fire=preFireOut,arcWeight=arcWeightOut,instSpeed=instSpeedOut,disTransition=disTransitionOut);
      //decreasing factor calculation
      Blocks.decreasingFactor decreasingFactor(nIn=nIn,nOut=nOut,t=t_,minMarks=minMarks,maxMarks=maxMarks,speedIn= firingSumIn.conFiringSum,speedOut= firingSumOut.conFiringSum,maxSpeedIn=maxSpeedIn,maxSpeedOut=maxSpeedOut,prelimSpeedIn=prelimSpeedIn,prelimSpeedOut=prelimSpeedOut,arcWeightIn=arcWeightIn,arcWeightOut=arcWeightOut,firingIn=fireIn and not disTransitionIn,firingOut=fireOut and not disTransitionOut);
      //****BLOCKS END****//
  public
      Interfaces.PlaceIn inTransition[nIn](each t=t_,
      each tint=1,
      each maxTokens=maxMarks,
      each maxTokensint=1,
      enable=enableIn.TEin_,
      each emptied = emptying.anytrue,
      decreasingFactor = decreasingFactor.decFactorIn,
      each disPlace =  false,
      each speedSum= firingSumOut.conFiringSum,
      fire=fireIn,
      disTransition=disTransitionIn,
      active=activeIn,
      arcWeight=arcWeightIn,
      instSpeed=instSpeedIn,
      maxSpeed=maxSpeedIn,
      prelimSpeed=prelimSpeedIn,
      enabledByInPlaces=enabledByInPlaces) "connector for input transitions"  annotation (Placement(
            transformation(extent={{-114,-10},{-98,10}}, rotation=0),visible=DynamicSelect(true,if nIn==0 then false else true),
        iconTransformation(extent={{-116,-10},{-100,10}})));
      Interfaces.PlaceOut outTransition[nOut](each t = t_,
      each tint=1,
      each minTokens=minMarks,
      each minTokensint=1,
      enable=enableOut.TEout_,
      each fed=feeding.anytrue,
      decreasingFactor=decreasingFactor.decFactorOut,
      each disPlace=false,
      each arcType=1,
      each speedSum=firingSumIn.conFiringSum,
      each tokenInOut=pre(disMarksInOut),
      fire=fireOut,
      disTransition=disTransitionOut,
      active=activeOut,
      arcWeight=arcWeightOut,
      instSpeed=instSpeedOut,
      maxSpeed=maxSpeedOut,
      prelimSpeed=prelimSpeedOut,
      each testValue=-1,
      each testValueint=-1,
      each normalArc=2) "connector for output transitions"  annotation (Placement(
            transformation(extent={{100,-10},{116,10}}, rotation=0),visible=DynamicSelect(true,if nOut==0 then false else true)));
      Modelica.Blocks.Interfaces.RealOutput pc_t=t
      "connector for Simulink connection"                                              annotation (Placement(
            transformation(extent={{-36,68},{-16,88}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,108})));
    equation
      //****MAIN END****//
      //calculation of continuous mark change
      conMarkChange=firingSumIn.conFiringSum-firingSumOut.conFiringSum;
      der(t_)=conMarkChange;
      //calculation of discrete mark change
      disMarkChange=firingSumIn.disFiringSum-firingSumOut.disFiringSum;
      disMarksInOut=disMarksOut.anytrue or disMarksIn.anytrue;
      when disMarksInOut then
          reinit(t_,t_+disMarkChange);
      end when;
      when reStart then
             //restart the marking
          reinit(t_,reStartMarks);
      end when;
      //Conversion of tokens to level concentrations
      levelCon=t*settings1.M/N;
      for i in 1:nOut loop
         preFireOut[i]=if disTransitionOut[i] then fireOut[i] else pre(fireOut[i]);
      end for;
       for i in 1:nIn loop
           preFireIn[i]= if disTransitionIn[i] then fireIn[i] else pre(fireIn[i]);
       end for;
      //****MAIN END****//
      //****ANIMATION BEGIN****//
      //scaling of tokens for animation
      tokenscale= t*settings1.scale;
      color=if settings1.animatePlace==1 then if tokenscale<100 then {255,255-2.55*tokenscale,255-2.55*tokenscale} else {255,0,0} else {255,255,255};
      //****ANIMATION END****//
      //****ERROR MESSENGES BEGIN****//
      assert(sum(enablingProbIn)==1 or nIn==0 or enablingType==1,"The sum of input enabling probabilities has to be equal to 1");
      assert(sum(enablingProbOut)==1 or nOut==0 or enablingType==1,"The sum of output enabling probabilities has to be equal to 1");
      assert(startMarks>=minMarks and startMarks<=maxMarks,"minMarks<=startMarks<=maxMarks");
      //****ERROR MESSENGES END****//
       annotation (defaultComponentName = "P1",Icon(graphics={
            Ellipse(
              extent={{-100,98},{100,-96}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-88,86},{88,-86}},
              lineColor={0,0,0},
              fillColor=DynamicSelect({255,255,255},color),
              fillPattern=FillPattern.Solid),
          Text(
            extent={{-1.5,25.5},{-1.5,-21.5}},
            lineColor={0,0,0},
            origin={0.5,-0.5},
            rotation=0,
            textString=DynamicSelect("%startMarks",if animateMarking==1 then if t>0 then realString(t,1,2) else "0.0" else " ")),
            Text(
              extent={{-90,130},{-90,116}},
              lineColor={0,0,0},
              textString=DynamicSelect(" ",if showCapacity==1 then if maxMarks>1e+30 then  "[%minMarks, inf]" else "[%minMarks, %maxMarks]" else " ")),
                                              Text(
              extent={{-74,-103},{-74,-128}},
              lineColor={0,0,0},
              textString="%name")}),
      Diagram(graphics));
    end PC;

    model TD "Discrete Transition"
      parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing=true));
      parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing=true));
      //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
      parameter Real delay = 1 "delay of timed transition" annotation(Dialog(enable = true, group = "Delay"));
      Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input places"
                                             annotation(Dialog(enable = true, group = "Arc Weights"));
      Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output places"
                                         annotation(Dialog(enable = true, group = "Arc Weights"));
      Boolean firingCon=true "additional firing condition" annotation(Dialog(enable = true, group = "Firing Condition"));
      //****MODIFIABLE PARAMETERS AND VARIABLES END****//
      Integer showTransitionName=settings1.showTransitionName
      "only for transition animation and display (Do not change!)";
      Integer showDelay=settings1.showDelay
      "only for transition animation and display (Do not change!)";
      Real color[3]
      "only for transition animation and display (Do not change!)";
  protected
      outer PNlib.Settings settings1
      "global settings for animation and display";
      Real tIn[nIn] "tokens of input places";
      Real tOut[nOut] "tokens of output places";
      Real testValue[nIn] "test values of input arcs";
      Real firingTime "next putative firing time";
      Real fireTime "for transition animation";
      Real minTokens[nIn] "minimum tokens of input places";
      Real maxTokens[nOut] "maximum tokens of output places";
      Real delay_ "due to problems if d==0";
      Integer tIntIn[nIn]
      "integer tokens of input places (for generating events!)";
      Integer tIntOut[nOut]
      "integer tokens of output places (for generating events!)";
      Integer arcType[nIn]
      "type of input arcs 1=normal, 2=test arc, 3=inhibitor arc, 4=read arc";
      Integer arcWeightIntIn[nIn]
      "Integer arc weights of discrete input places (for generating events!)";
      Integer arcWeightIntOut[nOut]
      "Integer arc weights of discrete output places (for generating events!)";
      Integer minTokensInt[nIn]
      "Integer minimum tokens of input places (for generating events!)";
      Integer maxTokensInt[nOut]
      "Integer maximum tokens of output places (for generating events!)";
      Integer testValueInt[nIn]
      "Integer test values of input arcs (for generating events!)";
      Integer normalArc[nIn]
      "1=no,2=yes, i.e. double arc: test and normal arc or inhibitor and normal arc";
      Boolean active "Is the transition active?";
      Boolean fire "Does the transition fire?";
      Boolean disPlaceIn[nIn]
      "Are the input places discrete or continuous? true=discrete";
      Boolean disPlaceOut[nOut]
      "Are the output places discrete or continuous? true=discrete";
      Boolean enableIn[nIn] "Is the transition enabled by input places?";
      Boolean enableOut[nOut] "Is the transition enabled by output places?";
      Boolean delayPassed "Is the delay passed?";
      Boolean ani "for transition animation";

      //****BLOCKS BEGIN****// since no events are generated within functions!!!
      //activation process
      Blocks.activationDis activation(testValue=testValue,testValueInt=testValueInt,normalArc=normalArc,nIn=nIn,nOut=nOut,tIn=tIn, tOut=tOut,tIntIn=tIntIn, tIntOut=tIntOut, arcType=arcType,arcWeightIn=arcWeightIn,arcWeightIntIn=arcWeightIntIn, arcWeightOut=arcWeightOut, arcWeightIntOut=arcWeightIntOut, minTokens=minTokens, maxTokens=maxTokens, minTokensInt=minTokensInt, maxTokensInt=maxTokensInt,firingCon=firingCon,disPlaceIn=disPlaceIn,disPlaceOut=disPlaceOut);
      //Is the transition enabled by all input places?
      Blocks.allTrue enabledByInPlaces(vec=enableIn);
       //Is the transition enabled by all output places?
      Blocks.allTrue enabledByOutPlaces(vec=enableOut);
      //****BLOCKS END****//
  public
      PNlib.Interfaces.TransitionIn inPlaces[nIn](
      each active=delayPassed,
      arcWeight=arcWeightIn,
      arcWeightint=arcWeightIntIn,
      each fire=fire,
      each disTransition=true,
      each instSpeed=0,
      each prelimSpeed=0,
      each maxSpeed=0,
      t=tIn,
      tint=tIntIn,
      arcType=arcType,
      minTokens=minTokens,
      minTokensint=minTokensInt,
      disPlace=disPlaceIn,
      enable=enableIn,
      testValue=testValue,
      testValueint=testValueInt,
      normalArc=normalArc) "connector for input places"
                           annotation (Placement(transformation(extent={{-56,-10},{-40,10}}, rotation=0),visible=DynamicSelect(true,if nIn==0 then false else true)));
      PNlib.Interfaces.TransitionOut outPlaces[nOut](
      each active=delayPassed,
      arcWeight=arcWeightOut,
      arcWeightint=arcWeightIntOut,
      each fire=fire,
      each enabledByInPlaces=enabledByInPlaces.alltrue,
      each disTransition=true,
      each instSpeed=0,
      each prelimSpeed=0,
      each maxSpeed=0,
      t=tOut,
      tint=tIntOut,
      maxTokens=maxTokens,
      maxTokensint=maxTokensInt,
      disPlace=disPlaceOut,
      enable=enableOut) "connector for output places"                                                                 annotation (Placement(transformation(extent={
                {40,-10},{56,10}}, rotation=0),visible=DynamicSelect(true,if nOut==0 then false else true)));
    equation
      //****MAIN BEGIN****//
       delay_=if delay<=0 then 10^(-6) else delay;  //due to event problems if delay==0
       //reset active when delay passed
       active = activation.active and not pre(delayPassed);
       //save next putative firing time
       when active then
          firingTime=time+delay_;
       end when;
       //delay passed?
       delayPassed= active and time>=firingTime;
       //firing process
       fire=if nOut==0 then enabledByInPlaces.alltrue else enabledByOutPlaces.alltrue;
       //****MAIN END****//
        //****ANIMATION BEGIN****//
        when fire then
         fireTime=time;
         ani=true;
       end when;
       color=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {0,0,0};
       //****ANIMATION END****//
       //****ERROR MESSENGES BEGIN****//
       for i in 1:nIn loop
          if disPlaceIn[i] then
            arcWeightIntIn[i]=integer(arcWeightIn[i]);
          else
            arcWeightIntIn[i]=1;
          end if;
          assert((disPlaceIn[i] and arcWeightIn[i]-arcWeightIntIn[i]<=0.0) or not disPlaceIn[i], "Input arcs connected to discrete places must have integer weights.");
          assert(arcWeightIn[i]>=0, "Input arc weights must be positive.");
       end for;
       for i in 1:nOut loop
          if disPlaceOut[i] then
            arcWeightIntOut[i]=integer(arcWeightOut[i]);
          else
            arcWeightIntOut[i]=1;
          end if;
          assert((disPlaceOut[i] and arcWeightOut[i]-arcWeightIntOut[i]<=0.0) or not disPlaceOut[i], "Output arcs connected to discrete places must have integer weights.");
          assert(arcWeightOut[i]>=0, "Output arc weights must be positive.");
       end for;
       //****ERROR MESSENGES END****//

      annotation (defaultComponentName = "T1",Icon(graphics={Rectangle(
              extent={{-40,100},{40,-100}},
              lineColor={0,0,0},
            fillColor=DynamicSelect({0,0,0},color),
            fillPattern=FillPattern.Solid),
            Text(
              extent={{-2,-116},{-2,-144}},
              lineColor={0,0,0},
              textString=DynamicSelect("d=%delay",if showDelay==1 then "d=%delay" else " ")),
                                              Text(
              extent={{-4,139},{-4,114}},
              lineColor={0,0,0},
              textString="%name")}),                                                            Diagram(graphics));
    end TD;

    model TS "Stochastic Transition"
      //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
      parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing=true));
      parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing=true));
      Real h=1 "user-defined hazard function" annotation(Dialog(enable = true, group = "Exponential Distribution"));
      Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input places"
                                             annotation(Dialog(enable = true, group = "Arc Weights"));
      Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output places"
                                         annotation(Dialog(enable = true, group = "Arc Weights"));
      Boolean firingCon=true "additional firing condition" annotation(Dialog(enable = true, group = "Firing Condition"));
      //****MODIFIABLE PARAMETERS AND VARIABLES END****//
      discrete Real putFireTime "putative firing time";
      Integer showTransitionName=settings1.showTransitionName
      "only for transition animation and display (Do not change!)";
      Integer animatePutFireTime=settings1.animatePutFireTime
      "only for transition animation and display (Do not change!)";
      Integer animateHazardFunc=settings1.animateHazardFunc
      "only for transition animation and display (Do not change!)";
      Real color[3]
      "only for transition animation and display (Do not change!)";
  protected
      outer PNlib.Settings settings1
      "global settings for animation and display";
      discrete Real fireTime "for transition animation";
      discrete Real hold "old value of hazard function";
      Real tIn[nIn] "tokens of input places";
      Real tOut[nOut] "tokens of output places";
      Real minTokens[nIn] "minimum tokens of input places";
      Real maxTokens[nOut] "maximum tokens of output places";
      Real testValue[nIn] "test values of input arcs";
      Integer arcWeightIntIn[nIn]
      "Integer arc weights of discrete input places (for generating events!)";
      Integer arcWeightIntOut[nOut]
      "Integer arc weights of discrete output places (for generating events!)";
      Integer minTokensInt[nIn]
      "Integer minimum tokens of input places (for generating events!)";
      Integer maxTokensInt[nOut]
      "Integer maximum tokens of output places (for generating events!)";
      Integer tIntIn[nIn]
      "Integer tokens of input places (for generating events!)";
      Integer tIntOut[nOut]
      "Integer tokens of output places (for generating events!)";
      Integer arcType[nIn]
      "type of input arcs 1=normal, 2=test arc, 3=inhibitor arc, 4=read arc";
      Integer testValueInt[nIn]
      "Integer test values of input arcs (for generating events!)";
      Integer normalArc[nIn]
      "1=no,2=yes, i.e. double arc: test and normal arc or inhibitor and normal arc";
      Boolean active "Is the transition active?";
      Boolean fire "Does the transition fire?";
      Boolean delayPassed "Is the delay passed?";
      Boolean ani "for transition animation";
      Boolean disPlaceIn[nIn]
      "Are the input places discrete or continuous? true=discrete";
      Boolean disPlaceOut[nOut]
      "Are the output places discrete or continuous? true=discrete";
      Boolean enableIn[nIn] "Is the transition enabled by input places?";
      Boolean enableOut[nOut] "Is the transition enabled by output places?";
      Boolean tokenInOut[nIn] "Have the tokens of input places changed?";
      //****BLOCKS BEGIN****// since no events are generated within functions!!!
      //activation process
      Blocks.activationDis activation(testValue=testValue,testValueInt=testValueInt,normalArc=normalArc,nIn=nIn,nOut=nOut,tIn=tIn, tOut=tOut, tIntIn=tIntIn,tIntOut=tIntOut,arcType=arcType,arcWeightIn=arcWeightIn, arcWeightIntIn=arcWeightIntIn, arcWeightOut=arcWeightOut, arcWeightIntOut=arcWeightIntOut, minTokens=minTokens, maxTokens=maxTokens, minTokensInt=minTokensInt, maxTokensInt=maxTokensInt,firingCon=firingCon,disPlaceIn=disPlaceIn,disPlaceOut=disPlaceOut);
      //Is the transition enabled by all input places?
      Blocks.allTrue enabledByInPlaces(vec=enableIn);
      //Is the transition enabled by all output places?
      Blocks.allTrue enabledByOutPlaces(vec=enableOut);
      //Has at least one input place changed its tokens?
      Blocks.anyTrue tokenChange(vec=tokenInOut);
      //****BLOCKS END****//
  public
      PNlib.Interfaces.TransitionIn inPlaces[nIn](
      each active=delayPassed,
      arcWeight=arcWeightIn,
      arcWeightint=arcWeightIntIn,
      each fire=fire,
      each disTransition=true,
      each instSpeed=0,
      each prelimSpeed=0,
      each maxSpeed=0,
      t=tIn,
      tint=tIntIn,
      arcType=arcType,
      minTokens=minTokens,
      minTokensint=minTokensInt,
      disPlace=disPlaceIn,
      enable=enableIn,
      tokenInOut=tokenInOut,
      testValue=testValue,
      testValueint=testValueInt,
      normalArc=normalArc) "connector for input places"                                                                                              annotation (Placement(transformation(extent={{
                -56,-10},{-40,10}}, rotation=0),visible=DynamicSelect(true,if nIn==0 then false else true)));

      PNlib.Interfaces.TransitionOut outPlaces[nOut](
      each active=delayPassed,
      arcWeight=arcWeightOut,
      arcWeightint=arcWeightIntOut,
      each fire=fire,
      each enabledByInPlaces=enabledByInPlaces.alltrue,
      each disTransition=true,
      each instSpeed=0,
      each prelimSpeed=0,
      each maxSpeed=0,
      t=tOut,
      tint=tIntOut,
      maxTokens=maxTokens,
      maxTokensint=maxTokensInt,
      disPlace=disPlaceOut,
      enable=enableOut) "connector for output places"                                                                annotation (Placement(transformation(extent={
                {40,-10},{56,10}}, rotation=0),visible=DynamicSelect(true,if nOut==0 then false else true)));
    equation
      //****MAIN BEGIN****//
      //reset active when delay passed
      active = activation.active and not pre(delayPassed);
      //delay passed?
      delayPassed = active and time  >= putFireTime;
      //firing process
      fire=if nOut==0 then enabledByInPlaces.alltrue else enabledByOutPlaces.alltrue;
      //****MAIN END****//
      //****ANIMATION BEGIN****//
      when fire then
         fireTime=time;
         ani=true;
       end when;
       color=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {0,0,0};
       //****ANIMATION END****//
       //****ERROR MESSENGES BEGIN****//
        for i in 1:nIn loop
          if disPlaceIn[i] then
            arcWeightIntIn[i]=integer(arcWeightIn[i]);
          else
            arcWeightIntIn[i]=1;
          end if;
          assert((disPlaceIn[i] and arcWeightIn[i]-arcWeightIntIn[i]<=0.0) or not disPlaceIn[i], "Input arcs connected to discrete places must have integer weights.");
          assert(arcWeightIn[i]>=0, "Input arc weights must be positive.");
       end for;
       for i in 1:nOut loop
          if disPlaceOut[i] then
            arcWeightIntOut[i]=integer(arcWeightOut[i]);
          else
            arcWeightIntOut[i]=1;
          end if;
          assert((disPlaceOut[i] and arcWeightOut[i]-arcWeightIntOut[i]<=0.0) or not disPlaceOut[i], "Output arcs connected to discrete places must have integer weights.");
          assert(arcWeightOut[i]>=0, "Output arc weights must be positive.");
       end for;
       //****ERROR MESSENGES END****//
    algorithm
       //****MAIN BEGIN****//
      //generate random putative fire time accoring to Next-Reaction method of Gibson and Bruck
      when active then    //17.06.11 Reihenfolge getauscht!
         putFireTime:=time +Functions.Random.randomexp(h);
         hold:=h;
      elsewhen (active and (h>hold or h<hold)) then  ///  and tokenChange.anytrue
         putFireTime := if h > 0 then time + hold/h*(putFireTime - time) else PNlib.Constants.inf;
         hold:=h;
      end when;
       //****MAIN END****//
    initial equation
                     //to initialize the random generator otherwise the first random number is always the same in every simulation run
        hold=h;
        putFireTime = PNlib.Functions.Random.randomexp(h);
      annotation (defaultComponentName = "T1",Icon(graphics={Rectangle(
              extent={{-40,100},{40,-100}},
              lineColor={0,0,0},
              fillColor=DynamicSelect({0,0,0},color),
              fillPattern=FillPattern.Solid),
          Polygon(
            points={{-40,48},{40,74},{-40,8},{-40,10},{-40,6},{-40,8},{-40,48}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
            Text(
              extent={{-2,-112},{-2,-140}},
              lineColor={0,0,0},
              textString=DynamicSelect(" ",if animateHazardFunc==1 then "h="+realString(h,1,2) else " ")),
            Text(
              extent={{6,-152},{6,-180}},
              lineColor={0,0,0},
              textString=DynamicSelect(" ",if animatePutFireTime==1 then "pt="+realString(putFireTime,1,2) else " ")),
                                              Text(
              extent={{-4,139},{-4,114}},
              lineColor={0,0,0},
              textString="%name")}));
    end TS;

    model TC "Continuous Transition"
      parameter Integer nIn = 0 "number of input places" annotation(Dialog(connectorSizing=true));
      parameter Integer nOut = 0 "number of output places" annotation(Dialog(connectorSizing=true));
      //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
      Real maximumSpeed=1 "maximum speed"  annotation(Dialog(enable = true, group = "Maximum Speed"));
      Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input places"
                                             annotation(Dialog(enable = true, group = "Arc Weights"));
      Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output places"
                                         annotation(Dialog(enable = true, group = "Arc Weights"));
      Boolean firingCon=true "additional firing condition" annotation(Dialog(enable = true, group = "Firing Condition"));
      //****MODIFIABLE PARAMETERS AND VARIABLES END****//
      Boolean fire "Does the transition fire?";
       Real instantaneousSpeed "instantaneous speed";
      Integer showTransitionName=settings1.showTransitionName
      "only for transition animation and display (Do not change!)";
      Integer animateSpeed=settings1.animateSpeed
      "only for transition animation and display (Do not change!)";
      Real color[3]
      "only for transition animation and display (Do not change!)";
  protected
      outer PNlib.Settings settings1
      "global settings for animation and display";
      Real prelimSpeed=preliminarySpeed.prelimSpeed "preliminary speed";
      Real tIn[nIn] "tokens of input places";
      Real tOut[nOut] "tokens of output places";
      Real minTokens[nIn] "minimum tokens of input places";
      Real maxTokens[nOut] "maximum tokens of output places";
      Real speedSumIn[nIn] "Input speeds of continuous input places";
      Real speedSumOut[nOut] "Output speeds of continuous output places";
      Real decreasingFactorIn[nIn] "decreasing factors of input places";
      Real decreasingFactorOut[nOut] "decreasing factors of output places";
      Real testValue[nIn] "test values of test or inhibitor arcs";
      Integer arcType[nIn]
      "type of input arcs 1=normal, 2=test arc, 3=inhibitor arc, 4=read arc";
      Integer arcWeightIntIn[nIn]
      "Integer arc weights of discrete input places (for generating events!)";
      Integer arcWeightIntOut[nOut]
      "Integer arc weights of discrete output places (for generating events!)";
      Integer minTokensInt[nIn]
      "Integer minimum tokens of input places (for generating events!)";
      Integer maxTokensInt[nOut]
      "Integer maximum tokens of output places (for generating events!)";
      Integer tIntIn[nIn]
      "integer tokens of input places (for generating events!)";
      Integer tIntOut[nOut]
      "integer tokens of output places (for generating events!)";
      Integer testValueInt[nIn]
      "Integer test values of input arcs (for generating events!)";
      Integer normalArc[nIn]
      "1=no,2=yes, i.e. double arc: test and normal arc or inhibitor and normal arc";
      Boolean fed[nIn] "Are the input places fed by their input transitions?";
      Boolean emptied[nOut]
      "Are the output places emptied by their output transitions?";
      Boolean disPlaceIn[nIn] "Are the input places discrete?";
      Boolean disPlaceOut[nOut] "Are the output places discrete?";
      Boolean enableIn[nIn]
      "Is the transition enabled by all its discrete input transitions?";
      //****BLOCKS BEGIN****// since no events are generated within functions!!!
      //activation process
      Blocks.activationCon activation(testChange=testArcEvent.testChange, testValue=testValue, testValueInt=testValueInt, normalArc=normalArc,nIn=nIn,nOut=nOut,tIn=tIn,tOut=tOut,tIntIn=tIntIn,tIntOut=tIntOut,arcType=arcType,arcWeightIn=arcWeightIn,arcWeightOut=arcWeightOut,arcWeightIntIn=arcWeightIntIn,arcWeightIntOut=arcWeightIntOut,minTokens=minTokens,maxTokens=maxTokens,minTokensInt=minTokensInt,maxTokensInt=maxTokensInt,firingCon=firingCon,fed=fed,emptied=emptied,disPlaceIn=disPlaceIn,disPlaceOut=disPlaceOut);
      //preliminary speed calculation
      PNlib.Blocks.preliminarySpeed  preliminarySpeed(nIn=nIn,nOut=nOut,arcWeightIn=arcWeightIn,arcWeightOut=arcWeightOut,speedSumIn=speedSumIn,speedSumOut=speedSumOut,maximumSpeed=maximumSpeed,active=activation.active,weaklyInputActiveVec=activation.weaklyInputActiveVec,weaklyOutputActiveVec=activation.weaklyOutputActiveVec);
      //Check test values of test arcs
      Blocks.testArcEvent testArcEvent(nIn=nIn,tIn=tIn,testValue=testValue);
      //firing process
      Blocks.allTrue fire_(vec=enableIn or not disPlaceIn);
      //****BLOCKS END****//
  public
      Interfaces.TransitionIn[nIn] inPlaces(each active=activation.active,
       each fire=fire,
       arcWeight=arcWeightIn,
       arcWeightint=arcWeightIntIn,
       each disTransition = false,
       each instSpeed = instantaneousSpeed,
       each prelimSpeed = prelimSpeed,
       each maxSpeed =  maximumSpeed,
       t=tIn,
       tint=tIntIn,
       arcType=arcType,
       minTokens=minTokens,
       minTokensint=minTokensInt,
       fed=fed,
       disPlace=disPlaceIn,
       enable=enableIn,
       speedSum=speedSumIn,
       decreasingFactor=decreasingFactorIn,
       testValue=testValue,
       testValueint=testValueInt,
       normalArc=normalArc) "connector for input places"  annotation (Placement(transformation(extent={{ -56,-10},{-40,10}}, rotation=0),visible=DynamicSelect(true,if nIn==0 then false else true)));
      Interfaces.TransitionOut[nOut] outPlaces(each active=activation.active,
      each fire=fire,
      each enabledByInPlaces = true,
      arcWeight=arcWeightOut,
      arcWeightint=arcWeightIntOut,
      each disTransition = false,
      each instSpeed = instantaneousSpeed,
      each prelimSpeed = prelimSpeed,
      each maxSpeed =  maximumSpeed,
      t=tOut,
      tint=tIntOut,
      maxTokens=maxTokens,
      maxTokensint=maxTokensInt,
      emptied=emptied,
      disPlace=disPlaceOut,
      speedSum=speedSumOut,decreasingFactor=decreasingFactorOut)
      "connector for output places"                                                            annotation (Placement(transformation(extent={{40,-10},{56,10}}, rotation=0),visible=DynamicSelect(true,if nOut==0 then false else true)));
    equation
       //****MAIN BEGIN****//
        //firing process
       fire=fire_.alltrue and activation.active and not maximumSpeed<=0;
       //instantaneous speed calculation
       instantaneousSpeed=min(min(min(decreasingFactorIn),min(decreasingFactorOut))*maximumSpeed,prelimSpeed);
      //****MAIN END****//
       //****ANIMATION BEGIN****//
       color=if (fire and settings1.animateTransition==1) then {255,255,0} else {255,255,255};
       //****ANIMATION END****//
       //****ERROR MESSENGES BEGIN****//  hier noch Message gleiches Kantengewicht und auch Kante dis Place!!
       for i in 1:nIn loop
          if disPlaceIn[i] then
            arcWeightIntIn[i]=integer(arcWeightIn[i]);
          else
            arcWeightIntIn[i]=1;
          end if;
          assert((disPlaceIn[i] and arcWeightIn[i]-arcWeightIntIn[i]<=0.0) or not disPlaceIn[i], "Input arcs connected to discrete places must have integer weights.");
          assert(arcWeightIn[i]>=0, "Input arc weights must be positive.");
       end for;
       for i in 1:nOut loop
          if disPlaceOut[i] then
            arcWeightIntOut[i]=integer(arcWeightOut[i]);
          else
            arcWeightIntOut[i]=1;
          end if;
          assert((disPlaceOut[i] and arcWeightOut[i]-arcWeightIntOut[i]<=0.0) or not disPlaceOut[i], "Output arcs connected to discrete places must have integer weights.");
          assert(arcWeightOut[i]>=0, "Output arc weights must be positive.");
       end for;
        //****ERROR MESSENGES END****//

    annotation (defaultComponentName = "T1",Icon(graphics={Rectangle(
              extent={{-40,100},{40,-100}},
              lineColor={0,0,0},
              fillColor=DynamicSelect({255,255,255}, color),
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-2,-116},{-2,-144}},
              lineColor={0,0,0},
              textString=DynamicSelect(" ",if animateSpeed==1 and fire>0.5 then if instantaneousSpeed>0 then realString(instantaneousSpeed,1,2) else "0.0" else " ")),
                                              Text(
              extent={{-4,139},{-4,114}},
              lineColor={0,0,0},
              textString="%name")}));
    end TC;

  model TA "Test Arc"
    //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
    parameter Real testValue=1
      "marking that has to be exceeded to enable firing"                           annotation(Dialog(enable = true, group = "Test Arc"));
    parameter Integer normalArc=1 "Double arc: test and normal arc?" annotation(Dialog(enable = true, group = "Test Arc"),choices(choice=1 "No",
                   choice=2 "Yes",__Dymola_radioButtons=true));
    //****MODIFIABLE PARAMETERS AND VARIABLES END****//
    Integer animateWeightTIarc=settings1.animateWeightTIarc
      "only for transition animation and display (Do not change!)";
    Integer testColor[3]
      "only for transition animation and display (Do not change!)";
    Interfaces.TransitionIn inPlace(active=outTransition.active,
    fire=outTransition.fire,
    arcWeight=if normalArc==1 then 0 else outTransition.arcWeight,
    arcWeightint=if normalArc==1 then 0 else outTransition.arcWeightint,
    disTransition=outTransition.disTransition,
    instSpeed=if normalArc==1 then 0 else outTransition.instSpeed,
    prelimSpeed=if normalArc==1 then 0 else outTransition.prelimSpeed,
    maxSpeed=if normalArc==1 then 0 else outTransition.maxSpeed)
      "connector for place"                                                                  annotation (Placement(transformation(
            extent={{-110,12},{-90,32}}), iconTransformation(extent={{-118,16},
              {-98,36}})));
    Interfaces.PlaceOut outTransition(t=inPlace.t,
    tint=inPlace.tint,
    minTokens=inPlace.minTokens,
    minTokensint=inPlace.minTokensint,
    enable=inPlace.enable,
    fed=inPlace.fed,
    decreasingFactor=inPlace.decreasingFactor,
    disPlace=inPlace.disPlace,
    tokenInOut=inPlace.tokenInOut,
    arcType=2,
    testValue=testValue,
    testValueint=testValueInt,
    normalArc=normalArc,
    speedSum=inPlace.speedSum) "connector for transition"    annotation (Placement(transformation(extent={{28,16},
              {48,36}}),                                                                           iconTransformation(extent={{28,16},
              {48,36}})));
  protected
    outer PNlib.Settings settings1 "global settings for animation and display";
    Integer testValueInt "integer test value (for generating events!)";
  equation
    if outTransition.disPlace then
       testValueInt=integer(testValue);
    else
       testValueInt=1;
    end if;
    //****ANIMATION BEGIN****//
    if inPlace.t>testValue and settings1.animateTIarc==1 then
      testColor={0,255,0};
    elseif settings1.animateTIarc==1 then
      testColor={255,0,0};
    else
      testColor={255,255,255};
    end if;
    //****ANIMATION END****//
    //****ERROR MESSENGES BEGIN****//
    assert((outTransition.disPlace and testValue-testValueInt<=0.0) or not outTransition.disPlace, "Test arcs connected to discrete places must have integer test values.");
    assert(testValue>=inPlace.minTokens, "Test values must be greater or equal than minimum values.");
    //****ERROR MESSENGES END****//
    annotation (defaultComponentName = "TA1",Icon(coordinateSystem(preserveAspectRatio=true, extent={{-98,4},{28,
              48}}), graphics={
          Rectangle(
            extent={{-98,48},{28,4}},
            lineColor={0,0,0},
            fillColor=DynamicSelect({255,255,255},testColor),
            fillPattern=FillPattern.Solid),
          Line(
            points={{-94,24},{22,24}},
            color={0,0,0},
            smooth=Smooth.None,
            pattern=LinePattern.Dash),
          Polygon(
            points={{14,32},{14,16},{26,24},{14,32}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-38,-4},{-38,-16}},
            lineColor={0,0,0},
            lineThickness=0.5,
            textString=DynamicSelect(" ",if animateWeightTIarc==1 then realString(testValue,1,1) else " "))}),        Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-98,0},{28,48}}), graphics));
  end TA;

  model IA "Inhibitor Arc"
    //****MODIFIABLE PARAMETERS AND VARIABLES BEGIN****//
    parameter Real testValue=1
      "marking that has to be deceeded to enable firing"                           annotation(Dialog(enable = true, group = "Inhibitor Arc"));
    parameter Integer normalArc=1 "double arc: inhibitor and normal arc?" annotation(Dialog(enable = true, group = "Inhibitor Arc"),choices(choice=1 "No",
                   choice=2 "Yes",__Dymola_radioButtons=true));
    //****MODIFIABLE PARAMETERS AND VARIABLES END****//
    Integer animateWeightTIarc=settings1.animateWeightTIarc
      "only for transition animation and display (Do not change!)";
    Integer testColor[3]
      "only for transition animation and display (Do not change!)";
    Interfaces.TransitionIn inPlace(active=outTransition.active,
    fire=outTransition.fire,
    arcWeight=if normalArc==1 then 0 else outTransition.arcWeight,
    arcWeightint=if normalArc==1 then 0 else outTransition.arcWeightint,
    disTransition=outTransition.disTransition,
    instSpeed=if normalArc==1 then 0 else outTransition.instSpeed,
    prelimSpeed=if normalArc==1 then 0 else outTransition.prelimSpeed,
    maxSpeed=if normalArc==1 then 0 else outTransition.maxSpeed)
      "connector for place"
            annotation (Placement(transformation(
            extent={{-110,12},{-90,32}}), iconTransformation(extent={{-118,16},
              {-98,36}})));
    Interfaces.PlaceOut outTransition(
   t=inPlace.t,
    tint=inPlace.tint,
    minTokens=inPlace.minTokens,
    minTokensint=inPlace.minTokensint,
    enable=inPlace.enable,
    fed=inPlace.fed,
    decreasingFactor=inPlace.decreasingFactor,
    disPlace=inPlace.disPlace,
    tokenInOut=inPlace.tokenInOut,
    arcType=3,
    testValue=testValue,
    testValueint=testValueInt,
    normalArc=normalArc,
    speedSum=inPlace.speedSum) "connector for transition"    annotation (Placement(transformation(extent={{28,16},
              {48,36}}),                                                                           iconTransformation(extent={{28,16},
              {48,36}})));
  protected
    outer PNlib.Settings settings1 "global settings for animation and display";
    Integer testValueInt "integer test value (for generating events!)";
  equation
    if outTransition.disPlace then
       testValueInt=integer(testValue);
    else
       testValueInt=1;
    end if;
    //****ANIMATION BEGIN****//
    if inPlace.t<testValue and settings1.animateTIarc==1 then
      testColor={0,255,0};
    elseif  settings1.animateTIarc==1 then
      testColor={255,0,0};
    else
      testColor={255,255,255};
    end if;
    //****ANIMATION END****//
    //****ERROR MESSENGES BEGIN****//
    assert((outTransition.disPlace and testValue-testValueInt<=0.0) or not outTransition.disPlace, "Test arcs connected to discrete places must have integer test values.");
    assert(testValue>=0, "Test values must be greater or equal than zero.");
    //****ERROR MESSENGES END****//
    annotation (defaultComponentName = "IA1",Icon(coordinateSystem(preserveAspectRatio=true, extent={{-98,4},
              {28,48}}),
                     graphics={
          Rectangle(
            extent={{-98,48},{28,4}},
            lineColor={0,0,0},
            fillColor=DynamicSelect({255,255,255},testColor),
            fillPattern=FillPattern.Solid),
          Line(
            points={{-94,24},{22,24}},
            color={0,0,0},
            smooth=Smooth.None),
          Ellipse(
            extent={{14,30},{26,18}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
         Text(
            extent={{-38,-4},{-38,-16}},
            lineColor={0,0,0},
            lineThickness=0.5,
            textString=DynamicSelect(" ",if animateWeightTIarc==1 then realString(testValue,1,1) else " "))}),        Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-98,0},{28,48}}), graphics));
  end IA;

  model RA "Read Arc"

    Interfaces.TransitionIn inPlace(active=outTransition.active,
    fire=outTransition.fire,
    arcWeight=0,
    arcWeightint=0,
    disTransition=outTransition.disTransition,
    instSpeed=0,
    prelimSpeed=0,
    maxSpeed=0) "connector for place"       annotation (Placement(transformation(
            extent={{-110,12},{-90,32}}), iconTransformation(extent={{-118,16},
              {-98,36}})));
    Interfaces.PlaceOut outTransition(t=inPlace.t,
    tint=inPlace.tint,
    minTokens=inPlace.minTokens,
    minTokensint=inPlace.minTokensint,
    enable=inPlace.enable,
    fed=inPlace.fed,
    decreasingFactor=inPlace.decreasingFactor,
    disPlace=inPlace.disPlace,
    tokenInOut=inPlace.tokenInOut,
    arcType=4,
    testValue=1,
    testValueint=1,
    normalArc=1,
    speedSum=inPlace.speedSum) "connector for transition"    annotation (Placement(transformation(extent={{28,16},
              {48,36}}),                                                                           iconTransformation(extent={{28,16},
              {48,36}})));
  protected
    outer PNlib.Settings settings1 "global settings for animation and display";
    annotation (defaultComponentName = "RA1",Icon(coordinateSystem(preserveAspectRatio=true, extent={{-98,4},
              {28,48}}),
                     graphics={
          Rectangle(
            extent={{-98,48},{28,4}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-94,24},{22,24}},
            smooth=Smooth.None,
            color={0,0,0}),
          Polygon(
            points={{14,30},{14,18},{26,18},{26,30},{14,30}},
            lineColor={0,0,0},
            smooth=Smooth.None,
            fillColor={0,0,0},
            fillPattern=FillPattern.Solid)}),                                                                      Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-98,0},{28,48}}), graphics));
  end RA;

  model Settings "Global Settings for Animation and Display"
    parameter Integer showPlaceName=1 "show names of places" annotation(Dialog(enable = true, group = "Display"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer showTransitionName=1 "show names of transitions" annotation(Dialog(enable = true, group = "Display"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer showDelay=1 "show delays of discrete transitions" annotation(Dialog(enable = true, group = "Display"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer showCapacity=2 "show capacities of places" annotation(Dialog(enable = true, group = "Display"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer animateMarking=1 "animation of markings" annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer animatePlace=1 "animation of places" annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Real scale= 1 "scale factor for place animation 0-100"
                                               annotation(Dialog(enable = if animationPlace==1 then true else false, group = "Animation"));
    parameter Integer animateTransition=1 "animation of transitions"
                                                               annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Real timeFire= 0.3 "time of transition animation"
                                               annotation(Dialog(enable = if animationTransition==1 then true else false, group = "Animation"));
    parameter Integer animatePutFireTime=1
      "animation of putative fire time of stochastic transitions"           annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer animateHazardFunc=1
      "animation of hazard functions of stochastic transitions"                                     annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer animateSpeed=1
      "animation speed of continuous transitions"                                annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer animateWeightTIarc=1
      "show weights of test and inhibitor arcs"                                   annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer animateTIarc=1 "animation of test and inhibition arcs"
                                                               annotation(Dialog(enable = true, group = "Animation"),choices(choice=1 "on",
                   choice=2 "off",__Dymola_radioButtons=true));
    parameter Integer N=10 "N+1=amount of levels" annotation(Dialog(enable = true, group = "Level Concentrations"));
    parameter Real M=1 "maximum concentration"  annotation(Dialog(enable = true, group = "Level Concentrations"));
    annotation(defaultComponentName = "settings1",defaultComponentPrefixes = "inner",missingInnerMessage = "The settings object is missing",
                Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
              {100,100}}),
                         graphics={Rectangle(
            extent={{-98,98},{98,-98}},
            lineColor={0,0,0},
            fillPattern=FillPattern.Solid,
            fillColor={255,255,255}),
                                Text(
            extent={{0,22},{0,-22}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid,
            textString="SETTINGS")}),      Diagram(coordinateSystem(
            preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
          graphics));
  end Settings;

  package Interfaces
    "contains the connectors for the Petri net component models"

    connector PlaceOut
      "part of place model to connect places to output transitions"
      input Boolean active "Are the output transitions active?" annotation(HideResult = true);
      input Boolean fire "Do the output transitions fire?" annotation(HideResult = true);
      input Real arcWeight "Arc weights of output transitions" annotation(HideResult = true);
      input Integer arcWeightint "Integer arc weights of output transitions" annotation(HideResult = true);
      input Boolean disTransition "Are the output transitions discrete?" annotation(HideResult = true);
      input Real instSpeed
        "Instantaneous speeds of continuous output transitions"                    annotation(HideResult = true);
      input Real prelimSpeed
        "Preliminary speeds of continuous output transitions"                      annotation(HideResult = true);
      input Real maxSpeed "Maximum speeds of continuous output transitions" annotation(HideResult = true);
      output Real t "Marking of the place" annotation(HideResult = true);
      output Integer tint "Integer marking of the place" annotation(HideResult = true);
      output Real minTokens "Minimum capacity of the place" annotation(HideResult = true);
      output Integer minTokensint "Integer minimum capacity of the place" annotation(HideResult = true);
      output Boolean enable
        "Which of the output transitions are enabled by the place?"                     annotation(HideResult = true);
      output Real decreasingFactor
        "Factor for decreasing the speed of continuous input transitions"                            annotation(HideResult = true);
      output Boolean disPlace "Type of the place (discrete or continuous)" annotation(HideResult = true);
      output Integer arcType
        "Type of output arcs (normal, test,inhibition, or read)"                      annotation(HideResult = true);
      output Boolean fed "Is the continuous place fed by input transitions?" annotation(HideResult = true);
      output Real speedSum "Input speed of a continuous place" annotation(HideResult = true);
      output Boolean tokenInOut "Does the place have a discrete token change?" annotation(HideResult = true);
      output Real testValue "Test value of a test or inhibitor arc" annotation(HideResult = true);
      output Integer testValueint
        "Integer test value of a test or inhibitor arc"                            annotation(HideResult = true);
      output Integer normalArc
        "Double arc: test and normal arc or inhibitor and normal arc"                        annotation(HideResult = true);
      annotation (Icon(graphics={Polygon(
              points={{-100,100},{98,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end PlaceOut;

    connector TransitionIn
      "part of transition model to connect transitions to input places"
      input Real t "Markings of input places" annotation(HideResult = true);
      input Integer tint "Integer Markings of input places" annotation(HideResult = true);
      input Real minTokens "Minimum capacites of input places" annotation(HideResult = true);
      input Integer minTokensint "Integer minimum capacites of input places" annotation(HideResult = true);
      input Boolean enable "Is the transition enabled by input places?" annotation(HideResult = true);
      input Real decreasingFactor
        "Factor of continuous input places for decreasing the speed"                           annotation(HideResult = true);
      input Boolean disPlace "Types of input places (discrete or continuous)" annotation(HideResult = true);
      input Integer arcType
        "Types of input arcs (normal, test,inhibition, or read)"                     annotation(HideResult = true);
      input Boolean fed "Are the continuous input places fed?" annotation(HideResult = true);
      input Real speedSum "Input speeds of continuous input places" annotation(HideResult = true);
      input Boolean tokenInOut
        "Do the input places have a discrete token change?"                        annotation(HideResult = true);
      input Real testValue "Test value of a test or inhibitor arc" annotation(HideResult = true);
      input Integer testValueint
        "Integer test value of a test or inhibitor arc"                          annotation(HideResult = true);
      input Integer normalArc
        "Double arc: test and normal arc or inhibitor and normal arc"                        annotation(HideResult = true);
      output Boolean active "Is the transition active?" annotation(HideResult = true);
      output Boolean fire "Does the transition fire?" annotation(HideResult = true);
      output Real arcWeight "Input arc weights of the transition" annotation(HideResult = true);
      output Integer arcWeightint "Integer input arc weights of the transition"
                                                                                annotation(HideResult = true);
      output Boolean disTransition
        "Type of the transition(discrete/stochastic or continuous)"                            annotation(HideResult = true);
      output Real instSpeed "Instantaneous speed of a continuous transition" annotation(HideResult = true);
      output Real prelimSpeed "Preliminary speed of a continuous transition" annotation(HideResult = true);
      output Real maxSpeed "Maximum speed of a continuous transition" annotation(HideResult = true);
      annotation (Icon(graphics={Polygon(
              points={{-100,100},{98,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid)}));
    end TransitionIn;

    connector TransitionOut
      "part of transition model to connect transitions to output places"
      input Real t "Markings of output places" annotation(HideResult = true);
      input Integer tint "Integer markings of output places" annotation(HideResult = true);
      input Real maxTokens "Maximum capacities of output places" annotation(HideResult = true);
      input Integer maxTokensint "Integer maximum capacities of output places" annotation(HideResult = true);
      input Boolean enable "Is the transition enabled by output places?" annotation(HideResult = true);
      input Real decreasingFactor
        "Factor of continuous output places for decreasing the speed"                           annotation(HideResult = true);
      input Boolean disPlace "Types of output places (discrete or continuous)" annotation(HideResult = true);
      input Boolean emptied "Are the continuous output places emptied?" annotation(HideResult = true);
      input Real speedSum "Output speeds of continuous output places" annotation(HideResult = true);
      output Boolean active "Is the transition active?" annotation(HideResult = true);
      output Boolean fire "Does the transition fire?" annotation(HideResult = true);
      output Real arcWeight "Output arc weights of the transition" annotation(HideResult = true);
      output Integer arcWeightint
        "Integer output arc weights of the transition"                           annotation(HideResult = true);
      output Boolean enabledByInPlaces
        "Is the transition enabled by all input places?"                                annotation(HideResult = true);
      output Boolean disTransition
        "Type of the transition (discrete/stochastic or continuous)"                            annotation(HideResult = true);
      output Real instSpeed "Instantaneous speed of a continuous transition" annotation(HideResult = true);
      output Real prelimSpeed "Preliminary speed of a continuous transition" annotation(HideResult = true);
      output Real maxSpeed "Maximum speed of a continuous transition" annotation(HideResult = true);
      annotation (Icon(graphics={Polygon(
              points={{-100,100},{98,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end TransitionOut;

    connector PlaceIn
      "part of place model to connect places to input transitions"
      input Boolean active "Are the input transitions active?" annotation(HideResult = true);
      input Boolean fire "Do the input transitions fire?" annotation(HideResult = true);
      input Real arcWeight "Arc weights of input transitions" annotation(HideResult = true);
      input Integer arcWeightint "Integer arc weights of input transitions" annotation(HideResult = true);
      input Boolean enabledByInPlaces
        "Are the input transitions enabled by all theier input places?"                               annotation(HideResult = true);
      input Boolean disTransition
        "Types of input transitions (discrete/stochastic or continuous)"                           annotation(HideResult = true);
      input Real instSpeed
        "Instantaneous speeds of continuous input transitions"                    annotation(HideResult = true);
      input Real prelimSpeed
        "Preliminary speeds of continuous input transitions"                      annotation(HideResult = true);
      input Real maxSpeed "Maximum speeds of continuous input transitions" annotation(HideResult = true);
      output Real t "Marking of the place" annotation(HideResult = true);
      output Integer tint "Integer marking of the place" annotation(HideResult = true);
      output Real maxTokens "Maximum capacity of the place" annotation(HideResult = true);
      output Integer maxTokensint "Integer maximum capacity of the place" annotation(HideResult = true);
      output Boolean enable
        "Which of the input transitions are enabled by the place?"                     annotation(HideResult = true);
      output Real decreasingFactor
        "Factor for decreasing the speed of continuous input transitions"                            annotation(HideResult = true);
      output Boolean disPlace "Type of the place (discrete or continuous)" annotation(HideResult = true);
      output Boolean emptied
        "Is the continuous place emptied by output transitions?"                      annotation(HideResult = true);
      output Real speedSum "Output speed of a continuous place" annotation(HideResult = true);
      annotation (Icon(graphics={Polygon(
              points={{-100,100},{98,0},{-100,-100},{-100,100}},
              lineColor={0,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid)}));
    end PlaceIn;

  end Interfaces;

  package Blocks "
contains blocks with specific procedures that are used in the Petri net component models"
    block activationCon "activation process of continuous transitions"
    //no events are generated within while-loops; for-loops are applied
      parameter input Integer nIn "number of input places";
      parameter input Integer nOut "number of output places";
      input Real tIn[:] "marking of input places";
      input Real tOut[:] "marking of output places";
      input Integer tIntIn[:] "marking of input places";
      input Integer tIntOut[:] "marking of output places";
      input Integer arcType[:] "arc type of input places";
      input Real arcWeightIn[:] "arc weights of input places";
      input Real arcWeightOut[:] "arc weights of output places";
      input Integer arcWeightIntIn[:] "arc weights of input places";
      input Integer arcWeightIntOut[:] "arc weights of output places";
      input Real minTokens[:] "minimum capacities of input places";
      input Real maxTokens[:] "maximum capacities of output places";
      input Integer minTokensInt[:] "minimum capacities of input places";
      input Integer maxTokensInt[:] "maximum capacities of output places";
      input Boolean firingCon "firing condition";
      input Boolean fed[:] "input places are fed?";
      input Boolean emptied[:] "output places are emptied?";
      input Boolean disPlaceIn[:] "types of input places";
      input Boolean disPlaceOut[:] "types of output places";
      input Real testValue[:] "test values of test and inhibitor arcs";
      input Integer testValueInt[:]
        "integer test values of test and inhibitor arcs";
      input Integer normalArc[:] "normal or double arc?";
      input Boolean testChange[:] "Has a test value been exceeded or deceeded?";
      output Boolean active "activation of transition";
      output Boolean weaklyInputActiveVec[nIn]
        "places that causes weakly input activation";
      output Boolean weaklyOutputActiveVec[nOut]
        "places that causes weakly output activation";
    algorithm
      active:=true;
      weaklyInputActiveVec:=fill(false, nIn);
      weaklyOutputActiveVec:=fill(false, nOut);
      //check input places
      for i in 1:nIn loop
        if disPlaceIn[i] then //discrete place
          if arcType[i]==1 and not (tIntIn[i]-arcWeightIntIn[i]  >= minTokensInt[i]) then //normal arc
            active:=false;
          elseif arcType[i]==2 and not (tIntIn[i] > testValueInt[i]) then //test arc
            active:=false;
          elseif arcType[i]==3 and not (tIntIn[i] < testValueInt[i]) then //inhibition arc
            active:=false;
          end if;
        else  //continuous place
          if arcType[i]==1 or normalArc[i]==2 then  //normal arc or double arc
             if not (tIn[i]>minTokens[i] or (tIn[i]<=minTokens[i] and fed[i])) then
                active:=false;
             elseif tIn[i]<=minTokens[i] and fed[i] then  //weakly input active??
                weaklyInputActiveVec[i]:=true;
             end if;
          end if;
          if arcType[i]==2 then //test arc
              if not (tIn[i] > testValue[i]) then
                active:=false;
              end if;
               if testChange[i] and fed[i] and normalArc[i]==2 then  //weakly input active??
                 weaklyInputActiveVec[i]:=true;
               end if;
          elseif arcType[i]==3 and not (tIn[i] < testValue[i]) then  //inhibitor arc
            active:=false;
          end if;
        end if;
      end for;
      //output places
      for i in 1:nOut loop
         if disPlaceOut[i] then  //discrete place
           if not (tIntOut[i]+arcWeightIntOut[i]<=maxTokensInt[i]) then
            active:=false;
           end if;
         else  //continuous place
          if not (tOut[i]<maxTokens[i] or (tOut[i]>=maxTokens[i] and emptied[i])) then
            active:=false;
          elseif tOut[i]>=maxTokens[i] and emptied[i] then
            weaklyOutputActiveVec[i]:=true;
          end if;
         end if;
      end for;
      active:=active and firingCon;
      weaklyOutputActiveVec:=weaklyOutputActiveVec and fill(firingCon,nOut);
      weaklyInputActiveVec:=weaklyInputActiveVec and fill(firingCon,nIn);
    end activationCon;

    block activationDis "Activation of a discrete transition"
      parameter input Integer nIn "number of input places";
      parameter input Integer nOut "number of output places";
      input Real tIn[:] "tokens of input places";
      input Real tOut[:] "tokens of output places";
      input Integer tIntIn[:] "tokens of input places";
      input Integer tIntOut[:] "tokens of output places";
      input Integer arcType[:] "arc type of input places";
      input Real arcWeightIn[:] "arc weights of input places";
      input Integer arcWeightIntIn[:] "arc weights of input places";
      input Real arcWeightOut[:] "arc weights of output places";
      input Integer arcWeightIntOut[:] "arc weights of output places";
      input Real minTokens[:] "minimum capacities of input places";
      input Integer minTokensInt[:] "minimum capacities of input places";
      input Real maxTokens[:] "maximum capacities of output places";
      input Integer maxTokensInt[:] "maximum capacities of output places";
      input Boolean firingCon "firing condition of transition";
      input Boolean disPlaceIn[:] "types of input places";
      input Boolean disPlaceOut[:] "types of output places";
      input Integer normalArc[:] "normal or double arc?";
      input Real testValue[:] "test values of test and inhibitor arcs";
      input Integer testValueInt[:]
        "integer test values of test and inhibitor arcs";
      output Boolean active "activation of transition";
    algorithm
      active:=true;
      //check input places
      for i in 1:nIn loop
        if disPlaceIn[i] then //discrete
          if (arcType[i]==1 or normalArc[i]==2) and not (tIntIn[i]-arcWeightIntIn[i]  >= minTokensInt[i]) then
            active:=false;
          elseif arcType[i]==2 and not (tIntIn[i] > testValueInt[i]) then
            active:=false;
          elseif arcType[i]==3 and not (tIntIn[i] < testValueInt[i]) then
            active:=false;
          end if;
        else  //continuous
          if (arcType[i]==1 or normalArc[i]==2) and not (tIn[i]-arcWeightIn[i]>= minTokens[i]) then
            if not (tIn[i]+Constants.eps-arcWeightIn[i]>= minTokens[i]) then
              active:=false;
            end if;
          elseif arcType[i]==2 and not (tIn[i] > testValue[i]) then
            active:=false;
          elseif arcType[i]==3 and not (tIn[i] < testValue[i]) then
            active:=false;
          end if;
       end if;
      end for;
      //check output places
      for i in 1:nOut loop
       if disPlaceOut[i] then //discrete
          if not (tIntOut[i]+arcWeightIntOut[i]<=maxTokensInt[i]) then
           active:=false;
          end if;
       else  //continuous
          if not (tOut[i]+arcWeightOut[i]<=maxTokens[i]) then
           active:=false;
          end if;
       end if;
      end for;
      active:=active and firingCon;
    end activationDis;

    block allTrue "Are all entries of a Boolean vector true?"
      input Boolean vec[:];
      output Boolean alltrue;
    algorithm
      alltrue:=true;
      for i in 1:size(vec, 1) loop
          alltrue:=alltrue and vec[i];
      end for;
    end allTrue;

    block anyTrue "Is any entry of a Boolean vector true?"
      input Boolean vec[:];
      output Boolean anytrue;
      output Integer numtrue;
    algorithm
      anytrue:=false;
      numtrue:=0;
      for i in 1:size(vec, 1) loop
          anytrue:=anytrue or vec[i];
          if vec[i] then
            numtrue:=numtrue+1;
          end if;
      end for;
    end anyTrue;

    block anyChange "Does any entry of a Boolean vector change its value?"
      input Boolean vec[:];
      output Boolean anychange;
    algorithm
      anychange:=false;
      for i in 1:size(vec, 1) loop
          anychange:=anychange or change(vec[i]);
      end for;
    end anyChange;

    block decreasingFactor "calculation of decreasing factors"
      parameter input Integer nIn "number of input transitions";
      parameter input Integer nOut "number of output transitions";
      input Real t "marking";
      input Real minMarks "minimum capacity";
      input Real maxMarks "maximum capacity";
      input Real speedIn "input speed";
      input Real speedOut "output speed";
      input Real maxSpeedIn[:] "maximum speeds of input transitions";
      input Real maxSpeedOut[:] "maximum speeds of output transitions";
      input Real prelimSpeedIn[:] "preliminary speeds of input transitions";
      input Real prelimSpeedOut[:] "preliminary speeds of output transitions";
      input Real arcWeightIn[:] "arc weights of input transitions";
      input Real arcWeightOut[:] "arc weights of output transitions";
      input Boolean firingIn[:] "firability of input transitions";
      input Boolean firingOut[:] "firability of output transitions";
      output Real decFactorIn[nIn] "decreasing factors for input transitions";
      output Real decFactorOut[nOut]
        "decreasing factors for output transitions";
    protected
      Real maxSpeedSumIn;
      Real maxSpeedSumOut;
      Real prelimSpeedSumIn;
      Real prelimSpeedSumOut;
      Real prelimDecFactorIn;
      Real prelimDecFactorOut;
      Real modSpeedIn;
      Real modSpeedOut;
      Real minMarksMod;
      anyTrue anyFireOut(vec=firingOut);
      anyTrue anyFireIn(vec=firingIn);
      Boolean stop;
    algorithm
      decFactorIn:=fill(-1, nIn);
      decFactorOut:=fill(-1, nOut);
      modSpeedIn:=speedIn;
      modSpeedOut:=speedOut;
      stop:=false;
      maxSpeedSumIn:=0;
      maxSpeedSumOut:=0;
      prelimSpeedSumIn:=0;
      prelimSpeedSumOut:=0;
      prelimDecFactorIn:=0;
      prelimDecFactorOut:=0;
      minMarksMod:=minMarks;
      //-----------------------------------------------------------------------------------------------------------//
      //decreasing factor of input transitions
    if anyFireOut.numtrue>0 and anyFireIn.numtrue>1 then
    //     for i in 1:nIn loop
    //       if firingIn[i] then
    //          prelimSpeedSumIn:=prelimSpeedSumIn + arcWeightIn[i]*prelimSpeedIn[i];
    //          maxSpeedSumIn:=maxSpeedSumIn + arcWeightIn[i]*maxSpeedIn[i];
    //       end if;
    //     end for;
        prelimSpeedSumIn:=Functions.OddsAndEnds.conditionalSum(arcWeightIn.*prelimSpeedIn, firingIn);
        maxSpeedSumIn:=Functions.OddsAndEnds.conditionalSum(arcWeightIn.*maxSpeedIn, firingIn);
        if maxSpeedSumIn>0 then
        if not (t<maxMarks) and  speedOut<prelimSpeedSumIn then   // arcWeights can be zero and then is maxSpeedSumIn zero!!! and not maxSpeedSumIn<=0
          prelimDecFactorIn:=speedOut/maxSpeedSumIn;
          while not stop loop
            stop:=true;
            for i in 1:nIn loop
              if firingIn[i] and prelimDecFactorIn*maxSpeedIn[i]>prelimSpeedIn[i] and decFactorIn[i]<0 and prelimDecFactorIn<1 then
                 decFactorIn[i]:=prelimSpeedIn[i]/maxSpeedIn[i];
                 modSpeedOut:=modSpeedOut - arcWeightIn[i]*prelimSpeedIn[i];
                 maxSpeedSumIn:=maxSpeedSumIn - arcWeightIn[i]*maxSpeedIn[i];
                 stop:=false;
              end if;
            end for;
             if  maxSpeedSumIn>0 then
               prelimDecFactorIn:=modSpeedOut/maxSpeedSumIn;
             else
               prelimDecFactorIn:=1;
            end if;
     //       prelimDecFactorIn:=if not maxSpeedSumIn<=0 then modSpeedOut/maxSpeedSumIn else 1;  // arcWeights can be zero and then is maxSpeedSumIn zero!!!
          end while;
          for i in 1:nIn loop
            if decFactorIn[i]<0 then
              decFactorIn[i]:=prelimDecFactorIn;
            end if;
          end for;
        else
          decFactorIn:=fill(1, nIn);
        end if;
      else
          decFactorIn:=fill(1, nIn);
        end if;
         else
          decFactorIn:=fill(1, nIn);
    end if;
      //-----------------------------------------------------------------------------------------------------------//
      //decreasing factor of output transitions
      stop:=false;
       if anyFireOut.numtrue>1 and anyFireIn.numtrue>0 then
        prelimSpeedSumOut:=Functions.OddsAndEnds.conditionalSum(arcWeightOut.*prelimSpeedOut, firingOut);
        maxSpeedSumOut:=Functions.OddsAndEnds.conditionalSum(arcWeightOut .*maxSpeedOut, firingOut);
        if maxSpeedSumOut>0 then
        if not t>minMarks and speedIn<prelimSpeedSumOut then

          prelimDecFactorOut:=speedIn/maxSpeedSumOut;
          while not stop loop
            stop:=true;
            for i in 1:nOut loop
              if firingOut[i] and prelimDecFactorOut*maxSpeedOut[i]>prelimSpeedOut[i] and decFactorOut[i]<0 and prelimDecFactorOut<1 then
                 decFactorOut[i]:=prelimSpeedOut[i]/maxSpeedOut[i];
                 modSpeedIn:=modSpeedIn - arcWeightOut[i]*prelimSpeedOut[i];
                 maxSpeedSumOut:=maxSpeedSumOut - arcWeightOut[i]*maxSpeedOut[i];
                 stop:=false;
              end if;
            end for;
          if maxSpeedSumOut>0 then
              prelimDecFactorOut:=modSpeedIn/maxSpeedSumOut;
          else
              prelimDecFactorIn:=1;
          end if;
          end while;
          for i in 1:nOut loop
            if decFactorOut[i]<0 then
              decFactorOut[i]:=prelimDecFactorOut;
            end if;
          end for;
        else
          decFactorOut:=fill(1, nOut);
        end if;
        else
           decFactorOut:=fill(1, nOut);
       end if;
       else
           decFactorOut:=fill(1, nOut);
       end if;
    end decreasingFactor;

    block enablingInCon
      "enabling process of input transitions (continuous places)"
      parameter input Integer nIn "number of input transitions";
      input Real arcWeight[nIn] "arc weights of input transitions";
      input Real t "current marking";
      input Real maxMarks "maximum capacity";
      input Boolean TAein[nIn]
        "active input transitions which are already enabled by their input places";
      input Integer enablingType "resolution of actual conflicts";
      input Real enablingProb[nIn] "enabling probabilites of input transitions";
      input Boolean disTransition[nIn] "discrete transition?";
      input Boolean delayPassed "Does any delayPassed of a output transition";
      input Boolean active[nIn] "Are the input transitions active?";
      output Boolean TEin_[nIn] "enabled input transitions";
    protected
      Boolean TEin[nIn] "enabled input transitions";
      Boolean disTAin[nIn] "discret active input transitions";
      Integer remTAin[nIn] "remaining active input transitions";
      Real cumEnablingProb[nIn] "cumulated, scaled enabling probabilities";
      Real arcWeightSum "arc weight sum";
      Integer nremTAin "number of remaining active input transitions";
      Integer nTAin "number ofactive input transitions";
      Integer k "iteration index";
      Integer posTE "possible enabled transition";
      Real randNum "uniform distributed random number";
      Real sumEnablingProbTAin
        "sum of the enabling probabilities of the active input transitions";
      Boolean endWhile;
    algorithm
      when delayPassed then
        if nIn>0 then
          disTAin:=TAein and disTransition;
          arcWeightSum:=Functions.OddsAndEnds.conditionalSum(arcWeight,disTAin);  //arc weight sum of all active input transitions which are already enabled by their input places
          if t + arcWeightSum <= maxMarks or arcWeightSum==0 then  //Place has no actual conflict; all active input transitions are enabled
            TEin:=TAein;
          else                          //Place has an actual conflict
            TEin:=TAein and not disTransition;
            if enablingType==1 then     //deterministic enabling according to priorities
              arcWeightSum:=0;
              for i in 1:nIn loop
                if disTAin[i] and ((t+(arcWeightSum+arcWeight[i])<=maxMarks) or arcWeight[i]==0) then
                  TEin[i]:=true;
                  arcWeightSum:=arcWeightSum + arcWeight[i];
                end if;
              end for;
            else                        //probabilistic enabling according to enabling probabilities
              arcWeightSum:=0;
              remTAin:=zeros(nIn);
              nremTAin:=0;
              for i in 1:nIn loop
                if disTAin[i] then
                  nremTAin:=nremTAin+1;  //number of active input transitions
                  remTAin[nremTAin]:=i;  //active input transitions
                end if;
              end for;
              nTAin:=nremTAin;          //number of active input transitions
              sumEnablingProbTAin:=sum(enablingProb[remTAin[1:nremTAin]]);  //enabling probability sum of all active input transitions
              cumEnablingProb:=zeros(nIn);      //cumulative, scaled enabling probabilities
              cumEnablingProb[1]:=enablingProb[remTAin[1]]/sumEnablingProbTAin;
              for j in 2:nremTAin loop
                cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAin[j]]/sumEnablingProbTAin;
              end for;
              //muss hier stehen sonst immer fast gleiche Zufallszahl => immer gleiches enabling
              randNum := PNlib.Functions.Random.random()/32767;
              for i in 1:nTAin loop
                randNum := PNlib.Functions.Random.random()/32767;
                                                  //uniform distributed random number
                endWhile:=false;
                k:=1;
                while k<=nremTAin and not endWhile loop
                    if randNum <= cumEnablingProb[k] then
                       posTE:=remTAin[k];
                       endWhile:=true;
                    else
                      k:=k + 1;
                    end if;
                end while;
                if t+arcWeightSum + arcWeight[posTE] <= maxMarks or arcWeight[i]==0 then
                   arcWeightSum:=arcWeightSum + arcWeight[posTE];
                   TEin[posTE]:=true;
                end if;
                nremTAin:=nremTAin - 1;
                if nremTAin > 0 then
                  remTAin:=Functions.OddsAndEnds.deleteElementInt(remTAin,k);
                  cumEnablingProb:=zeros(nIn);
                  sumEnablingProbTAin:=sum(enablingProb[remTAin[1:nremTAin]]);
                  if sumEnablingProbTAin>0 then
                    cumEnablingProb[1]:=enablingProb[remTAin[1]]/sumEnablingProbTAin;
                    for j in 2:nremTAin loop
                        cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAin[j]]/sumEnablingProbTAin;
                    end for;
                  else
                      cumEnablingProb[1:nremTAin]:=fill(1/nremTAin, nremTAin);
                  end if;
                end if;
            end for;
           end if;
          end if;
       else
          TEin:=fill(false, nIn);
          disTAin:=fill(false, nIn);
          remTAin:=fill(0, nIn);
          cumEnablingProb:=fill(0.0, nIn);
          arcWeightSum:=0.0;
          nremTAin:=0;
          nTAin:=0;
          k:=0;
          posTE:=0;
          randNum:=0.0;
          sumEnablingProbTAin:=0.0;
          endWhile:=false;
        end if;
      end when;
      TEin_:=TEin and active;
    end enablingInCon;

    block enablingInDis "enabling process of discrete input transitions"
      parameter input Integer nIn "number of input transitions";
      input Integer arcWeight[:] "arc weights of input transitions";
      input Integer t "current token number";
      input Integer maxTokens "maximum capacity";
      input Boolean TAein[:]
        "active previous transitions which are already enabled by their input places";
      input Integer enablingType "resolution of actual conflicts";
      input Real enablingProb[:] "enabling probabilites of input transitions";
      input Boolean disTransition[:] "type of input transitions";
      input Boolean delayPassed "Does any delayPassed of a output transition";
      input Boolean active[:] "Are the input transitions active?";
      output Boolean TEin_[nIn] "enabled input transitions";
    protected
      Boolean TEin[nIn] "enabled input transitions";
      Integer remTAin[nIn] "remaining active input transitions";
      Real cumEnablingProb[nIn] "cumulated, scaled enabling probabilities";
      Integer arcWeightSum "arc weight sum";
      Integer nremTAin "number of remaining active input transitions";
      Integer nTAin "number ofactive input transitions";
      Integer k "iteration index";
      Integer posTE "possible enabled transition";
      Real randNum "uniform distributed random number";
      Real sumEnablingProbTAin
        "sum of the enabling probabilities of the active input transitions";
      Boolean endWhile;

    algorithm
      when delayPassed then
        if nIn>0 then
          TEin:=fill(false,nIn);
            arcWeightSum:=Functions.OddsAndEnds.conditionalSumInt(arcWeight,TAein);  //arc weight sum of all active input transitions which are already enabled by their input places
            if t + arcWeightSum <= maxTokens then  //Place has no actual conflict; all active input transitions are enabled
              TEin:=TAein;
            else                          //Place has an actual conflict
              if enablingType==1 then     //deterministic enabling according to priorities
                arcWeightSum:=0;
                for i in 1:nIn loop
                  if TAein[i] and disTransition[i] and t+(arcWeightSum+arcWeight[i])<=maxTokens then  ///new 07.03.2011
                    TEin[i]:=true;
                    arcWeightSum:=arcWeightSum + arcWeight[i];
                  end if;
                end for;
              else                        //probabilistic enabling according to enabling probabilities
                arcWeightSum:=0;
                remTAin:=zeros(nIn);
                nremTAin:=0;
                for i in 1:nIn loop
                  if TAein[i] and disTransition[i] then
                    nremTAin:=nremTAin+1;  //number of active input transitions
                    remTAin[nremTAin]:=i;  //active input transitions
                  end if;
                end for;
                nTAin:=nremTAin;          //number of active input transitions
                sumEnablingProbTAin:=sum(enablingProb[remTAin[1:nremTAin]]);  //enabling probability sum of all active input transitions
                cumEnablingProb:=zeros(nIn);      //cumulative, scaled enabling probabilities
                cumEnablingProb[1]:=enablingProb[remTAin[1]]/sumEnablingProbTAin;
                for j in 2:nremTAin loop
                  cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAin[j]]/sumEnablingProbTAin;
                end for;
                //muss hier stehen sonst immer fast gleiche Zufallszahl => immer gleiches enabling
                randNum := PNlib.Functions.Random.random()/32767;
                for i in 1:nTAin loop
                  randNum := PNlib.Functions.Random.random()/32767;
                                                    //uniform distributed random number
                  endWhile:=false;
                  k:=1;
                  while k<=nremTAin and not endWhile loop
                      if randNum <= cumEnablingProb[k] then
                         posTE:=remTAin[k];
                         endWhile:=true;
                      else
                        k:=k + 1;
                      end if;
                  end while;
                  if t+arcWeightSum + arcWeight[posTE] <= maxTokens then
                     arcWeightSum:=arcWeightSum + arcWeight[posTE];
                     TEin[posTE]:=true;
                  end if;
                  nremTAin:=nremTAin - 1;
                  if nremTAin > 0 then
                    remTAin:=Functions.OddsAndEnds.deleteElementInt(remTAin,k);
                    cumEnablingProb:=zeros(nIn);
                    sumEnablingProbTAin:=sum(enablingProb[remTAin[1:nremTAin]]);
                    if sumEnablingProbTAin>0 then
                      cumEnablingProb[1]:=enablingProb[remTAin[1]]/sumEnablingProbTAin;
                      for j in 2:nremTAin loop
                          cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAin[j]]/sumEnablingProbTAin;
                      end for;
                    else
                        cumEnablingProb[1:nremTAin]:=fill(1/nremTAin, nremTAin);
                    end if;
                  end if;
              end for;
             end if;
        end if;
        else
          TEin:=fill(false, nIn);
          remTAin:=fill(0, nIn);
          cumEnablingProb:=fill(0.0, nIn);
          arcWeightSum:=0;
          nremTAin:=0;
          nTAin:=0;
          k:=0;
          posTE:=0;
          randNum:=0;
          sumEnablingProbTAin:=0;
          endWhile:=false;
       end if;
      end when;
      TEin_:=TEin and active;
    end enablingInDis;

    block enablingOutCon
      "enabling process of output transitions (continuous places)"
      parameter input Integer nOut "number of output transitions";
      input Real arcWeight[:] "arc weights of output transitions";
      input Real t_ "current marks";
      input Real minMarks "minimum capacity";
      input Boolean TAout[:] "active output transitions with passed delay";
      input Integer enablingType "resolution of actual conflicts";
      input Real enablingProb[:] "enabling probabilites of output transitions";
      input Boolean disTransition[:] "discrete transition?";
      input Boolean delayPassed "Does any delayPassed of a output transition";
      output Boolean TEout_[nOut] "enabled output transitions";
    protected
      Real t=t_+Constants.eps
        "numeric to realize the correct simulation of some specific hybrid petri nets";
      Boolean TEout[nOut] "enabled output transitions";
      Boolean disTAout[nOut] "discret active output transitions";
      Integer remTAout[nOut] "remaining active output transitions";
      Real cumEnablingProb[nOut] "cumulated, scaled enabling probabilities";
      Real arcWeightSum "arc weight sum";
      Integer nremTAout "number of remaining active output transitions";
      Integer nTAout "number of active output transitions";
      Integer k "iteration index";
      Integer posTE "possible enabled transition";
      Real randNum "uniform distributed random number";
      Real sumEnablingProbTAout
        "sum of the enabling probabilities of the active output transitions";
      Boolean endWhile;
    algorithm
      when delayPassed then
        if nOut>0 then
        disTAout:=TAout and disTransition;
        arcWeightSum := Functions.OddsAndEnds.conditionalSum(arcWeight, disTAout);
                                                                       //arc weight sum of all active output transitions
        if t - arcWeightSum >= minMarks or arcWeightSum==0 then  //Place has no actual conflict; all active output transitions are enabled
          TEout:=TAout;
        else                          //Place has an actual conflict;
          TEout:=TAout and not disTransition;
          if enablingType==1 then     //deterministic enabling according to priorities
            arcWeightSum:=0;
            for i in 1: nOut loop
              if disTAout[i] and ((t-(arcWeightSum+arcWeight[i])>=minMarks) or arcWeight[i]==0) then
                TEout[i]:=true;
                arcWeightSum:=arcWeightSum + arcWeight[i];
              end if;
            end for;
          else                        //probabilistic enabling according to enabling probabilities
            arcWeightSum:=0;
            remTAout:=zeros(nOut);
            nremTAout:=0;
            for i in 1:nOut loop
              if disTAout[i] then
                nremTAout:=nremTAout+1;  //number of active output transitions
                remTAout[nremTAout]:=i;  //active output transitions
              end if;
            end for;
            nTAout:=nremTAout;          //number of active output transitions
            sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);  //enabling probability sum of all active output transitions
            cumEnablingProb:=zeros(nOut);      //cumulative, scaled enabling probabilities
            cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
            for j in 2:nremTAout loop
              cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
            end for;
            //muss hier stehen sonst immer fast gleiche Zufallszahl => immer gleiches enabling
            randNum := PNlib.Functions.Random.random()/32767;
            for i in 1:nTAout loop
              randNum := PNlib.Functions.Random.random()/32767;
                                                //uniform distributed random number
              endWhile:=false;
              k:=1;
              while k<=nremTAout and not endWhile loop
                  if randNum <= cumEnablingProb[k] then
                     posTE:=remTAout[k];
                     endWhile:=true;
                  else
                    k:=k + 1;
                  end if;
              end while;
              if (t-(arcWeightSum + arcWeight[posTE]) >= minMarks) or  arcWeight[i]==0 then
                 arcWeightSum:=arcWeightSum + arcWeight[posTE];
                 TEout[posTE]:=true;
              end if;
              nremTAout:=nremTAout - 1;
              if nremTAout > 0 then
                remTAout:=Functions.OddsAndEnds.deleteElementInt(remTAout,k);
                cumEnablingProb:=zeros(nOut);
                sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);
                if sumEnablingProbTAout>0 then
                  cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
                  for j in 2:nremTAout loop
                    cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
                  end for;
                else
                    cumEnablingProb[1:nremTAout]:=fill(1/nremTAout, nremTAout);
                end if;
              end if;
            end for;
           end if;
          end if;
        else
          TEout:=fill(false, nOut);
          disTAout:=fill(false, nOut);
          remTAout:=fill(0, nOut);
          cumEnablingProb:=fill(0.0, nOut);
          arcWeightSum:=0.0;
          nremTAout:=0;
          nTAout:=0;
          k:=0;
          posTE:=0;
          randNum:=0.0;
          sumEnablingProbTAout:=0.0;
          endWhile:=false;
        end if;
      end when;
      TEout_:=TEout and TAout;
    end enablingOutCon;

    block enablingOutDis "enabling process of output transitions"
      parameter input Integer nOut "number of output transitions";
      input Integer arcWeight[:] "arc weights of output transitions";
      input Integer t "current token number";
      input Integer minTokens "minimum capacity";
      input Boolean TAout[:] "active output transitions with passed delay";
      input Integer enablingType "resolution of actual conflicts";
      input Real enablingProb[:] "enabling probabilites of output transitions";
      input Boolean disTransition[:] "discrete output transition";
      input Boolean delayPassed "Does any delayPassed of a output transition";
      input Boolean activeCon "change of activation of output transitions";
      output Boolean TEout_[nOut] "enabled output transitions";
    protected
      Boolean TEout[nOut] "enabled output transitions";
      Integer remTAout[nOut] "remaining active output transitions";
      Real cumEnablingProb[nOut] "cumulated, scaled enabling probabilities";
      Integer arcWeightSum "arc weight sum";
      Integer nremTAout "number of remaining active output transitions";
      Integer nTAout "number of active output transitions";
      Integer k "iteration index";
      Integer posTE "possible enabled transition";
      Real randNum "uniform distributed random number";
      Real sumEnablingProbTAout
        "sum of the enabling probabilities of the active output transitions";
      Boolean endWhile;
    algorithm
      when delayPassed or activeCon then
          if nOut>0 then
            TEout:=fill(false,nOut);
              arcWeightSum:=Functions.OddsAndEnds.conditionalSumInt(arcWeight,TAout);  //arc weight sum of all active output transitions
              if (t - arcWeightSum >= minTokens) then  //Place has no actual conflict; all active output transitions are enabled
                TEout:=TAout;
              else                          //Place has an actual conflict;
                if enablingType==1 then     //deterministic enabling according to priorities
                  arcWeightSum:=0;
                  for i in 1: nOut loop  //discrete transitions are proven at first
                    if TAout[i] and disTransition[i] and t-(arcWeightSum+arcWeight[i])>=minTokens then
                      TEout[i]:=true;
                      arcWeightSum:=arcWeightSum + arcWeight[i];
                    end if;
                  end for;
                  for i in 1: nOut loop  //continuous transitions afterwards (discrete transitions have priority over continuous transitions)
                    if TAout[i] and not disTransition[i] and ((t-(arcWeightSum+arcWeight[i])>=minTokens)) then
                      TEout[i]:=true;
                      arcWeightSum:=arcWeightSum + arcWeight[i];
                    end if;
                  end for;
                else                        //probabilistic enabling according to enabling probabilities
                  arcWeightSum:=0;
                  remTAout:=zeros(nOut);
                  nremTAout:=0;
                  for i in 1:nOut loop
                    if TAout[i] and disTransition[i] then
                      nremTAout:=nremTAout+1;  //number of active output transitions
                      remTAout[nremTAout]:=i;  //active output transitions
                    end if;
                  end for;
                  nTAout:=nremTAout;          //number of active output transitions
                  if nTAout>0 then
                    sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);  //enabling probability sum of all active output transitions
                    cumEnablingProb:=zeros(nOut);      //cumulative, scaled enabling probabilities
                    cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
                    for j in 2:nremTAout loop
                      cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
                    end for;
                    randNum := PNlib.Functions.Random.random()/32767; //muss hier stehen sonst immer fast gleiche Zufallszahl => immer gleiches enabling
                    for i in 1:nTAout loop
                      randNum := PNlib.Functions.Random.random()/32767;  //uniform distributed random number
                      endWhile:=false;
                      k:=1;
                      while k<=nremTAout and not endWhile loop
                          if randNum <= cumEnablingProb[k] then
                             posTE:=remTAout[k];
                             endWhile:=true;
                          else
                            k:=k + 1;
                          end if;
                      end while;
                      if t-(arcWeightSum + arcWeight[posTE]) >= minTokens then
                         arcWeightSum:=arcWeightSum + arcWeight[posTE];
                         TEout[posTE]:=true;
                      end if;
                      nremTAout:=nremTAout - 1;
                      if nremTAout > 0 then
                        remTAout:=Functions.OddsAndEnds.deleteElementInt(remTAout,k);
                        cumEnablingProb:=zeros(nOut);
                        sumEnablingProbTAout:=sum(enablingProb[remTAout[1:nremTAout]]);
                        if sumEnablingProbTAout>0 then
                          cumEnablingProb[1]:=enablingProb[remTAout[1]]/sumEnablingProbTAout;
                          for j in 2:nremTAout loop
                            cumEnablingProb[j]:=cumEnablingProb[j-1]+enablingProb[remTAout[j]]/sumEnablingProbTAout;
                          end for;
                        else
                            cumEnablingProb[1:nremTAout]:=fill(1/nremTAout, nremTAout);
                        end if;
                      end if;
                   end for;
                 end if;
                 for i in 1: nOut loop
                   if TAout[i] and not disTransition[i] and t-(arcWeightSum+arcWeight[i])>=minTokens then
                     TEout[i]:=true;
                     arcWeightSum:=arcWeightSum + arcWeight[i];
                   end if;
                 end for;
                end if;
          end if;
          else
            TEout:=fill(false, nOut);
            remTAout:=fill(0, nOut);
            cumEnablingProb:=fill(0.0, nOut);
            arcWeightSum:=0;
            nremTAout:=0;
            nTAout:=0;
            k:=0;
            posTE:=0;
            randNum:=0;
            sumEnablingProbTAout:=0.0;
            endWhile:=false;
          end if;
      end when;
      TEout_:=TEout and TAout;
    end enablingOutDis;

    block firingSumCon "calculates the firing sum of continuous places"
      input Boolean fire[:] "firability of transitions";
      input Real arcWeight[:] "arc weights";
      input Real instSpeed[:] "istantaneous speed of transitions";
      input Boolean disTransition[:] "types of transitions";
      output Real conFiringSum "continuous firing sum";
      output Real disFiringSum "discrete firing sum";
    protected
      Real vec1[size(fire,1)];
      Real vec2[size(fire,1)];
    //algorithm //changed 21.03.11 due to negative values
    equation
      for i in 1:size(fire,1) loop
         if fire[i] and not disTransition[i] then
            vec1[i]= arcWeight[i]*instSpeed[i];
         else
           vec1[i]= 0;
         end if;
         if fire[i] and disTransition[i] then
           vec2[i]= arcWeight[i];
         else
           vec2[i]= 0;
        end if;
      end for;
      conFiringSum= sum(vec1);
      disFiringSum= sum(vec2);
    end firingSumCon;

    block firingSumDis "calculates the firing sum of discrete places"
      input Boolean fire[:] "firability of transitions";
      input Integer arcWeight[:] "arc weights";
      output Integer firingSum "firing sum";
    algorithm
      firingSum:=0;
      for i in 1:size(fire,1) loop
        if fire[i] then
           firingSum:=firingSum + arcWeight[i];
        end if;
      end for;
    end firingSumDis;

    block preliminarySpeed
      "calculates the preliminary speed of a continuous transition"
      input Integer nIn "number of input places";
      input Integer nOut "number of output places";
      input Real arcWeightIn[:] "input arc weights";
      input Real arcWeightOut[:] "output arc weights";
      input Real speedSumIn[:] "input speed";
      input Real speedSumOut[:] "output speed";
      input Real maximumSpeed "maximum speed";
      input Boolean active "activation";
      input Boolean weaklyInputActiveVec[:]
        "places that causes weakly input activation";
      input Boolean weaklyOutputActiveVec[:]
        "places that causes weakly output activation";
      output Real prelimSpeed "preliminary speed";
    algorithm
      prelimSpeed:=maximumSpeed;
      for i in 1:nIn loop
        if weaklyInputActiveVec[i] and (1/arcWeightIn[i])*speedSumIn[i]<prelimSpeed then
           prelimSpeed:=(1/arcWeightIn[i])*speedSumIn[i];
        end if;
       end for;
       for i in 1:nOut loop
         if weaklyOutputActiveVec[i] and (1/arcWeightOut[i])*speedSumOut[i]<prelimSpeed then
            prelimSpeed:=(1/arcWeightOut[i])*speedSumOut[i];
         end if;
       end for;
    end preliminarySpeed;

    block testArcEvent
      "Generates an event when a test value of a test or inhibitor arc is exceeded or deceeded by the place"
      parameter input Integer nIn "number of input places";
      input Real tIn[:] "marking of input places";
      input Real testValue[:] "test values of test or inhibitor arcs";
      output Boolean testChange[nIn]
        "true when test value is exceeded or deceeded";
    protected
      Boolean above[nIn];
      Boolean preabove[nIn];
      Boolean pretestChange[nIn];
      Boolean ttest[nIn];
      Boolean prettest[nIn];
      Real ttest2[nIn];
    equation
      preabove=pre(above);
      pretestChange=pre(testChange);
      prettest=pre(ttest);
    algorithm
      for i in 1:nIn loop
        above[i]:=tIn[i] > testValue[i];
         when above[i]<>preabove[i] and not initial() then
           testChange[i]:=true;
           ttest[i]:=preabove[i];
           ttest2[i]:=tIn[i];
         elsewhen pretestChange[i] and ((not ttest[i] and tIn[i]>ttest2[i]) or (ttest[i] and tIn[i]<ttest2[i])) then
           testChange[i]:=false;
         end when;
      end for;
    end testArcEvent;

  end Blocks;

  package Functions
    "contains functions with specific algorithmic procedures which are used in the Petri net component models"
    package Random "random functions"
      function random
        "external C-function to generate uniform distributed random numbers"
        output Integer x;
        external "C" annotation(Include = "#include <random.c>",__Dymola_pure=false);
      end random;

      function randomexp
        "generates a exponential distributed random number according to lambda"
        input Real lambda;
        output Real delay;
      protected
        Real zg;
        Real h_lambda;
      algorithm
        zg:=0;
        h_lambda:=lambda;
        while zg/32767<10^(-10) loop
          zg := random();
        end while;
        if lambda<=0 then
          h_lambda:=10^(-10);
        end if;
        delay := -ln(zg/32767)*1/h_lambda;
      end randomexp;

    end Random;

    package OddsAndEnds "help functions"
      function allTrue "Are all entries of a boolean vector true?"
        input Boolean vec[:];
        output Boolean alltrue;
      algorithm
        alltrue:=true;
        for i in 1:size(vec, 1) loop
            alltrue:=alltrue and vec[i];
        end for;
      end allTrue;

      function anyTrue "Is any entry of a boolean vector true"
        input Boolean vec[:];
        output Boolean anytrue;
      algorithm
        anytrue:=false;
        for i in 1:size(vec, 1) loop
            anytrue:=anytrue or vec[i];
        end for;
      end anyTrue;

      function boolToInt "converts a boolean to an integer"
        input Boolean bool;
        output Integer int;
      algorithm
        if bool then
          int:=1;
        else
          int:=0;
        end if;
      end boolToInt;

      function compare "compare two simulation results (test suite)"
        input Real time_org[:];
        input Real time_test[:];
        input Real var_org[:];
        input Real var_test[:];
        input Real interval;
        input Real stopTime;
        output Real err;
      protected
        Integer j;
        Integer k;
      algorithm
        j:=1;
        k:=1;
        err:=0;
        for i in 0:interval:stopTime loop
            while time_org[j]<=i loop
              if j<size(time_org,1) then
                j:=j + 1;
              else
                break;
              end if;
            end while;
             while time_test[k]<=i loop
              if k<size(time_test,1) then
                k:=k + 1;
              else
                break;
              end if;
            end while;
          err:=err + (var_org[j-1] - var_test[k-1])^2;
        end for;
      end compare;

      function compareReal "compare two real vectors"
        input Real vec1[:];
        input Real vec2[:];
        output Boolean vec3[size(vec1,1)];
      algorithm
        for i in 1:size(vec1,1) loop
          vec3[i]:=vec1[i] > vec2[i];
        end for;
      end compareReal;

      function conditionalSum
        "calculates the conditional sum of real vector entries"
        input Real vec[:];
        input Boolean con[:];
        output Real conSum;
      algorithm
        conSum:=0;
        for i in 1:size(vec,1) loop
          if con[i] then
             conSum:=conSum + vec[i];
          end if;
        end for;
      end conditionalSum;

      function conditionalSumInt
        "calculates the conditional sum of integer vector entries"
        input Integer vec[:];
        input Boolean con[:];
        output Integer conSum;
      algorithm
        conSum:=0;
        for i in 1:size(vec,1) loop
          if con[i] then
             conSum:=conSum + vec[i];
          end if;
        end for;
      end conditionalSumInt;

      function countTrue "counts the true entries of a Boolean vectors"
        input Boolean vec[:];
        output Integer count;
        output Integer idx[size(vec,1)];
      algorithm
        count:=0;
        idx:=zeros(size(vec, 1));
        for i in 1:size(vec,1) loop
          if vec[i] then
            count:=count + 1;
            idx[count]:=i;
          end if;
        end for;
      end countTrue;

      function deleteElement "deletes an element of an real vector"
        input Real vecin[:];
        input Integer idx;
        output Real vecout[size(vecin,1)];
      protected
        parameter Integer nVec= size(vecin,1);
      algorithm
        vecout[1:idx-1]:=vecin[1:idx-1];
        vecout[idx:nVec-1]:=vecin[idx+1:nVec];
        vecout[nVec]:=0;
      end deleteElement;

      function deleteElementInt "deletes an element of an integer vector"
        input Integer vecin[:];
        input Integer idx;
        output Integer vecout[size(vecin,1)];
      protected
        parameter Integer nVec= size(vecin,1);
      algorithm
        vecout[1:idx-1]:=vecin[1:idx-1];
        vecout[idx:nVec-1]:=vecin[idx+1:nVec];
        vecout[nVec]:=0;
      end deleteElementInt;

      function findFirstZero
        "finds the first zero entry of an integer vector and returns its index; returns 0 if the vector has no zero entry"
        input Integer vec[:];
        output Integer idx;
      protected
        parameter Integer nSize=size(vec,1);
        Boolean endAlg;
        Integer k;
      algorithm
        endAlg:=false;
        k:=1;
        idx:=0;
        while not endAlg and k<=nSize loop
          if vec[k]==0 then
            idx:=k;
            endAlg:=true;
          else
            k:=k + 1;
          end if;
        end while;
      end findFirstZero;

    function isEqual "Determine if two Real scalars are numerically identical"
      extends Modelica.Icons.Function;
      input Real s1 "First scalar";
      input Real s2 "Second scalar";
      input Real eps(min=0) = 0
          "The two scalars are identical if abs(s1-s2) <= eps";
      output Boolean result "= true, if scalars are identical";
    algorithm
      result :=abs(s1 - s2) <= eps;
      annotation (Inline=true, Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
Math.<b>isEqual</b>(s1, s2);
Math.<b>isEqual</b>(s1, s2, eps=0);
</pre></blockquote>
<h4>Description</h4>
<p>
The function call \"<code>Math.isEqual(s1, s2)</code>\" returns <b>true</b>,
if the two Real scalars s1 and s2 are identical. Otherwise the function
returns <b>false</b>. The equality check is performed by
\"abs(s1-s2) &le; eps\", where \"eps\"
can be provided as third argument of the function. Default is \"eps = 0\".
</p>
<h4>Example</h4>
<blockquote><pre>
  Real s1 = 2.0;
  Real s2 = 2.0;
  Real s3 = 2.000001;
  Boolean result;
<b>algorithm</b>
  result := Math.isEqual(s1,s2);     // = <b>true</b>
  result := Math.isEqual(s1,s3);     // = <b>false</b>
  result := Math.isEqual(s1,s3,0.1); // = <b>true</b>
</pre></blockquote>
<h4>See also</h4>
<p>
<a href=\"modelica://Modelica.Math.Vectors.isEqual\">Vectors.isEqual</a>,
<a href=\"modelica://Modelica.Math.Matrices.isEqual\">Matrices.isEqual</a>,
<a href=\"modelica://Modelica.Utilities.Strings.isEqual\">Strings.isEqual</a>
</p>
</HTML>"));
    end isEqual;

      function printResult "print the test result (test suite)"
        input Boolean ok;
        input String name;
      algorithm
        if ok then
          Modelica.Utilities.Streams.print(name+": ok");
        else
          Modelica.Utilities.Streams.print(name+": not ok!!!");
        end if;
      end printResult;

      function sort "Sort elements of vector in ascending or descending order"
        extends Modelica.Icons.Function;
        input Real v[:] "Vector to be sorted";
        input Boolean ascending = true
          "= true if ascending order, otherwise descending order";
        output Real sorted_v[size(v,1)] = v "Sorted vector";
        output Integer indices[size(v,1)] = 1:size(v,1) "sorted_v = v[indices]";

        /* shellsort algorithm; should be improved later */
      protected
        Integer gap;
        Integer i;
        Integer j;
        Real wv;
        Integer wi;
        Integer nv = size(v,1);
        Boolean swap;
      algorithm
        gap := div(nv,2);

        while gap > 0 loop
           i := gap;
           while i < nv loop
              j := i-gap;
              if j>=0 then
                 if ascending then
                    swap := sorted_v[j+1] > sorted_v[j + gap + 1];
                 else
                    swap := sorted_v[j+1] < sorted_v[j + gap + 1];
                 end if;
              else
                 swap := false;
              end if;

              while swap loop
                 wv := sorted_v[j+1];
                 wi := indices[j+1];
                 sorted_v[j+1] := sorted_v[j+gap+1];
                 sorted_v[j+gap+1] := wv;
                 indices[j+1] := indices[j+gap+1];
                 indices[j+gap+1] := wi;
                 j := j - gap;
                 if j >= 0 then
                    if ascending then
                       swap := sorted_v[j+1] > sorted_v[j + gap + 1];
                    else
                       swap := sorted_v[j+1] < sorted_v[j + gap + 1];
                    end if;
                 else
                    swap := false;
                 end if;
              end while;
              i := i + 1;
           end while;
           gap := div(gap,2);
        end while;
        annotation (Documentation(info="<HTML>
<h4>Syntax</h4>
<blockquote><pre>
           sorted_v = Vectors.<b>sort</b>(v);
(sorted_v, indices) = Vectors.<b>sort</b>(v, ascending=true);
</pre></blockquote>
<h4>Description</h4>
<p>
Function <b>sort</b>(..) sorts a Real vector v
in ascending order and returns the result in sorted_v.
If the optional argument \"ascending\" is <b>false</b>, the vector
is sorted in descending order. In the optional second
output argument the indices of the sorted vector with respect
to the original vector are given, such that sorted_v = v[indices].
</p>
<h4>Example</h4>
<blockquote><pre>
  (v2, i2) := Vectors.sort({-1, 8, 3, 6, 2});
       -> v2 = {-1, 2, 3, 6, 8}
          i2 = {1, 5, 3, 4, 2}
</pre></blockquote>
</HTML>"));
      end sort;

      function testOK
        "calculates if the test is ok if a Petri net has stochastic effects (test suite)"
        input Real err[:];
        input String name;
        input Real tol=0.5;
        output Boolean ok;
      protected
        Integer i;
      algorithm
        ok:=false;
        i:=1;
        while not ok and i<=size(err,1) loop
          if err[i]<tol then
            ok:=true;
          end if;
          i:=i + 1;
        end while;
        printResult(ok,name);
      end testOK;
    end OddsAndEnds;

  end Functions;

  package Constants "
contains constants which are used in the Petri net component models"
    constant Real inf = 1e+60
      "Biggest Real number such that inf and -inf are representable on the machine";
    constant Integer Integer_inf = 1073741823
      "Biggest Integer number such that Integer_inf and -Integer_inf are representable on the machine";
    constant Real pi=2*arcsin(1.0); // 3.14159265358979;
    constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";
    constant Real small=1.e-60
      "Smallest number such that small and -small are representable on the machine";
  end Constants;

  package Models "
contains several examples and offers the possibility to structure further Petri net models"

    model FlushToilet "Model of a flunsh toilet"

      PD Lever(nIn=1,
        maxTokens=1,
        nOut=1) "Lever of the toilet"   annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,46})));
      TD pushing(
        nOut=1,
        arcWeightIn={1},
        nIn=1,
        delay=3) "visitor pushes the lever" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,68})));
      TD lifting(
        nOut=1,
        nIn=1,
        delay=0.02) "Lift the flush valve flapper"
                   annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,22})));
      PD FlushValveFlapper(
        nIn=1,
        nOut=3,
        maxTokens=1)                         annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,-8})));
      TC flowing(
        nOut=1,
        nIn=3,
        arcWeightIn={0,1,2.5},
        maximumSpeed=5) "Water flows in the bowl"
                        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,-72})));
      PC WaterInBowl(nIn=1, nOut=1) "Water in the toilet bowl"
                                  annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,-96})));
      TA TA1(testValue=0)
             annotation (Placement(transformation(
            extent={{-7.99999,-3.00001},{7.99999,3.00003}},
            rotation=-90,
            origin={-71,-42})));
      PC WaterInTank(
        nOut=1,
        nIn=1,
        maxMarks=12,
        startMarks=12) "Water in the toilet tank"
                                         annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-14,-14})));
      PC LevelOfFloat(
        nOut=3,
        nIn=1,
        maxMarks=30,
        startMarks=30) "Level of the float" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={16,-14})));
      TD opening(
        nOut=1,
        nIn=1,
        arcWeightIn={6},
        delay=0.1) "Open the tank fill valve"
        annotation (Placement(transformation(extent={{62,-40},{82,-20}})));
      PD TankFillValve(
        nIn=1,
        nOut=2,
        maxTokens=1)
        annotation (Placement(transformation(extent={{88,-40},{108,-20}})));
      TC filling(
        nIn=1,
        nOut=2,
        arcWeightOut={2.5,1},
        arcWeightIn={0},
        maximumSpeed=6) "Water flows to the toilet tank"
        annotation (Placement(transformation(extent={{64,30},{44,10}})));
      TA TA3(testValue=0)
        annotation (Placement(transformation(extent={{98,16},{80,22}})));
      IA IA1(testValue=6)
        annotation (Placement(transformation(extent={{32,-34},{48,-28}})));
      TA TA2(testValue=29.9)
        annotation (Placement(transformation(extent={{32,-60},{48,-54}})));
      TD closing(
        nIn=2,
        arcWeightIn={1,29.999},
        delay=0.1) "Close the tank fill valve"
                            annotation (Placement(transformation(
            extent={{10,-10},{-10,10}},
            rotation=90,
            origin={76,-74})));
      TD sinking(nIn=1, delay=2) "Sink the flush valve flapper"
                                           annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={-98,22})));
      TC Sewer(nIn=1, maximumSpeed=4) "Sewer"
                                             annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,-118})));
      inner Settings settings1(scale=5, timeFire=0.1,
        animateMarking=1,
        animatePlace=1,
        animateTransition=1,
        animatePutFireTime=1,
        animateHazardFunc=1,
        animateSpeed=1,
        animateWeightTIarc=1,
        animateTIarc=1)
        annotation (Placement(transformation(extent={{42,66},{74,98}})));
      PD Visitor(
        nOut=1,
        nIn=1,
        startTokens=1,
        maxTokens=1) "Visitor of the toilet"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=-90,
            origin={-62,88})));
      TS entering(
        nOut=1,
        nIn=1,
        h=1/10) "Visitor enters the toilet" annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-62,108})));
      IA IA2 annotation (Placement(transformation(
            extent={{-10.5,-3.5},{10.5,3.5}},
            rotation=90,
            origin={-37.5,70.5})));
    equation
      connect(pushing.outPlaces[1], Lever.inTransition[1])  annotation (Line(
          points={{-62,63.2},{-62,56.8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(lifting.outPlaces[1], FlushValveFlapper.inTransition[1])
                                                                annotation (Line(
          points={{-62,17.2},{-62,2.8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(flowing.outPlaces[1], WaterInBowl.inTransition[1])
                                                                annotation (Line(
          points={{-62,-76.8},{-62,-85.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(FlushValveFlapper.outTransition[1], TA1.inPlace)
                                                        annotation (Line(
          points={{-62.6667,-18.8},{-62.6667,-31.8312},{-63.0101,-31.8312}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(TA1.outTransition, flowing.inPlaces[1])  annotation (Line(
          points={{-63.0101,-50.3709},{-63.0101,-48.6876},{-62.6667,-48.6876},{
              -62.6667,-67.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(WaterInTank.outTransition[1], flowing.inPlaces[2])
                                                             annotation (Line(
          points={{-14,-24.8},{-14,-56},{-62,-56},{-62,-67.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(LevelOfFloat.outTransition[1], flowing.inPlaces[3])
                                                                annotation (Line(
          points={{15.3333,-24.8},{15.3333,-60},{-62,-60},{-62,-67.2},{-61.3333,
              -67.2}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(opening.outPlaces[1], TankFillValve.inTransition[1])
                                                            annotation (Line(
          points={{76.8,-30},{87.2,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(TankFillValve.outTransition[1], TA3.inPlace)
                                                    annotation (Line(
          points={{108.8,-30.5},{114,-30.5},{114,19},{99.4286,19}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(TA3.outTransition,filling. inPlaces[1]) annotation (Line(
          points={{78.5714,19},{60,19},{60,20},{58.8,20}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(filling.outPlaces[1], LevelOfFloat.inTransition[1])
                                                               annotation (Line(
          points={{49.2,20.5},{16,20.5},{16,-3.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(IA1.outTransition,opening. inPlaces[1]) annotation (Line(
          points={{49.2698,-31},{67.2,-31},{67.2,-30}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(LevelOfFloat.outTransition[2], IA1.inPlace)
                                                       annotation (Line(
          points={{16,-24.8},{16,-31},{30.7302,-31}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(filling.outPlaces[2],WaterInTank. inTransition[1])
                                                            annotation (Line(
          points={{49.2,19.5},{-14,19.5},{-14,-3.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(LevelOfFloat.outTransition[3], TA2.inPlace)
                                                       annotation (Line(
          points={{16.6667,-24.8},{16,-24.8},{16,-57},{30.7302,-57}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(TankFillValve.outTransition[2], closing.inPlaces[1])
                                                               annotation (Line(
          points={{108.8,-29.5},{114,-29.5},{114,-58},{76.5,-58},{76.5,-69.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(TA2.outTransition, closing.inPlaces[2])    annotation (Line(
          points={{49.2698,-57},{76,-57},{76,-69.2},{75.5,-69.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(WaterInBowl.outTransition[1], Sewer.inPlaces[1])      annotation (
          Line(
          points={{-62,-106.8},{-62,-113.2}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(Lever.outTransition[1], lifting.inPlaces[1]) annotation (Line(
          points={{-62,35.2},{-62,26.8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(FlushValveFlapper.outTransition[2], sinking.inPlaces[1])
                                                                  annotation (Line(
          points={{-62,-18.8},{-62,-24},{-98,-24},{-98,17.2}},
          color={0,0,0},
          smooth=Smooth.None));

      connect(Visitor.outTransition[1], pushing.inPlaces[1])   annotation (Line(
          points={{-62,77.2},{-62,72.8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(entering.outPlaces[1], Visitor.inTransition[1]) annotation (Line(
          points={{-62,103.2},{-62,98.8}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(FlushValveFlapper.outTransition[3], IA2.inPlace) annotation (Line(
          points={{-61.3333,-18.8},{-62,-20},{-62,-24},{-36,-24},{-36,48},{
              -35.803,48},{-35.803,48.3636}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(IA2.outTransition, entering.inPlaces[1]) annotation (Line(
          points={{-35.803,72.697},{-36,96},{-36,120},{-62,120},{-62,112.8}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (                                                       Diagram(
            coordinateSystem(preserveAspectRatio=true, extent={{-125,-125},{125,125}}),
            graphics),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-125,-125},{125,125}})),
        experiment(StopTime=100),
        __Dymola_experimentSetupOutput,
                    Documentation(info="<html>
  <p>
 This is a hybrid model of a flush toilet represented by the xHPN formalism.
 A visitor enters the toilet; thereby, the time between two visitors is not exactly known so that it is modelled by a stochastic transition with an exponential distributed delay (TS, T1).
 The visitor (PD, P1) pushes (TD, T2) the lever (PD, P2) which lifts the flush valve flapper (PD, P3). Then the water can flow (TC, T5) from the tank (PC, P4)
 to the bowl (PC, P5) and afterwards to the sewer (TC, T6). When the water flows to the bowl, the float (PC, P6) sinks in the toilet tank.
 If the float falls below a specific level (IA), the tank fill-valve (PD, P7) is opened (TD, T7) and new water can flow (TC, T9) into the tank.
 This causes also that the float rises and when a specific level is reached (TA), the tank fill-valve is closed (TD, T8).
 If the lever has returned to its starting position, the flush valve flapper sinks back to the bottom (TD, T4) and no water can flow into the bowl anymore.
 </p>
 </html>"));
    end FlushToilet;

    package Senseo "Model of a Senseo coffee machine"

      model Senseo_Model "Top Model"

        PNlib.Models.Senseo.Senseo_Maschine
                        senseo_Maschine
          annotation (Placement(transformation(extent={{-32,-56},{68,40}})));
        Water_Tank water_tank
          annotation (Placement(transformation(extent={{60,-64},{108,-16}})));
        PNlib.Models.Senseo.coffee_cup coffe_cup(color={80,0,0}, hmax=0.25)
          annotation (Placement(transformation(extent={{64,-10},{100,26}})));
        Counter amount_cups
          annotation (Placement(transformation(extent={{10,46},{46,82}})));
        Start start(EV_time=1200)
          annotation (Placement(transformation(extent={{-102,-48},{-30,32}})));
        Refill_Water refill_Water
          annotation (Placement(transformation(extent={{2,-98},{38,-72}})));
        Insert_Pad insert_Pad
          annotation (Placement(transformation(extent={{-24,44},{-4,64}})));
        Counter_real counter_real(text="Temperature", hmax=90)
          annotation (Placement(transformation(extent={{66,42},{104,80}})));
      equation
        connect(senseo_Maschine.amount_cups_, amount_cups.levelSensor)
          annotation (Line(
            points={{27.5238,37.6},{27.5238,38},{28,38},{28,51.4}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(refill_Water.refill_[2], water_tank.inTransition1) annotation (
            Line(
            points={{20,-72.65},{20,-68},{84,-68},{84,-52}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(water_tank.refill_, refill_Water.watertank_) annotation (Line(
            points={{105.6,-37.6},{108.8,-37.6},{108.8,-90.2},{39.8,-90.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(water_tank.outTransition1, senseo_Maschine.watertank_)
          annotation (Line(
            points={{67.2,-37.84},{44,-37.84},{44,-38},{42,-38},{42,-37.76},{
                41.8095,-37.76}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(refill_Water.refill_[1], start.refillstart_) annotation (Line(
            points={{20,-73.95},{20,-68},{-84,-68},{-84,-40.8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(start.refill_, refill_Water.start_) annotation (Line(
            points={{-89.04,-40.8},{-88.7,-40.8},{-88.7,-90.2},{0.2,-90.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(senseo_Maschine.stopornext_, start.stopornext_) annotation (
            Line(
            points={{-6.7619,-36.8},{-42.24,-36.8}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(start.start_[1], senseo_Maschine.startheating_) annotation (
            Line(
            points={{-44.4,11.6},{-46,12},{-46,14.56},{-7.2381,14.56}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(start.start_[2], insert_Pad.insert_) annotation (Line(
            points={{-44.4,15.6},{-44.4,14},{-34,14},{-34,50},{-25,50}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(insert_Pad.insertpad_, senseo_Maschine.padinsert_) annotation (
            Line(
            points={{-3,50},{10,50},{10,37.6},{10.381,37.6}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(senseo_Maschine.coffee_cup_, coffe_cup.levelSensor) annotation (
           Line(
            points={{41.8095,4},{69.22,4},{69.22,4.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(senseo_Maschine.tw_, counter_real.levelSensor) annotation (Line(
            points={{41.8095,28.48},{85,28.48},{85,47.7}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{120,80}}),
                            graphics), Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{120,80}})),
          experiment(StopTime=18000));
      end Senseo_Model;

      model coffee_cup "Animation of coffee cup"

        Modelica.Blocks.Interfaces.RealInput levelSensor
          annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
                  rotation=0), iconTransformation(
              extent={{10,-10},{-10,10}},
              rotation=180,
              origin={-71,-20})));
        Real level "Tank level in % of max height";
        parameter Real hmax=0.7 "Max volume of tank in l";
        parameter Real color[3]={0,0,255};
      equation
        level=levelSensor/hmax;
        annotation (
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-115,-80},{88,-48}},
                  lineColor=color,
                textString="Coffee Cup"),
                Rectangle(
                  extent={{-60,60},{80,-40}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent=DynamicSelect({{-60,-40},{-60,-40}}, {{-60,-40},{80,(-40
                       + level*100)}}),
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor=color),
              Line(
                points={{80,40},{100,40},{100,0},{80,0}},
                color={0,0,0},
                smooth=Smooth.None,
                thickness=1)}));
      end coffee_cup;

      model Counter "Integer Counter"

        Modelica.Blocks.Interfaces.IntegerInput levelSensor
          annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
                  rotation=0), iconTransformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={0,-70})));
        Real count;
        parameter Integer hmax=20;
      equation
        count=if levelSensor/hmax<1 then levelSensor/hmax else 1;
        annotation (
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-17,46},{-17,66}},
                  lineColor={0,0,0},
                textString="Cups Total"),
                Rectangle(
                  extent={{-50.5,51},{50.5,-51}},
                  lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor=DynamicSelect({255,255,255},{255,255-255*count,255-255*count}),
                origin={0,-9.5},
                rotation=90),
                Text(
                  extent={{-1,-34},{-1,17}},
                  textString=DynamicSelect(" ",realString(levelSensor,1,0)),
                  lineColor={0,0,0})}));
      end Counter;

      model Counter_real "Real Counter"
       parameter String text="counter";
       parameter Real color[3]={255,0,0};
        Modelica.Blocks.Interfaces.RealInput    levelSensor
          annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
                  rotation=0), iconTransformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={0,-70})));
        Real count;
        parameter Integer hmax=1000000;
        Real levelSensor_=if levelSensor>0 then levelSensor else 0;
      equation
        count=levelSensor_/hmax;
        annotation (
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-4,46},{-4,66}},
                  lineColor={0,0,0},
                textString="%text"),
                Rectangle(
                  extent={{-50.5,51},{50.5,-51}},
                  lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255},
                origin={0,-9.5},
                rotation=90),
                Rectangle(
                  extent={{-50.5,51},{50.5,51-count*100}},
                  lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor=color,
                origin={0,-9.5},
                rotation=90),
                Text(
                  extent={{0,-27},{0,12}},
                  textString=DynamicSelect("0",realString(levelSensor_,1,0)),
                  lineColor={0,0,0})}));
      end Counter_real;

      model Start
        "User action: starting and stopping the machine (step 1, 2, 11), initiating the insertion of coffee pads (step 5) and the refill of water (step 3)."
        parameter Real EV_time=600;
        TS starting(
          h=1/EV_time,
          nIn=1,
          nOut=1)
          annotation (Placement(transformation(extent={{12,-26},{32,-6}})));
         Real colorHead[3]=if stop.t>0 then {255,0,0} else {0,255,0};
        PD       start(       nOut=2,
          nIn=3,
          enablingType=1,
          maxTokens=1)                                       annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={60,10})));
        PD       stop(nIn=1,
          startTokens=1,
          nOut=1,
          maxTokens=1)
          annotation (Placement(transformation(extent={{-20,-26},{0,-6}})));
        Interfaces.PlaceOut refill_ annotation (Placement(transformation(extent={{100,-18},
                  {120,2}}),        iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-64,-82})));
        TD       T8(
          nIn=1,
          nOut=1,
          delay=1)
                 annotation (Placement(transformation(extent={{-54,-26},{-34,-6}})));
        TD       T6(
          nOut=1,
          nIn=1,
          delay=1)
                 annotation (Placement(transformation(extent={{-54,22},{-34,42}})));
        PD       nextcoffee(
          nIn=1,
          maxTokens=1,
          startTokens=0,
          nOut=1) annotation (Placement(transformation(extent={{-18,22},{2,42}})));
        TD       T10(nIn=1, nOut=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={24,32})));
        PD       P1(
          nIn=1,
          nOut=2,
          enablingType=2,
          enablingProbOut={0.2,0.8},
          maxTokens=1)
          annotation (Placement(transformation(extent={{-90,-4},{-70,16}})));
        Interfaces.PlaceIn stopornext_ annotation (Placement(transformation(extent={{-120,-4},
                  {-100,16}}),     iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={66,-72})));
        Interfaces.PlaceIn refillstart_ annotation (Placement(transformation(extent={{-120,
                  -50},{-100,-30}}),  iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-82})));
        TD T1(nIn=1, nOut=2)
          annotation (Placement(transformation(extent={{78,22},{98,42}})));
        Interfaces.TransitionOut start_[2]
          annotation (Placement(transformation(extent={{100,24},{120,44}}),
              iconTransformation(extent={{50,44},{70,64}})));
      equation
        connect(stop.outTransition[1], starting.inPlaces[1]) annotation (Line(
            points={{0.8,-16},{17.2,-16}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(start.outTransition[1], refill_) annotation (Line(
            points={{70.8,9.5},{76,9.5},{76,-8},{110,-8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.outTransition[1], T6.inPlaces[1]) annotation (Line(
            points={{-69.2,5.5},{-60,5.5},{-60,32},{-48.8,32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.outTransition[2], T8.inPlaces[1]) annotation (Line(
            points={{-69.2,6.5},{-60,6.5},{-60,-16},{-48.8,-16}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T6.outPlaces[1], nextcoffee.inTransition[1]) annotation (Line(
            points={{-39.2,32},{-18.8,32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T8.outPlaces[1], stop.inTransition[1]) annotation (Line(
            points={{-39.2,-16},{-20.8,-16}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.inTransition[1], stopornext_) annotation (Line(
            points={{-90.8,6},{-110,6}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(nextcoffee.outTransition[1], T10.inPlaces[1]) annotation (Line(
            points={{2.8,32},{19.2,32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T10.outPlaces[1], start.inTransition[1]) annotation (Line(
            points={{28.8,32},{42,32},{42,9.33333},{49.2,9.33333}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(starting.outPlaces[1], start.inTransition[2]) annotation (Line(
            points={{26.8,-16},{42,-16},{42,10},{49.2,10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(start.inTransition[3], refillstart_) annotation (Line(
            points={{49.2,10.6667},{44,10.6667},{44,-40},{-110,-40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(start.outTransition[2], T1.inPlaces[1]) annotation (Line(
            points={{70.8,10.5},{76,10.5},{76,32},{83.2,32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[1], start_[1]) annotation (Line(
            points={{92.8,31.5},{106,31.5},{106,30},{101.4,30},{101.4,29},{110,29}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[2], start_[2])
        annotation (Diagram(graphics), Icon(graphics={
              Ellipse(
                extent={{-20,92},{22,56}},
                lineColor={0,0,0},
                fillColor=DynamicSelect({255,255,255}, colorHead),
                fillPattern=FillPattern.Solid,
                lineThickness=0.5),
              Line(
                points={{0,56},{0,-26},{-56,-72}},
                color={0,0,0},
                smooth=Smooth.None,
                thickness=0.5),
              Line(
                points={{0,-26},{56,-72}},
                color={0,0,0},
                smooth=Smooth.None,
                thickness=0.5),
              Line(
                points={{-50,54},{0,14}},
                color={0,0,0},
                smooth=Smooth.None,
                thickness=0.5),
              Line(
                points={{0,14},{50,54}},
                color={0,0,0},
                smooth=Smooth.None,
                thickness=0.5),
              Text(
                extent={{38,62},{38,52}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Start"),
              Text(
                extent={{-34,-68},{-34,-78}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Refill"),
              Text(
                extent={{32,-68},{32,-78}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Stop/Next")}));
        annotation (Icon(graphics), Diagram(graphics));
      end Start;

      model Refill_Water
        "Refilling water: the water tank of the Senseo machine is refilled (step 3)."

        TD       refilling2(
          nIn=1,
          nOut=2,
          arcWeightOut={1,0.7 - watertank_.t},
          delay=30) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={62,40})));
        PD       puffer(
          nIn=1,
          nOut=1,
          maxTokens=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={36,40})));
        TD       refilling1(
          delay=1,
          arcWeightOut={1},
          nOut=1,
          nIn=2,
          arcWeightIn={1,0.36})   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={8,40})));
        IA       IA1(testValue=0.36)
          annotation (Placement(transformation(extent={{-74,-20},{-62,-16}})));
        Interfaces.TransitionIn watertank_
          annotation (Placement(transformation(extent={{-120,-28},{-100,-8}}),
              iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={110,-40})));
        Interfaces.TransitionOut refill_[2]    annotation (Placement(transformation(
              extent={{-20,-10},{0,10}},
              rotation=0,
              origin={110,40}),  iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,90})));
        Interfaces.TransitionIn start_    annotation (Placement(transformation(
              extent={{-20,-10},{0,10}},
              rotation=0,
              origin={-102,40}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-110,-40})));
        Real color[3]=if fac<1 then {0,0,255} else {255,255,255};
        Real startTime;
        Real fac=if (time-startTime)/60<1 and startTime>0 then (time-startTime)/60 else 0;
        Real recsize[2,2]={{-100,80},{-100+200*fac,-80}};
      equation
        when  puffer.t>0 then
          startTime=time;
        end when;
        connect(IA1.inPlace, watertank_)
                                       annotation (Line(
            points={{-74.9524,-18},{-110,-18}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(refilling1.outPlaces[1], puffer.inTransition[1]) annotation (Line(
            points={{12.8,40},{25.2,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(puffer.outTransition[1], refilling2.inPlaces[1]) annotation (Line(
            points={{46.8,40},{57.2,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(refilling2.outPlaces, refill_)    annotation (Line(
            points={{66.8,40},{100,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(refilling1.inPlaces[1], start_)    annotation (Line(
            points={{3.2,39.5},{-110,39.5},{-110,40},{-112,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(IA1.outTransition, refilling1.inPlaces[2]) annotation (Line(
            points={{-61.0476,-18},{-40,-18},{-40,40.5},{3.2,40.5}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics), Icon(graphics={Rectangle(
                extent={{-100,80},{100,-80}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),       Rectangle(
                extent=DynamicSelect({{-100,80},{100,-80}},recsize),
                lineColor={0,0,0},
                fillColor=DynamicSelect({255,255,255},color),
                fillPattern=FillPattern.Solid), Text(
                extent={{-78,20},{80,-12}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Refill Water")}));
      end Refill_Water;

      model Water_Tank "Water tank: the water tank of the Senseo machine."
        Real level "Tank level in % of max height";
        parameter Real color[3]={0,0,255};
        PC       water_tank(
          nOut=3,
          startMarks=0.5,
          maxMarks=0.75,
          nIn=1) "cold water in tank"          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-8,6})));
        Interfaces.PlaceOut outTransition1[2]    annotation (Placement(transformation(
                extent={{100,17},{120,37}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-70,9})));
        Interfaces.PlaceIn inTransition1 annotation (Placement(transformation(
                extent={{-105,-4},{-85,16}}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,-50})));
        Interfaces.PlaceOut refill_
          annotation (Placement(transformation(extent={{100,-20},{120,0}}),
              iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={90,10})));
      equation
        level=water_tank.t/water_tank.maxMarks;
        connect(water_tank.outTransition[1], outTransition1[1]) annotation (Line(
            points={{2.8,5.33333},{56.4,5.33333},{56.4,22},{110,22}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(water_tank.outTransition[2], outTransition1[2]);
        connect(water_tank.inTransition[1], inTransition1) annotation (Line(
            points={{-18.8,6},{-95,6}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(water_tank.outTransition[3], refill_) annotation (Line(
            points={{2.8,6.66667},{55.9,6.66667},{55.9,-10},{110,-10}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-94,61},{94,90}},
                  lineColor=color,
                textString="Water Tank"),
                Rectangle(
                  extent={{-60,60},{80,-40}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent=DynamicSelect({{-60,-40},{-60,-40}}, {{-60,-40},{80,(-40
                       + level*100)}}),
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor=color)}));
      end Water_Tank;

      model Insert_Pad
        "Insert pad: coffee pads are inserted to the Senseo machine (step 5)."

        TS       inserting2(
          nIn=1,
          nOut=1,
          arcWeightOut={1},
          h=1/20)   annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={62,40})));
        PD       puffer(
          nOut=1,
          maxTokens=1,
          nIn=1)       annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={4,40})));
        Interfaces.TransitionOut insertpad_    annotation (Placement(transformation(
              extent={{-20,-10},{0,10}},
              rotation=0,
              origin={110,40}),  iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={110,-40})));
        Real color[3]=if fac<1 then {80,0,0} else {255,255,255};
        Real startTime;
        Real fac=if (time-startTime)/60<1 and startTime>0 then (time-startTime)/60 else 0;
        Real recsize[2,2]={{-100,80},{-100+200*fac,-80}};
        Interfaces.PlaceIn insert_ annotation (Placement(transformation(extent={{-112,30},
                  {-92,50}}),        iconTransformation(extent={{-120,-50},{-100,-30}})));
      equation
        when  puffer.t>0 then
          startTime=time;
        end when;
        connect(puffer.outTransition[1],inserting2. inPlaces[1]) annotation (Line(
            points={{14.8,40},{57.2,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(inserting2.outPlaces[1], insertpad_) annotation (Line(
            points={{66.8,40},{100,40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(puffer.inTransition[1], insert_) annotation (Line(
            points={{-6.8,40},{-102,40}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics), Icon(graphics={Rectangle(
                extent={{-100,80},{100,-80}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),       Rectangle(
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

      model Senseo_Maschine
        "Senseo machine: the functionality of the Senseo machine (step 4, 6, 7, 8, 9, 10)."
        parameter Real Psenseo=1.450 "power of senseo machine [kW]";
        parameter Real c=4.182 "specific heat capacity [kJ/(kg*K)]";
        parameter Real k=0.01177 "proportionality factor for cooling water";
        parameter Real TE=20 "Enviroment temperatur [∞C]";
        parameter Real TC=10 "Temperature of new water [∞C]";

        PNlib.TC heating(
          nIn=3,
          nOut=1,
          maximumSpeed=Psenseo/(c*water_hc.t))
                                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-14,82})));
        PNlib.TA TA1(testValue=0)
                     annotation (Placement(transformation(
              extent={{-5.99995,-2.00001},{6.00002,2.00001}},
              rotation=270,
              origin={-40,96})));
        PNlib.TA TA2(testValue=0.34)
          annotation (Placement(transformation(extent={{-86,78},{-70,84}})));
        PNlib.PC TW(
          nIn=2,
          nOut=3,
          maxMarks=90,
          startMarks=20) "water temperature"
          annotation (Placement(transformation(extent={{10,72},{30,92}})));
        PNlib.TC pumping(
          maximumSpeed=0.1,
          nOut=2,
          nIn=1,
          arcWeightOut={1,TC/water_hc.t})
                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-144,64})));
        PNlib.TC cooling(
          nIn=2,
          maximumSpeed=k*(TW.t - TE),
          firingCon=TW.t > TE)
          annotation (Placement(transformation(extent={{62,72},{82,92}})));
        PNlib.TD stopornext(
          nIn=2,
          firingCon=true,
          delay=1,
          nOut=1)
          annotation (Placement(transformation(extent={{158,100},{178,120}})));
        PNlib.PC water_hc(
          nIn=1,
          nOut=2,
          startMarks=0.25,
          maxMarks=0.25) "water in heating chamber" annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-144,30})));
        PNlib.TD T1(
          nIn=2,
          nOut=1,
          arcWeightIn={90,1},
          delay=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={52,36})));
        PNlib.TA TA3(testValue=90)
                     annotation (Placement(transformation(
              extent={{-6,-2},{6,2}},
              rotation=270,
              origin={46,60})));
        PNlib.PD decision(
          nIn=1,
          maxTokens=1,
          nOut=2,
          enablingType=2,
          enablingProbOut={0.7,0.3}) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={32,-32})));
        PNlib.TD T2(
          nIn=1,
          nOut=1,
          delay=1)
                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-10,-10})));
        PNlib.TD T3(
          nIn=1,
          nOut=1,
          delay=1)
                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-8,-54})));
        PNlib.PD onecup(nIn=1, nOut=1,
          maxTokens=1)                 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-46,-10})));
        PNlib.PD twocups(nIn=1, nOut=1,
          maxTokens=1)                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-46,-54})));
        PNlib.TD T4(nIn=1, nOut=1,
          arcWeightOut={1})        annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-74,-10})));
        PNlib.TD T5(nIn=1, nOut=1,
          arcWeightOut={2})        annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-74,-54})));
        PNlib.TC scalding(
          maximumSpeed=0.003125,
          nIn=3,
          nOut=2,
          arcWeightIn={1,1,TW.t/water_hc.t})
                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-144,-30})));
        TA       RA1(testValue=0)
                     annotation (Placement(transformation(extent={{-7,-2.00002},
                  {7,2.00002}},
              rotation=90,
              origin={-36,41})));
        PNlib.PC coffee_cup(nIn=1, nOut=1)
                               annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-144,-74})));
        inner PNlib.Settings settings1
          annotation (Placement(transformation(extent={{156,-158},{182,-132}})));
        PNlib.PD ready(
          maxTokens=1,
          nIn=1,
          nOut=1,
          startTokens=0)
          annotation (Placement(transformation(extent={{-102,-130},{-82,-110}})));
        PNlib.TD T7(
          nIn=2,
          nOut=2,
          firingCon=pre(disamount.t) > 0,
          arcWeightIn={pre(disamount.t)*0.125,pre(disamount.t)},
          arcWeightOut={pre(disamount.t),1},
          delay=1)                             annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-144,-108})));
        PNlib.PD amountCups(nIn=1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-144,-152})));
        PNlib.PD disamount(nIn=3, nOut=2) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-106,-32})));
        PNlib.PD P1(
          nOut=3,
          maxTokens=1,
          nIn=1)  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,158})));
        PNlib.PD P3(       nOut=1, nIn=1,
          maxTokens=1)             annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={92,142})));
        Modelica.Blocks.Interfaces.RealOutput coffee_cup_ annotation (Placement(
              transformation(extent={{-114,-84},{-94,-64}}),
                                                           iconTransformation(extent={{100,40},
                  {120,60}})));
        Modelica.Blocks.Interfaces.IntegerOutput amount_cups_ annotation (Placement(
              transformation(extent={{-124,-162},{-104,-142}}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={50,190})));
        Interfaces.TransitionIn watertank_[2]
          annotation (Placement(transformation(extent={{-200,72},{-180,92}}),
              iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={110,-124})));
        Interfaces.TransitionOut stopornext_ annotation (Placement(transformation(
                extent={{202,100},{222,120}}),
                                             iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-94,-120})));
        Interfaces.PlaceIn startheating_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-34,190}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={-96,94})));
        Interfaces.PlaceIn padinsert_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={92,190}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-22,190})));
        Modelica.Blocks.Interfaces.RealOutput tw_ annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={20,124}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={110,152})));
        IA IA1(testValue=1)
          annotation (Placement(transformation(extent={{24,134},{40,140}})));
      equation
        connect(TA1.outTransition, heating.inPlaces[1]) annotation (Line(
            points={{-34.303,90.0173},{-34.303,82.009},{-18.8,82.009},{-18.8,
                81.3333}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(TA2.outTransition, heating.inPlaces[2]) annotation (Line(
            points={{-68.7302,81},{-18.8,82}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(heating.outPlaces[1], TW.inTransition[1]) annotation (Line(
            points={{-9.2,82},{0,82},{0,81.5},{9.2,81.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TW.outTransition[1], cooling.inPlaces[1]) annotation (Line(
            points={{30.8,81.3333},{42,81.3333},{42,81.5},{67.2,81.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(pumping.outPlaces[1], water_hc.inTransition[1]) annotation (Line(
            points={{-144.5,59.2},{-144.5,50},{-144,50},{-144,40.8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TW.outTransition[2], TA3.inPlace) annotation (Line(
            points={{30.8,82},{51.697,82},{51.697,67.9221}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TA3.outTransition, T1.inPlaces[1]) annotation (Line(
            points={{51.697,54.0173},{51.697,45.0087},{51.5,45.0087},{51.5,40.8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[1], decision.inTransition[1]) annotation (Line(
            points={{52,31.2},{52,-32},{42.8,-32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(decision.outTransition[1], T2.inPlaces[1]) annotation (Line(
            points={{21.2,-31.5},{8,-31.5},{8,-10},{-5.2,-10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(decision.outTransition[2], T3.inPlaces[1]) annotation (Line(
            points={{21.2,-32.5},{8,-32.5},{8,-54},{-3.2,-54}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T2.outPlaces[1], onecup.inTransition[1]) annotation (Line(
            points={{-14.8,-10},{-25,-10},{-25,-10},{-35.2,-10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T3.outPlaces[1], twocups.inTransition[1]) annotation (Line(
            points={{-12.8,-54},{-35.2,-54}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(onecup.outTransition[1], T4.inPlaces[1]) annotation (Line(
            points={{-56.8,-10},{-63,-10},{-63,-10},{-69.2,-10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(twocups.outTransition[1], T5.inPlaces[1]) annotation (Line(
            points={{-56.8,-54},{-69.2,-54}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(water_hc.outTransition[1], scalding.inPlaces[1]) annotation (Line(
            points={{-144.5,19.2},{-144,8},{-144,-25.2},{-144.667,-25.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(RA1.outTransition, heating.inPlaces[3]) annotation (Line(
            points={{-34.4748,42.8586},{-34.5238,42.8586},{-34.5238,82.6667},{
                -18.8,82.6667}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(water_hc.outTransition[2], RA1.inPlace) annotation (Line(
            points={{-143.5,19.2},{-143.5,14},{-34,14},{-34,26.6363},{-34.4748,
                26.6363}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(scalding.outPlaces[1], coffee_cup.inTransition[1])
                                                               annotation (Line(
            points={{-144.5,-34.8},{-144.5,-34},{-144,-34},{-144,-63.2}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(coffee_cup.outTransition[1], T7.inPlaces[1]) annotation (Line(
            points={{-144,-84.8},{-144,-103.2},{-144.5,-103.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T7.outPlaces[1], amountCups.inTransition[1]) annotation (Line(
            points={{-144.5,-112.8},{-144.5,-119},{-144,-119},{-144,-141.2}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(T7.outPlaces[2], ready.inTransition[1]) annotation (Line(
            points={{-143.5,-112.8},{-144,-112.8},{-144,-120},{-102.8,-120}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T4.outPlaces[1], disamount.inTransition[1]) annotation (Line(
            points={{-78.8,-10},{-95.2,-31.3333}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T5.outPlaces[1], disamount.inTransition[2]) annotation (Line(
            points={{-78.8,-54},{-95.2,-32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(disamount.outTransition[1], T7.inPlaces[2]) annotation (Line(
            points={{-116.8,-31.5},{-126,-31.5},{-126,-94},{-143.5,-94},{-143.5,
                -103.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(disamount.outTransition[2], scalding.inPlaces[2]) annotation (Line(
            points={{-116.8,-32.5},{-126,-32.5},{-126,-12},{-144,-12},{-144,-25.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(scalding.outPlaces[2], disamount.inTransition[3]) annotation (Line(
            points={{-143.5,-34.8},{-143.5,-46},{-90,-46},{-90,-32.6667},{-95.2,
                -32.6667}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(P1.outTransition[1], TA1.inPlace) annotation (Line(
            points={{-34.6667,147.2},{-34.6667,114.361},{-34.303,114.361},{
                -34.303,103.922}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(P1.outTransition[2], stopornext.inPlaces[1])
                                                           annotation (Line(
            points={{-34,147.2},{-34,110},{163.2,110},{163.2,109.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ready.outTransition[1], stopornext.inPlaces[2])
                                                              annotation (Line(
            points={{-81.2,-120},{116,-120},{116,110.5},{163.2,110.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P3.outTransition[1], T1.inPlaces[2]) annotation (Line(
            points={{92,131.2},{92,48},{52,48},{52,40.8},{52.5,40.8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(coffee_cup.pc_t, coffee_cup_) annotation (Line(
            points={{-133.2,-74},{-104,-74}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(amountCups.pd_t, amount_cups_) annotation (Line(
            points={{-133.4,-152},{-114,-152}},
            color={255,127,0},
            smooth=Smooth.None));

        connect(stopornext.outPlaces[1], stopornext_) annotation (Line(
            points={{172.8,110},{212,110}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(watertank_[1], TA2.inPlace) annotation (Line(
            points={{-190,77},{-190,81},{-87.2698,81}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(watertank_[2], pumping.inPlaces[1]) annotation (Line(
            points={{-190,87},{-190,82},{-144,82},{-144,68.8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.inTransition[1], startheating_) annotation (Line(
            points={{-34,168.8},{-34,190}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P3.inTransition[1], padinsert_) annotation (Line(
            points={{92,152.8},{92,190}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(pumping.outPlaces[2], TW.inTransition[2]) annotation (Line(
            points={{-143.5,59.2},{-143.5,52},{0,52},{0,82.5},{9.2,82.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TW.outTransition[3], scalding.inPlaces[3]) annotation (Line(
            points={{30.8,82.6667},{34,82.6667},{34,10},{-143.333,10},{-143.333,
                -25.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TW.pc_t, tw_) annotation (Line(
            points={{20,92.8},{20,124}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(P1.outTransition[3], IA1.inPlace) annotation (Line(
            points={{-33.3333,147.2},{-32,147.2},{-32,138},{22.7302,138},{
                22.7302,137}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(IA1.outTransition, cooling.inPlaces[2]) annotation (Line(
            points={{41.2698,137},{60,137},{60,82.5},{67.2,82.5}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},
                  {220,200}}),
                          graphics),
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{
                  220,200}}),
              graphics={Bitmap(
                extent={{-238,180},{254,-180}},
                imageSource="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"
                     + "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"
                     + "6bzl+elLztHA4pSfmI29RSQBuOxeaMnzMdsVGMeVz0HennGVOPwoAP8AlnyOAeKcSd6nAyRTM5LDFLkbV60xjwfkdSOnekZc7GK+w96Yf9aevPSnKcxYzyDz7VLj1AcARIylSc/pRhTEBggA/nTiP3iEPwR19aaN2JAcY9KgB2P3gznBHFMC5Rhk5BqQklUYMPT6UuG8x1GMEdKPQCJiMoQTjoaTaAXGTUm1jCp4yDx7UpDecMgHI600JkeVKKQxyp6elPwDIRv4Yd+9N2kq67enOaUktsJX2+tUmIhZN0LAlSFPANMEMsO1raYx7uwOV/KrgQeY67MkjPFRNGDEMKQQeTVxn0E0EepXUZImgVwP4kOD+Rq7HqtswBdjGT03jFUSg3jggMKdFIsYKSr5iA5KMOK05nbQmxrq6yDcjAj2NSLxWROLVyzwRGMMONjYINV1mvoVUpch/Z1zVRlfcVjoSe9Luz3OKwxq91GcSQLJjqUOKnTXEKAvBKo+mau7FZmtvyxpJWPlnaCT6Cs5NYtWPL7fqCKsrqNqwBWeP/vqkn3Cw4MATnp2oVkdOwYUjTwt92RD64Ipiywk8OufrUOpyysNIkYLvGMYrEuBN9tlCrLszxjNb4liIGWTP1p3nW46yJ+YqnqhHMCC6KnEcpOeD7Vbs7O6+2xyFGRVxkk1steW6nmVPzqM6naKP9cvHpSt3Kuy8D+dOBJPFZJ1u2GNu9iemFpn9u5J8uBjjrk4p3FZo2d3TPWjd6msB9Yu3X5FRVP5iqryXEz4luGIPocUiuXudJLewQD95Ko/GqMuvRAlYEaQjvjArG8hFXLZfnqakxtZcDA9aQ+Unk1S7uUOCIx6DrVYqWcF2LE9zTwMhskD3FBADrwc0XCwhGVIJz9KeAdycfjQgOGPANOJzt549KzkykAz8+WwaTP3CM5oX+PAz9aXJ2oOMVlcYZzv7H3pBghcnn0pQAS38QoIwi4AwKLgLgBmAXj3pMl9h6DvSklmIYjp1FNOFRT1OetJ+YA7gb1PzCqxclQMcVLKx8zgYJFQnATLHGDWkY9SZMJCIwSzAcdawbydpZT82VHSrGpXW6XZGflxzWc3TitELYTpR9aTNBoGLn1pO/FGaMUxCc4oo75opNjCikPSigDqwwCgrmnAAs3NN52A8cU7J8wHAyRWQwOPKPPIpB95Tux2pvPzAinEkKrFeaNw2FAzuGfwoyQF5/8ArULjzDx1/SjjyuB0PX1pjHoMylQeo/OmnPlcjOD09KQn51IU89qUEEuO/rRbUkdk71PGT3pVXPmLjgc0zKiNeoAPNP8Al83JbAI4oGAbKKSvAP508Y804U8jp6VEOY2G75s5xTgzb0KtjjGaGkwDAEZ46d6eD86MFPI6UJyZFLAH09aPnEKkNkg/lWVhjgAN64OeopCFKKwzx1FPAZpeoBI5pvzbHXjAPSmAmAJeCdpHFN2hkYbjkHpUpDMyNgZ6UmGWR12jJFO/YBAyqyNvPoT6UBcs6eZx296AGNuDtB2mnZKyqxTO4UCEIJjUhwSOPpTHjZZuqncOakQYWRShPcH0pG2vEhCn5Tz71UZWE1chwdjrgfL3FIEYIjFeD3qV0USAjcAR0qJWHluhY7gcgdq0Ur7E2sLzuc8Dim7cBeefSnkRiHeCST1B7Um4HYMc1alcEHlqWbauT6GozArIPkXntinhiC2W/KncBVxyaLjsQ/ZYdxG0EEc037LGFJVMgmrR5dsDBxTOigE4NAETWybxxxj1pBbw4OV3CrGB5vGcgdKOdp4x7U79AIfs6ZUhBj1pwiUFs4H0qXjK4P4U0chiqn8aVwG7VCqcc07BMhwMcUYO1QenpRxubkmncLAQCoGcHPagAeZjHOKP4BgcU4nD/Njp1HalcY3kKQMdelKVyw57dKQ4Cc889RS87l4x71IBj5G2jPsaVeq56UoztOTyD1FOwCV4+aplKwxNigNn5hQM/Lxx60vzZfAAoOCq84PpWVwA8MwJxTMghOufWnYG5sDJ9DSoh2Ajp6GlcYq5DtgAGmMcoPmwfSl43nJJ4po+7kDPNFgHpt38LyR0Peo3Y+WQCBz0qRyQ4JIxiqrHg5OeeKaV2DYvG/J545FUb+6WO3ZU+8entVi6uBBGGYduKwZbgzOxboTW6M0QkknJPNIQaMc8UmafUYdjRxSZopWAO3FHNHakz70w2FoJ9KM03vSGB6UUGihMDq/4R9aD95aKKy6DF/iNOb/VpRRTj8ImH/LQ/Sgf6lvrRRQhjv8AlpFQv+uloopsEJL/AMe6f71K/wDrk+lFFJD6idpKD/q1oopvclCJ/rhUq/6s/WiiokUhT/DTj940UUkAo/1VJJ/r46KKFuBJH916H+5FRRQtxIkj/wBa30pkf/Ho/wDv0UU0CHy/6yH6VVb/AFsv0oooRD2Gn/j2Wkbqn0oorWIIavR6mH3Uooqixsn32qMfdSiim9xFk/678Kjk7/Wiil1EgH31pR/FRRQhsa331p0f3moopdAY0fcH1pD99vpRRQwQo/1Rpx7fSiil0GwX/Vmpj92OiisZ7ghG6NUQ+6v1ooqVuBI/3/wpB91frRRQh9A/5bN9KF+6frRRQBHL9/8ACoV+61FFbQ2IZnav/qI/rWOaKK0QkIaTtRRVIYyl70UUugxe5ppoopLcTAUveiil1GNHeiiigl7n/9k=",
                fileName="modelica://PNlib/../../../Ausarbeitungen/Berlin/senseo.jpg")}),
                    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-200},{220,
                  200}}), graphics));
      end Senseo_Maschine;

    annotation (Documentation(info="<html>
<h1>Background</h1>
<p>
A model of a Senseo coffee machine is presented. The main feature of a Senseo coffee machine is that the coffee is placed in the machine
in a pre-portioned form by so-called coffee pads. One pad is generally used to make one cup of coffee (125∞ml) and two pads reach for two cups at 125 ml or one big cup at 250 ml.
After a warm-up time of about 60 seconds and the insertion of a coffee pad, the coffee can be made. In this warm-up phase, the water is heated at 90∞C and then pressed with a pressure
of about 1.4 bar within 40 seconds through the pad. In contrast to a normal coffee machine that boils the water continuously and transports it by its own buoyancy (hot bubbles) up into the filter,
the Senseo machine heats a portion of water completely in a heating chamber and pumps it then through the pad. To ensure that the heating chamber in the machine is always filled with water,
a float is placed in the removable water tank which allows measuring the minimal capacity.
If the minimum level is exceeded, the heater is turned off. If there is sufficient water level, the next portion of water is heated directly after the scalding and filling.
</p>
<h1>Representation by an xHPN model</h1>
<p>
<table border=1 cellspacing=0 cellpadding=3>
  <tr>
    <th>Step</th>
    <th>Functional Principle</th>
    <th>xHPN model</th>
  </tr>
  <tr>
    <td>1</td>
    <td>The machine is off.</td>
    <td>One token is placed in place <i>start</i>.</td>
  </tr>
  <tr>
    <td>2</td>
    <td>The time between turn the machine off and on again takes averagely 1200 s.</td>
    <td>The stochastic transition <i>starting</i> has a hazard function of 1/1200.</td>
  </tr>
  <tr>
    <td>3</td>
    <td>If the machine is started and the water in the tank is less than 0.35 l, new water has to be filled to the tank.
        The tank is always filled completely and this procedure takes 30 s.
        The water tank has a maximum capacity of 0.7 l.</td>
    <td>The place <i>water_tank</i> is connected to the transition <i>refilling1</i> by an inhibitor arc with an weight of 0.35.
          The transition <i>refilling2</i> has a delay of 30 and the weight of the arc from this transition back to the place <i>water_tank</i> is <i>0.7-water_tank.t</i>,
          where <i>water_tank.t</i> is the current marking of place <i>water_tank</i>. The place <i>water_tank</i> has a maximum capacity of 0.7.</td>
  </tr>
  <tr>
    <td>4</td>
    <td>If there is enough water in the tank, the water in the heating camber is heated. The heating speed (h<sub>s</sub>) depends on the power of the Senseo machine (P<sub>senseo</sub>),
    the specific heat capacity of water (c), and the amount of water to be heated in the heating camber (W<sub>HC</sub>):<br>
      h<sub>s</sub>=P<sub>senseo</sub>/(c&middot;W<sub>HC</sub> ).<br>
      The maximum temperature of the water is 90∞C.</td>
    <td>The place <i>water_tank</i> is connected to the transition <i>heating</i> by a test arc with the weight 0.35.
        The continuous transitions heating has a maximum speed of <i>Psenso/(c*waterHC.t)</i>, where <i>waterHC.t</i> is the current marking of the place <i>waterHC</i>.
        The maximum capacity of place <i>TW</i> is set to 90.</td>
  </tr>
  <tr>
    <td>5</td>
    <td>Simultaneously, the user has to insert a coffee pad to the Senseo machine. Therefore, he needs averagely 30 s.</td>
    <td>The stochastic transition <i>inserting</i> has a hazard function of 1/30.</td>
  </tr>
  <tr>
    <td>6</td>
    <td>When the water reaches a temperature of 90∞C, the user can chose if he wants one or two cups of coffee.
        In 70% he chooses one cup and in 30% two cups.</td>
    <td>The place <i>TW</i> is connected to the transition <i>T2</i> by a test arc with a weight of 90.
        The place <i>decision1</i> gets one token and a random procedure is performed to decide if <i>T3</i> or <i>T4</i> fires.
        If T3 fire, the place <i>one_cup</i> gets one token and afterwards <i>T5</i> and the place <i>amount</i> gets also one token. However, if <i>T4</i> fires,
        the place <i>amount</i> gets two tokens.
</td>
  </tr>
  <tr>
    <td>7</td>
    <td>When the machine is off, the temperature of the water in the heating camber (TW) is cooled down at the speed <br>
    k&middot;(TW-TE),<br>
    where k is a proportional factor and TE is the environment temperature.</td>
    <td>The continuous transition <i>cooling</i> has the maximum speed <i>k*(TW.t-TE)</i> and the firing condition <i>TW.t>TE</i>, where <i>TW.t</i>
     is the current marking of place <i>TW</i>. Additionally, the inhibitor arc (on&rarr;cooling) with the weight 1 causes that the cooling is only performed when the machine is off.</td>
  </tr>
  <tr>
    <td>8</td>
    <td>The coffee is scaled with a speed of 0.003125 l/s.
        If one cup is chosen, 0.125 l coffee is made and if two cups are chosen 0.25 l coffee is produced.</td>
    <td>The continuous transition <i>scalding</i> has a maximum speed of 0.003125.
        This transition can only fire when the place <i>amount</i> has at least one token. If the random procedure of step 6 choses <i>T3</i> to fire,
        the place <i>amount</i> gets one token and if <i>T4</i> is chosen the place <i>amount</i> gets two tokens. These tokens remain in the place <i>amount</i> until
        the transition <i>counting</i> fires. This transitions fires when the place <i>coffee_cup</i> has reached a marking of <i>0.125*amount.t</i> (arc weight),
        where <i>amount.t</i> is the current marking of the place <i>amount</i>. Additionally, all tokens are removed from the place <i>amount</i> and, hence,
        the transition <i>scalding</i> cannot fire anymore.</td>
  </tr>
  <tr>
    <td>9</td>
    <td>Simultaneously, new water is pumped from the tank to the heating camber with a maximum speed of 0.1 l/s.
         The heating camber has a maximum capacity of 0.25 l. When new cold water (W<sub>in</sub>) with a temperature TC is pumped
         to the heating camber and the hot water is used for scalding (W<sub>out</sub>), the water temperature (TW) decreases. The mixing temperature is given by <br>
         T<sub>m</sub>=(TW&middot;(W<sub>HC</sub>-W<sub>out</sub>)+TC&middot;W<sub>in</sub>)/W<sub>HC</sub></td>
    <td>The continuous transition <i>pumping</i> has a maximum speed of 0.1. The place <i>water_hc</i> has a maximum capacity of 0.25.
         The place <i>TW</i> is an output of the transition <i>pumping</i> with an arc weight of <i>TC/water_hc.t<i> and an input of the transition <i>scalding</i>
          with an arc weight <i>TW.t/water_hc.t</i>, where <i>water_hc</i> is the current marking of place <i>water_hc</i>.</td>
  </tr>
  <tr>
    <td>10</td>
    <td>If the desired amount of coffee is made, the cups are counted and the machine is ready again.</td>
    <td>The arc from the continuous place <i>coffee_cup</i> to the discrete transition <i>counting</i>
     is <i>amount.t*0.125</i> where <i>amount.t</i> is the current marking of the place <i>amount</i>.
     Additionally <i>amount</i> tokens are added to place <i>amount_cups</i> and the place <i>ready</i> gets one token.</td>
  </tr>
  <tr>
    <td>11</td>
    <td>If the machine is ready again, the user can decide if he wants another coffee (20%) or if he wants to turn off the machine (80%).</td>
    <td>The transition <i>stop_or_next</i> fires one token to place <i>decision2</i> when the machine is ready again.
    A random procedure choses with a probability of 0.2 transition <i>T7</i> and with a probability of 0.8 transition <i>T8</i> to fire.
    If <i>T7</i> fires, the procedure starts from step 3 again and if <i>T8</i> fires the place <i>stop</i> gets one token and the procedure starts from the beginning (step 1).</td>
  </tr>
</table>
</p>
<p>
This xHPN model of the Senseo coffee machine has been implemented in a hierarchical structure with the aid of the PNlib and the Modelica tool Dymola.
The figure shows the model at the top level. An animation of this model displays the amount of produced coffees,
the temperature of the water as well as the current filling level of the coffee cup and the water tank.
Additionally, the head of the stickman is green when the machine is on and red when it is off. When a pad is inserted the respective rectangle is brown and, similarly, t
he when water is refilled the respective rectangle is blue.
</p>
<p>
  <img src=\"PNlib/Resources/Images/senseotop.png\">
</p>
<p>
The xHPN model ans the corresponding processes listed in the table are divided for the Modelica model into five sub-models, also called wrappers, which represent the following processes:
<ul>
<li>        User action (stickman): starting and stopping the machine (step 1, 2, 11), initiating the insertion of coffee pads (step 5) and the refill of water (step 3).
<li>          Insert pad (rectangle): coffee pads are inserted to the Senseo machine (step 5).
<li>          Refilling water (rectangle): the water tank of the Senseo machine is refilled (step 3).
<li>          Water tank (rectangle): the water tank of the Senseo machine.
<li>          Senseo machine (picture): the functionality of the Senseo machine (step 4, 6, 7, 8, 9, 10).
</li></ul>
</p>
<p>
These xHPN-sub-model are represented in following figure.
</p>
<p>
  <img src=\"PNlib/Resources/Images/senseo.png\">
</p>
<p>
The following figure shows one possible result for simulating the Senseo machine 5 hours.
It has to mentioned that every simulation result is different due to the included stochastic effects (starting the machine, inserting coffee pads,
choosing one or two coffees, stopping the machine or producing another coffee).
</p>
<p>
  <img src=\"PNlib/Resources/Images/senseoresults.png\">
</p>
</html>"));
    end Senseo;

    package Printing "Model of a printing production process"

      model Model "Top model"
       inner Real speed=start_Stop.speed;
       inner Boolean reStart=start_Stop.reStart;
       inner Boolean start=start_Stop.Start.t>0;
       Real orders__;
       Real exemplars__;
       Real maculation__;
       Real paper__;
       Real duration__;
        PNlib.Models.Printing.PrintingMachine printing_machine
          annotation (Placement(transformation(extent={{-44,-50},{64,18}})));
        PNlib.Models.Printing.Start_Stop start_Stop(
            number_exemplars=30000)
          annotation (Placement(transformation(extent={{-36,34},{6,80}})));
        PNlib.Models.Printing.Maculation maculation(time_between_macus=9000,
            time_macu=1200)
          annotation (Placement(transformation(extent={{-28,-122},{56,-80}})));
        Counter maculation_(hmax=40000, text="maculation")
          annotation (Placement(transformation(extent={{62,-86},{108,-40}})));
        Counter exemplars_(
          color={0,255,0},
          text="exemplars",
          hmax=start_Stop.number_exemplars)
          annotation (Placement(transformation(extent={{50,16},{92,58}})));
        PNlib.Models.Printing.Role_change role_change(display_time=200)
          annotation (Placement(transformation(extent={{-120,-54},{-58,4}})));
        Counter orders_(
          color={0,255,0},
          hmax=25,
          text="orders")
          annotation (Placement(transformation(extent={{-82,52},{-46,88}})));
        Counter role_(
          hmax=20000,
          color={85,170,255},
          text="meters on role")
          annotation (Placement(transformation(extent={{-116,6},{-80,42}})));
        Counter paper_(
          hmax=60000,
          color={85,170,255},
          text=" paper")
          annotation (Placement(transformation(extent={{84,18},{126,60}})));
        Counter duration_(
          color={0,255,0},
          hmax=15000,
          text="duration")
          annotation (Placement(transformation(extent={{14,54},{48,88}})));
      equation
        when reStart then
          orders__=orders_.levelSensor_;
          exemplars__=exemplars_.levelSensor_;
          maculation__=maculation_.levelSensor_;
          paper__=paper_.levelSensor_;
          duration__=duration_.levelSensor_;
        end when;
        connect(maculation.macuBundle_, maculation_.levelSensor)
                                                             annotation (Line(
            points={{53.9,-101.42},{85,-101.42},{85,-79.1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(printing_machine.number_exemplars_, exemplars_.levelSensor)
                                                                       annotation (
            Line(
            points={{53.2,5.76},{71,5.76},{71,22.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(role_change.rolle_, printing_machine.drucken_) annotation (Line(
            points={{-64.82,-16.3},{-32.12,-16.3},{-32.12,-16}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(role_change.rollenwechsel_, maculation.ausschleussen_)   annotation (
            Line(
            points={{-64.82,-33.7},{-40,-34},{-40,-101},{-25.9,-101}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(maculation.makulatur_, printing_machine.maku_)
                                                           annotation (Line(
            points={{-2.8,-82.1},{-2.8,-49.184},{-3.5,-49.184}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(printing_machine.ausschleussen, maculation.buendelinMakuPresse_)
          annotation (Line(
            points={{29.98,-49.184},{30,-66},{30,-82.1},{30.8,-82.1}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(orders_.levelSensor, start_Stop.orders_)   annotation (Line(
            points={{-64,57.4},{-64,54.7},{-33.9,54.7}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(role_change.meter_role_, role_.levelSensor)       annotation (
            Line(
            points={{-98.3,-1.8},{-98.3,-4.5},{-98,-4.5},{-98,11.4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(start_Stop.rollen_wechsel_, role_change.start_)     annotation (
           Line(
            points={{-33.9,43.2},{-76.6,43.2},{-76.6,-1.8}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(printing_machine.papier_total_, paper_.levelSensor)
                                                                   annotation (Line(
            points={{53.2,-5.12},{105,-5.12},{105,24.3}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(start_Stop.time_counter_, duration_.levelSensor) annotation (Line(
            points={{3.9,54.7},{31,54.7},{31,59.1}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(printing_machine.exemplare_, start_Stop.exemplare_)
                                                                  annotation (Line(
            points={{-14.3,16.64},{-14.3,36.32},{-15,36.32},{-15,36.3}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-125,-125},
                  {125,125}}),
                            graphics={
              Rectangle(
                extent={{-124,126},{126,-126}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-110,120},{114,92}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-108,118},{-84,110}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Orders"),
              Text(
                extent={{-106,106},{-80,98}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=DynamicSelect("0",realString(orders__,1,0))),
              Text(
                extent={{-68,118},{-36,110}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Exemplars"),
              Text(
                extent={{-66,106},{-32,98}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=DynamicSelect("0",realString(exemplars__,1,0))),
              Text(
                extent={{-18,118},{14,110}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Maculation"),
              Text(
                extent={{-16,106},{16,98}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=DynamicSelect("0",realString(maculation__,1,0))),
              Text(
                extent={{36,118},{60,110}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Paper"),
              Text(
                extent={{38,106},{62,98}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=DynamicSelect("0",realString(paper__,1,0))),
              Text(
                extent={{78,118},{106,110}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="Duration"),
              Text(
                extent={{84,106},{108,98}},
                lineColor={0,0,255},
                lineThickness=0.5,
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString=DynamicSelect("0",realString(duration__,1,0)))}), Icon(coordinateSystem(preserveAspectRatio=true,
                extent={{-125,-125},{125,125}})),
          experiment(StopTime=32000),
          __Dymola_experimentSetupOutput);
      end Model;

      model Role_change "change of the paper role"
        import PNlib;
        parameter Real Role_length=20000 "length of paper on role in meters";
        parameter Real cutting_at=500 "length by which the rest is cut";
        parameter Real display_time=100 "for animation";

        TD new_role(
          nOut=2,
          delay=1,
          nIn=1,
          arcWeightIn={1},
          firingCon=pre(start),
          arcWeightOut={Role_length,1})
          annotation (Placement(transformation(extent={{-88,-20},{-68,0}})));
        TD cutting_rest(
          nIn=1,
          nOut=1,
          delay=2,
          firingCon=pre(start))
          annotation (Placement(transformation(extent={{-20,38},{0,58}})));
        PD P1(
          maxTokens=1,
          nIn=2,
          nOut=1) annotation (Placement(transformation(extent={{10,38},{30,58}})));
        TD       T1(
          nIn=2,
          nOut=1,
          firingCon=pre(start),
          arcWeightIn={1,Role.t})
                  annotation (Placement(transformation(extent={{42,38},{62,58}})));
        PNlib.PD P2(nIn=1, nOut=1,
          maxTokens=1)
          annotation (Placement(transformation(extent={{68,38},{88,58}})));
        IA       IA2(testValue=cutting_at)
                     annotation (Placement(transformation(
              extent={{-8.5,-2.50012},{8.5,2.50012}},
              rotation=90,
              origin={-32.5,38.5})));
        PNlib.PD Role_change(
          nIn=1,
          maxTokens=1,
          nOut=2)
          annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
        PC Role(
          nIn=1,
          nOut=3,
          minMarks=0,
          maxMarks=PNlib.Constants.inf,
          startMarks=0,
          reStart=reStart) "[m]"
          annotation (Placement(transformation(extent={{-56,-20},{-36,0}})));
        Interfaces.PlaceOut rollenwechsel_[2]
                                           annotation (Placement(transformation(
                extent={{100,-86},{116,-66}}),
                                             iconTransformation(extent={{68,-40},{88,-20}})));
        Interfaces.PlaceOut rolle_ annotation (Placement(transformation(extent={{100,-50},
                  {116,-30}}),
                             iconTransformation(extent={{68,20},{88,40}})));
                  Real fireAni[3];
      protected
        outer Boolean start;
        outer Boolean reStart;
      public
        Modelica.Blocks.Interfaces.RealOutput meter_role_  annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-46,20}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-30,80})));
        Interfaces.PlaceIn start_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={8,110}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={40,80})));
      equation
        fireAni=if (new_role.fireTime+display_time>=time and new_role.ani) then {255,255,0} else {255,255,255};
        connect(new_role.outPlaces[1], Role.inTransition[1])    annotation (Line(
            points={{-73.2,-10.5},{-73,-10.5},{-73,-10},{-56.8,-10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Role.outTransition[1], IA2.inPlace)  annotation (Line(
            points={{-35.2,-10.6667},{-30.7325,-10.6667},{-30.7325,20.9739}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(IA2.outTransition, cutting_rest.inPlaces[1])     annotation (Line(
            points={{-30.7325,40.6723},{-30.7325,48},{-14.8,48}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(cutting_rest.outPlaces[1], P1.inTransition[1])     annotation (Line(
            points={{-5.2,48},{2,48},{2,47.5},{9.2,47.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.outTransition[1], T1.inPlaces[1]) annotation (Line(
            points={{30.8,48},{40,48},{40,47.5},{47.2,47.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[1], P2.inTransition[1]) annotation (Line(
            points={{56.8,48},{67.2,48}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P2.outTransition[1], new_role.inPlaces[1])   annotation (Line(
            points={{88.8,48},{98,48},{98,72},{-96,72},{-96,-10},{-82.8,-10}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(new_role.outPlaces[2], Role_change.inTransition[1])     annotation (
            Line(
            points={{-73.2,-9.5},{-72,-10},{-68,-10},{-68,-80},{-10.8,-80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Role_change.outTransition[1], rollenwechsel_[1])   annotation (Line(
            points={{10.8,-80.5},{31.1,-80.5},{31.1,-81},{108,-81}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Role.outTransition[2], T1.inPlaces[2])  annotation (Line(
            points={{-35.2,-10},{40,-10},{40,48.5},{47.2,48.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Role.outTransition[3], rolle_)  annotation (Line(
            points={{-35.2,-9.33333},{40,-9.33333},{40,-40},{108,-40}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Role.pc_t, meter_role_)   annotation (Line(
            points={{-46,0.8},{-46,20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(P1.inTransition[2], start_) annotation (Line(
            points={{9.2,48.5},{8,48.5},{8,110}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Role_change.outTransition[2], rollenwechsel_[2])
        annotation (Diagram(graphics), Icon(graphics={Rectangle(
                extent={{-72,70},{68,-74}},
                lineColor={0,0,0},
                fillColor=DynamicSelect({255,255,255},fireAni),
                fillPattern=FillPattern.Solid),       Bitmap(
                extent={{-84,58},{82,-62}},
                imageSource="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",
                fileName="modelica://PNlib/../../../Ausarbeitungen/Prozessmodellierung/Mohn Media/Modell/rollenwechsel.jpg")}));
        annotation (Diagram(graphics));
      end Role_change;

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
       PD  Start(nIn=1, nOut=1,
          maxTokens=1,
          startTokens=0)        annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-80,0})));
        TD starting(
          nOut=2,
          nIn=1,
          delay=setupTime)            annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-50,0})));
        PD Stop(
          nIn=1,
          maxTokens=1,
          nOut=1,
          startTokens=0)        annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={36,0})));
        PD Counter_Orders(nIn=1)    annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-32,34})));
        TD stopping(
          nIn=2,
          nOut=1,
          arcWeightIn={1,1})      annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={60,0})));
        TA TA5(testValue=number_exemplars)
               annotation (Placement(transformation(
              extent={{-11,-3.99998},{11,3.99998}},
              rotation=90,
              origin={78,-29})));
        Interfaces.TransitionIn exemplare_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={80,-108}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={0,-90})));
        Boolean start=Start.t>0;
        Real color[3]=if start then {0,255,0} else {255,0,0};
        Modelica.Blocks.Interfaces.RealOutput orders_    annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-54,48}),iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-90,-10})));
        Interfaces.TransitionOut rollen_wechsel_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-84,-40}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-90,-60})));
        Modelica.Blocks.Interfaces.RealOutput time_counter_ annotation (Placement(
              transformation(extent={{62,74},{82,94}}), iconTransformation(extent={{80,-20},
                  {100,0}})));
        PNlib.TD shutDown(
          nIn=1,
          nOut=2,
          delay=timeStopping)
                  annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={8,0})));
        PNlib.PD Stop2(
          nIn=1,
          nOut=1,
          startTokens=1,
          maxTokens=1)                 annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-24,0})));
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
        connect(TA5.inPlace, exemplare_) annotation (Line(
            points={{79.3839,-52.5844},{79.3839,-52.987},{80,-52.987},{80,-108}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TA5.outTransition, stopping.inPlaces[1])
                                                        annotation (Line(
            points={{79.3839,-27.0923},{79.3839,0.5},{64.8,0.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(stopping.outPlaces[1], Stop.inTransition[1]) annotation (Line(
            points={{55.2,5.55112e-016},{46.8,-1.38778e-015}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(starting.outPlaces[1], Start.inTransition[1])
                                                             annotation (Line(
            points={{-54.8,0.5},{-69.2,-1.38778e-015}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Start.outTransition[1], stopping.inPlaces[2])
                                                             annotation (Line(
            points={{-90.8,1.38778e-015},{-94,1.38778e-015},{-94,66},{80,66},{
                80,-0.5},{64.8,-0.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Counter_Orders.pd_t, orders_)       annotation (Line(
            points={{-32,23.4},{-32,20},{-54,20},{-54,48}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(starting.outPlaces[2], rollen_wechsel_)
                                                       annotation (Line(
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
        connect(Stop.outTransition[1], shutDown.inPlaces[1])        annotation (Line(
            points={{25.2,1.38778e-015},{12.8,-5.55112e-016}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(shutDown.outPlaces[1], Stop2.inTransition[1])        annotation (Line(
            points={{3.2,0.5},{-13.2,-1.38778e-015}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Stop2.outTransition[1], starting.inPlaces[1]) annotation (Line(
            points={{-34.8,1.38778e-015},{-44.4,1.38778e-015},{-44.4,
                -5.55112e-016},{-45.2,-5.55112e-016}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(shutDown.outPlaces[2], Counter_Orders.inTransition[1])
          annotation (Line(
            points={{3.2,-0.5},{-4,-0.5},{-4,34},{-21.2,34}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics), Icon(graphics={Rectangle(
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

      model Maculation "maculation of the printing process"
       parameter Real time_between_macus=18000
          "expected time between two maculations";
       parameter Real time_channel_out=1000
          "Time from pressing the button to the first channel out";
       parameter Real time_macu=600
          "expected time of the maculation (button press)";
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
          annotation (Placement(transformation(extent={{-66,-6},{-46,14}})));
        TD channelOut(
          nIn=2,
          arcWeightOut={2},
          nOut=1,
          delay=1)
          annotation (Placement(transformation(extent={{-64,-64},{-44,-44}})));
        PD start_channelOut(
          nIn=1,
          nOut=1,
          maxTokens=1)
          annotation (Placement(transformation(extent={{-128,-64},{-108,-44}})));
        TS       pressing_button(nOut=1,
          firingCon=start,
          nIn=1,
          h=1/time_between_macus)
          annotation (Placement(transformation(extent={{-190,-64},{-170,-44}})));
        PD bundle_channelOut(
          nOut=4,
          nIn=2,
          maxTokens=2)
          annotation (Placement(transformation(extent={{4,-28},{24,-8}})));
        TS Stop_macu(
          nIn=1,
          nOut=1,
          h=h,
          arcWeightIn={pre(bundle_channelOut.t)})
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=90,
              origin={56,8})));
        PD bundle_not_channelOut(
          startTokens=1,
          maxTokens=1,
          nOut=3,
          nIn=2) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=180,
              origin={-14,36})));
        TA       TA4(testValue=0)
                     annotation (Placement(transformation(extent={{-10.0003,-3.5},{10.0001,
                  3.50001}},
              rotation=90,
              origin={-54.0001,84.5})));
        TA       TA3(testValue=0)
                     annotation (Placement(transformation(extent={{-12.0001,
                  -3.99999},{11.9999,4}},
              rotation=0,
              origin={102,-18})));
        TC Macu_press(
          nIn=2,
          nOut=1,
          maximumSpeed=speed,
          arcWeightIn={0,1})
          annotation (Placement(transformation(extent={{128,-28},{148,-8}})));
        PC Bundle_in_macu_press(nIn=1, reStart=reStart)
          annotation (Placement(transformation(extent={{172,-28},{192,-8}})));
        Interfaces.TransitionIn ausschleussen_[2]
          annotation (Placement(transformation(extent={{-198,-6},{-178,14}}),
              iconTransformation(extent={{-200,-10},{-180,10}})));
        Interfaces.PlaceOut makulatur_ annotation (Placement(transformation(
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
        Interfaces.TransitionIn buendelinMakuPresse_ annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={120,108}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,90})));
        Modelica.Blocks.Interfaces.RealOutput macuBundle_  annotation (Placement(
              transformation(extent={{172,2},{192,22}}), iconTransformation(extent={{180,
                  -12},{200,8}})));
        TD T1(
          nIn=2,
          nOut=2,
          arcWeightIn={pre(bundle_channelOut.t),1})
          annotation (Placement(transformation(extent={{-154,46},{-134,66}})));
        TD T2(nIn=1, nOut=1)
          annotation (Placement(transformation(extent={{-154,-6},{-134,14}})));
        PD P1(nIn=2, nOut=1)
          annotation (Placement(transformation(extent={{-110,-6},{-90,14}})));
        IA IA1(testValue=1)
               annotation (Placement(transformation(
              extent={{-11,-3.99999},{11.0001,3.99999}},
              rotation=180,
              origin={-75,-76})));
      equation
        connect(pressing_button.outPlaces[1], start_channelOut.inTransition[1])
          annotation (Line(
            points={{-175.2,-54},{-128.8,-54}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(start_channelOut.outTransition[1], channelOut.inPlaces[1])
          annotation (Line(
            points={{-107.2,-54},{-58.8,-54.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_channelOut.outTransition[1], Stop_macu.inPlaces[1])
          annotation (Line(
            points={{24.8,-18.75},{56,-18.75},{56,3.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Stop_macu.outPlaces[1], bundle_not_channelOut.inTransition[1])
          annotation (Line(
            points={{56,12.8},{56,36.5},{-3.2,36.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_not_channelOut.outTransition[1], channelOut1.inPlaces[1])
              annotation (Line(
            points={{-24.8,36.6667},{-66,36.6667},{-66,36},{-76,36},{-76,3.5},{
                -60.8,3.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_not_channelOut.outTransition[2], channelOut.inPlaces[2])
          annotation (Line(
            points={{-24.8,36},{-84,36},{-84,-53.5},{-58.8,-53.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_not_channelOut.outTransition[3], TA4.inPlace)
          annotation (Line(
            points={{-24.8,35.3333},{-52,35.3333},{-52,63.2203},{-52.5808,
                63.2203}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(TA4.outTransition, makulatur_) annotation (Line(
            points={{-52.5808,86.3954},{-52.5808,91.1977},{-52,91.1977},{-52,
                110}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_channelOut.outTransition[2], TA3.inPlace)     annotation (Line(
            points={{24.8,-18.25},{60,-18.25},{60,-18},{88.0951,-18}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(TA3.outTransition, Macu_press.inPlaces[1])  annotation (Line(
            points={{115.905,-18},{115.794,-18},{115.794,-18.5},{133.2,-18.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Macu_press.outPlaces[1], Bundle_in_macu_press.inTransition[1])
          annotation (Line(
            points={{142.8,-18},{171.2,-18}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Macu_press.inPlaces[2], buendelinMakuPresse_)  annotation (Line(
            points={{133.2,-17.5},{120,-17.5},{120,108}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Bundle_in_macu_press.pc_t, macuBundle_)    annotation (Line(
            points={{182,-7.2},{182,12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(channelOut1.outPlaces[1], bundle_channelOut.inTransition[1])
          annotation (Line(
            points={{-51.2,4},{-24,4},{-24,-18.5},{3.2,-18.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(channelOut.outPlaces[1], bundle_channelOut.inTransition[2])
          annotation (Line(
            points={{-49.2,-54},{-24,-54},{-24,-18},{-10,-18},{-10,-17.5},{3.2,
                -17.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_channelOut.outTransition[3], T1.inPlaces[1])     annotation (
            Line(
            points={{24.8,-17.75},{72,-18},{72,94},{-172,94},{-172,55.5},{
                -148.8,55.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[1], bundle_not_channelOut.inTransition[2])
          annotation (Line(
            points={{-139.2,55.5},{-58,56},{28,56},{28,35.5},{-3.2,35.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ausschleussen_[1], T1.inPlaces[2]) annotation (Line(
            points={{-188,-1},{-192,4},{-172,4},{-172,56.5},{-148.8,56.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(ausschleussen_[2], T2.inPlaces[1]) annotation (Line(
            points={{-188,9},{-192,10},{-194,6},{-194,4},{-148.8,4}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T2.outPlaces[1], P1.inTransition[1]) annotation (Line(
            points={{-139.2,4},{-110.8,4},{-110.8,3.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.outTransition[1], channelOut1.inPlaces[2])    annotation (Line(
            points={{-89.2,4},{-60.8,4.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[2], P1.inTransition[2]) annotation (Line(
            points={{-139.2,56.5},{-120,56.5},{-120,4.5},{-110.8,4.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_channelOut.outTransition[4], IA1.inPlace)
          annotation (Line(
            points={{24.8,-17.25},{38,-17.25},{38,-84},{-50.0317,-84},{-50.0317,
                -85.4545}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(IA1.outTransition,pressing_button. inPlaces[1]) annotation (
            Line(
            points={{-75.5239,-85.4545},{-196,-85.4545},{-196,-54},{-184.8,-54}},
            color={0,0,0},
            smooth=Smooth.None));

        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-100},
                  {200,100}}), graphics), Icon(coordinateSystem(preserveAspectRatio=true,
                extent={{-200,-100},{200,100}}), graphics={
              Rectangle(
                extent={{-180,80},{180,-80}},
                lineColor={0,0,0},
                fillColor=DynamicSelect({0,255,0},color),
                fillPattern=FillPattern.Solid),
              Bitmap(
                extent={{-168,58},{-72,-46}},
                imageSource="/9j/4AAQSkZJRgABAQEAlgCWAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMgIyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAEQASYDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDxmiitXR9GXVI5WaYx7CBwuc1rRozrTUKauyKlSNOPNLYyqK6b/hEU/wCftv8Avj/69H/CIp/z9t/3x/8AXrt/snF/y/iv8zm+v4f+b8GczRXTf8Iin/P23/fH/wBepvEHg2DQ9Gjv1uZZ97qpTaFxkE5zz6VxYyjPBuCrq3Nouv5HRQqxxF3T1tucnRXdfDjwDZeOjqImu57Q2nlkbQr7t276Yxt/Wuk1v4K2WlRwvHqtzIHJB3RqMVy1a0aUHOeyNoQc3yrc8hor0f8A4Vfa/wDQQn/74FH/AAq+1/6CE/8A3wK4/wC1sJ/N+D/yN/qlXsecUV6P/wAKvtf+ghP/AN8Cj/hV9r/0EJ/++BR/a2E/m/B/5B9Uq9jziivR/wDhV9r/ANBCf/vgUf8ACr7X/oIT/wDfAo/tbCfzfg/8g+qVex5xRXo//Cr7X/oIT/8AfAo/4Vfa/wDQQn/74FH9rYT+b8H/AJB9Uq9jziivR/8AhV9r/wBBCf8A74FH/Cr7X/oIT/8AfAo/tbCfzfg/8g+qVex5xRXo/wDwq+1/6CE//fAo/wCFX2v/AEEJ/wDvgUf2thP5vwf+QfVKvY84or0f/hV9r/0EJ/8AvgUf8Kvtf+ghP/3wKP7Wwn834P8AyD6pV7HnFFej/wDCr7X/AKCE/wD3wKP+FX2v/QQn/wC+BR/a2E/m/B/5B9Uq9jziivR/+FX2v/QQn/74FH/Cr7X/AKCE/wD3wKP7Wwn834P/ACD6pV7HnFFej/8ACr7X/oIT/wDfAri9d06DRtZuLFTJKISBvLAZyoPTHvW1DHUMRLlpu79GZ1KE6avJGZRXa3HgGGLS4Ltb6TMoU7TGOMjPrVD/AIRFP+ftv++P/r16eDw1TG0/a0FeN7dtvU5K+Ip4efJUdmczRXTf8Iin/P23/fH/ANej/hEU/wCftv8Avj/69dX9k4v+X8V/mY/X8P8AzfgzmaK6b/hEU/5+2/74/wDr0f8ACIp/z9t/3x/9ej+ycX/L+K/zD6/h/wCb8GczRXTf8Iin/P23/fH/ANesnWNMGlzxxrKZN67skYxzWVbL8RQhz1I2Xqi6eLpVZcsHqZ9FFFcR0hXT+Ev9Rc/7w/lXMV0/hL/UXP8AvD+VenlH+9x+f5HFmH8B/L8zoaKkgt5bmTZDGzt6AUT201s+2eNkY9M96+w5lex86R1d8VxfavALsOTGsbfkwB/TNUq2reH+0vC93ZjlmjeMfUjI/U18nxfC2GpV19ia+5/0j3Mil++nT/miyl8ArsR+I9TtCeZrUSD/AICwH/s9eveKYTJpG8D/AFThj9On9a+fPhTqP9mfEXTC77EnZrd899ykKP8AvrbX0reW4urKaA/8tEKj2PavAxNL2tKcO6PXpy5ZqR51RSspVirDBBwRSV8Me6FFFFABRUsFtJceZ5YyI0MjewFRU2mlcL9AooopAFFFFABRRRQAUUUUAFFFFABRRRQAV4743/5HC/8Aqn/oC17FXjvjf/kcL/6p/wCgLXs5H/Hl6fqjjx38Nep6He/8izY/7kf/AKBWNWze/wDIs2P+5H/6BWNX6Jwj/wAi/wD7ekfKZ5/vXyQUVPZWjXt0kKEDPUnsK0b/AED7LatNFKX2csCMcV9JKrCMlFvVnjXMeiiitACuV8Wf8fkH/XP+tdVXK+LP+PyD/rn/AFry84/3V/L8zuy/+OvmYNFFFfHn0IV0/hL/AFFz/vD+VcxXT+Ev9Rc/7w/lXp5R/vcfn+RxZh/Afy/M7zw5cQxGaORlV2wQTxkU/wAR3ELxRRIytIGycHOBisGivqfq69r7S585bW4Vr+Hp9lzJCejrkfUf/rrIqW1nNtdRyj+Fsn3HeubNsH9dwVSgt2tPVar8TswVf6viIVOz/Dqcb4ht5dC8Wzm3JjaOYTwsP4cncMfQ/wAq+o9E1SLW9EstSgx5d1CsoGfukjkfUHI/CvBPiRpXn2ttq0A3BAI5CP7p5U/mSPxFdV8CvFKy2Vx4duZMSwkz2oPdD99R9Dz/AMCPpXwGCre1oxk91o/VH1VeHLNpbHU+JLE2mpNIo/dz/OPr3H9fxrJrv9W05dSsWiOA4+ZG9DXBzQyW8zRTKUdTgg187mmEdCs5pe7L+rHpYWtzws90MrK1/W49EtoJHwWmnSMA+hPzH8Bn9K1a8o+IOr/2hr32aNsw2Y8v6ufvf0H4Vjl+G+s1lF7LVlYir7OF1ufQnhrTgNLlklHNyCv/AAHp/jXKSIY5GRuGUkGu08Lagmq+FdLvYwoE1tGxVeinaMj8DkVzniG2+zaxNgfLJ+8H49f1zXoZnhFSw1Pl+zp9/wDwTnwtbnqSv1MyiiivCO8KKKoeD9TXxNq13bLgrDd+WMd4wOv44ataVGdX4V2/HREymo7mrdWj2jxrJ1eNZB9DUNdN4vtvkt7hRwMxn+Y/rXM1pjKH1es6a2Io1PaQUgooormNQooooAKKKKACvHfG/wDyOF/9U/8AQFr2KvHfG/8AyOF/9U/9AWvZyP8Ajy9P1Rx47+GvU9Dvf+RZsf8Acj/9ArGrZvf+RZsf9yP/ANArGr9E4R/5F/8A29I+Uzz/AHr5InsrtrK6SZRuxwQe4rSv9fFzatDDEV3jDFj2rGor6OVKEpKTWqPGsFFFFagFcr4s/wCPyD/rn/WuqrlfFn/H5B/1z/rXl5x/ur+X5ndl/wDHXzMGiiivjz6EK6fwl/qLn/eH8q5iun8Jf6i5/wB4fyr08o/3uPz/ACOLMP4D+X5nQ0UUV9ifOhRRRQBt6a8OpadNpt2NyshXB7qf6ivNpU1DwT4pjlgcpc2sgkhkxw69vwIyCPqK7CGV4JVkjOGU5BrV1LTbHxfpgjkIjuYxlHHLRn+oNfn+d4GWW4mWLgr0p/Fb7Mu/o/66H1GW4pYqkqEn78dvNf8AAPSPBfjjTvGWmJLbSJHeqv8ApFqW+aM9yPVfQ/14rZv9KtdRA+0R/MOjrww/Gvlq90HW/Dd4JVjnjKH5Lm2Jx9Qw5H44p7eMvFN4i2/9t6rIAMbVuHyfrg5P41yXpV4dJROr3oS7M9Z+IWs6N4Q0+W3trqS41eVdsUIZT5Wf4344x2Hf6ZNeGGOaWOScq7IGAeTGQCc4yfU4NdBpXgjV9WlElxG1rExy0k+Qx9cL1J+uK71/DFiPDNxo1ptyVyWY/MZOoZvxA/CvPlicLg3y0l2vbovM6VSq1tZv0N74Ga4t94Tm0t2HnafMSq/9M3ywP/fW/wDSuz8S6cbyyE0YzLBk4Hde/wDjXzn4L8SXHgbxfHdTI4jUmC7ixyUJ5/EEAj6V9QWl3BfWkV1ayrLBMgeN1OQynkGvQrUo16bpy2ZzQm6clJdDzmiun1bww0krTWG35uTETjn2/wAKxTo2oK2DaS59lzXyFbA16MuVxb80ezCvTmrpnPeJNTGk6Bd3QbEgTbH/ALx4H+P4VznwM1GO18azWkpA+12zCPPd1Ib/ANB31lfEfW/tOpDSomBjtGPm4IIMnTH4cj6k+lc3oup3Ph3XrLUYkZZraRZQrcbl64+hU/ka+hyvDOjQvNay1+7Y87FVeeemyPq7WLM32lzRKMvjcv1HP/1q4GvRNPvoNT0+3vbRw8FxGskbDuCMiuV8RaS1pctcxKTBKcnA+4fSubOsK5JV49NGaYKrZuDMWiiivnD0gq5Dpc0unzXjDZDGOCR985xxXHweLYb7xtpejWO2SCS6VLiXswzyq/1P5V69rqqmg3CooVQoAAGAORXr0Msk6Uq1XSybS+XU5KmKXOoQ7nC0UUV5B1hXjvjf/kcL/wCqf+gLXsVeO+N/+Rwv/qn/AKAtezkf8eXp+qOPHfw16nod7/yLNj/uR/8AoFY1bN7/AMizY/7kf/oFY1fonCP/ACL/APt6R8pnn+9fJBRRRX1B4wVMtncND5qwSGPruCnFQ128VxA1qssbqIgvBzgAVz16zpWsr3E3Y4iuV8Wf8fkH/XP+tddcsj3UrRDCFyV+ma5HxZ/x+Qf9c/61xZu74R/I78v/AI6+Zg0UUV8gfQhXT+Ev9Rc/7w/lXMV0/hL/AFFz/vD+VenlH+9x+f5HFmH8B/L8zoalgtZrknyYnfHXaOlRV0/h+aI6eI1IEisSw7/Wvq69R04cyR863Y5l43icpIpVh1BGCKStXxDLFLfKIiGZVwxHr6VlVdOTnFSaBBTo5HicPGxVh0INNopyipJxkrpjTad0a8HiGVFAniWT/aBwanPiOPHywOT7sKwaK8CrwtlVSfO6VvRtL7k/yPThnOMhHlU/vSZp3GvXMwKxhYge45P51X0++azu/MYllbhx6iqlFd8MowVOhLDwppRkrPz+e/oc0sdiJVFVlNtrYXxn4U/tZP7V0pQ85XMiL/y1HqPcenf+eP4N+JWseC82yAXVhuy1rMSNh77D/CfwI9q6TT9UlsTtxviPVSen0qe/0bQPEZ8yZRHcN1dDsf8AHsf1r4bE4LF5S3CpFzpdJLVpdn2/qx9LQxVHGrmi1GfVP9Dch+PuiNGDPpeoo/dU2MPzLD+Vcx4t+N1/q1rJZ6FbNp8MgKtOz5mI9scJ355PoRVY/DCyJJW/uAO2VU1atvBXh/SiJLp2uHXnEzgj/vkdfxzXJHMqNR8tJOT7JanQ8NOKvNpLu2cr4Q8JS61dLdXaMtghySePNPoPb1Nb3xC8PfaLZNVs0BMKhJVUdU7H8P5fSte91nfH5FkvlRAYyBg49AOwo0nU1gH2a5wYW6E9F9j7V2VMmzN0vrzVnHaHXl6/Py/XQ5o5jhOf6uno/tdL9PkVfhP8SodCUaHrcuywds2856QMTkhv9knnPYk54PHuqtFdQBlKSwyLkEEMrA/zFfOXiT4fyCR7vRAHjb5jb5wV/wB31Ht/OufsvEPiPwufs9rfX9iAf9SWYL/3yeP0qKGJpYiN4P5dTWpSlTfvH0ZrWkaNptpLfXt2LG3TlmZxtHsM859hXinjL4gRX6yaf4eSWGzOVkuZeJZh6AD7q/qe+ORXNz3Wv+ML1TcTXmozA8b2LKn07KPyrsvDfw+is2W51cpPMOVhHKL9fU/p9a46/wBSwj9pKK5uyNqft6q5U9Dl/h7/AMlA0T/r7SvpnX/+QJc/7o/mK+Zvh7/yUDRP+vtK+mdf/wCQJc/7o/mK7cV/Bn6P8mYUvjj6nCUUUV8Me6FeO+N/+Rwv/qn/AKAtexV4743/AORwv/qn/oC17OR/x5en6o48d/DXqeh3v/Is2P8AuR/+gVjVs3v/ACLNj/uR/wDoFY1fonCP/Iv/AO3pHymef718kFFOiieaVY41LOxwAKtXWlXVnF5ksY2dyDnFfTOcU7NnjFOiiiqAK5XxZ/x+Qf8AXP8ArXVVyviz/j8g/wCuf9a8vOP91fy/M7sv/jr5mDRRRXx59CFdP4S/1Fz/ALw/lXMV0/hL/UXP+8P5V6eUf73H5/kcWYfwH8vzOhooor7E+dCiiigAooooAKKKKACiry6NetB5oh4IyBkZx9Ko9DzUxlGWzAKKKKoAooooAKKKKALdpqlzZgKjbk/utyP/AK1aS+IIpFxPbE/Qgj9awqK8bGZBl+Mlz1afvd1dP8N/md9DM8VQXLCenZ6m3J4hVU221vj03cAfgKtaLdy3cczzNuIYY9BXNVv+HP8Aj3m/3h/Kvns/yXBYDK6kqFO0rrV6vddX+h6mWZhiMTjIqpLTXTZbHnXw9/5KBon/AF9pX0zr/wDyBLn/AHR/MV8zfD3/AJKBon/X2lfTOv8A/IEuf90fzFebiv4M/R/kz0KXxx9ThKKKK+GPdCvHfG//ACOF/wDVP/QFr2KvHfG//I4X/wBU/wDQFr2cj/jy9P1Rx47+GvU9Dvf+RZsf9yP/ANArGrZvf+RZsf8Acj/9ArGr9E4R/wCRf/29I+Uzz/evki5pV0lpqCSS/c5BPpnvW1qmqWpsJI45FkeRcALzj3NczRX0M6EZzU30PGsFFFFbgFcr4s/4/IP+uf8AWuqrlfFn/H5B/wBc/wCteXnH+6v5fmd2X/x18zBooor48+hCun8Jf6i5/wB4fyrmK6fwl/qLn/eH8q9PKP8Ae4/P8jizD+A/l+Z0NFFFfYnzoVf0awS+umWUnYi5IHeqFTWl3LZTiWEgHGCD0IqKik4tR3BmvrGkW9vZme3UoVIyMkg5+tYVXb7Vri/jCSbVQHO1R1qlUUIzjG03qCClU7WBxnBzikorYDsF1ezaDzfPQDGdpPzflXJXEgmuZZFGA7lgPTJplFYUqEaTbQJWCigAkgAZJ6AUrKVYhgQR2IrYYlFFFMRv6DYW8tq00sayMWK4YZA/CqmvWcNrcxmFQodclR0FU7W/uLInyJCobqMZBqOe4lupTJM5dzxk1zRpTVVzb0FbUjooorpGFb/hz/j3m/3h/KsCt/w5/wAe83+8P5V8zxd/yKp+sfzR6+R/77H5/kedfD3/AJKBon/X2lfTOv8A/IEuf90fzFfM3w9/5KBon/X2lfTOv/8AIEuf90fzFfM4r+DP0f5M9yl8cfU4Siiivhj3Qrx3xv8A8jhf/VP/AEBa9irx3xv/AMjhf/VP/QFr2cj/AI8vT9UceO/hr1PQ73/kWbH/AHI//QKxq2b3/kWbH/cj/wDQKxq/ROEf+Rf/ANvSPlM8/wB6+SCiiivqDxgoorZTw3M0AdplWQjOwr0/Gs51Iw+Jhcxq5XxZ/wAfkH/XP+tdW6NHIyOMMpII9DXKeLP+PyD/AK5/1rz83/3R/L8zuy/+OvmYNFFFfHn0IV0/hL/UXP8AvD+VcxXT+Ev9Rc/7w/lXp5R/vcfn+RxZh/Afy/M6Giiuk0Gzt2sBK0avI5IJYZx7V9ZVqqlHmZ863Y5uitTX7aK3vE8lQu9clR0FZdVCanFSQBRRRVgFFFFABRRRQB3XwvtbaW9vZ5FVriJVEeRyoOckfkB/+uuo8ZeHE1zSXeGMfbYBuiYDlvVfx/nXl2gaxJoWrw3keSqnbIo/jQ9R/nuBXt1vcRXdtHPA4eKRQysO4NfMZoquHxSxEXvt8uh7eBcKtB0n/XmeAEYOD1orrviD4f8A7M1T7dbpi2uzk46JJ3H49fzrka+hw9eNemqkep5NWm6U3CXQKKKK2MgooooAK3/Dn/HvN/vD+VYFb/hw/uJx/tD+VfNcXf8AIqqesfzR6+Sf77H5/kedfD3/AJKBon/X2lfTWvDOiXIH90H9RXzH4Ff7N4/0Td/z/RJ+bAf1r6g1Zd+k3Y/6ZMfyGa+ZxCvSmvJ/ke3Tdpr1PP6KKK+FPeCvHPGxz4vv8f3l/wDQFr2OvGPF7bvFeoH/AKa4/ICvZyNfv5Py/VHFjvgXqek3vHhqxB67Y/8A0CsWtzVh5ei2kZ6jaPyWsOv0ThFf8J1+8pfmfKZ5/vdvJBRRRX1B44V0ieJIPs4Mkb+aByoHBP1rm6KyqUY1LcwNXHzSmed5W6uxY4965LxZ/wAfkH/XP+tdVXK+LP8Aj8g/65/1rgzdWwjXp+Z3Zf8Ax18zBooor48+hCun8Jf6i5/3h/KuYrp/CX+ouf8AeH8q9PKP97j8/wAjizD+A/l+Z0NT219cWeRBKUB6jgj9agor7BpNWZ86PmmknkMkrl3PUmmUUUJW0QBRRRTAKKKKACiiigAr0P4beIMhtHuX5GXtyf8Ax5f6/nXnlS2tzLZ3UVxbuUliYOrDsRXLi8MsTSdN/L1N8PWdGopo9x1nSodZ0qeyn+7Ivyt/dbsfzrw+9tJrC8mtbhdssTFWHvXt2havFrmkw3sWAXGHX+4w6iuS+JOgCSBdYt1+ePCTgd16Bvw6fiPSvByrEyw9Z4eppf8AB/8ABPVx9FVaaqw6fkecUUUV9QeGdVDoVmtsqvHvcjl8nOa5q6h+z3UsQOQjFc+tXItdvIbcRAocDAZhkis9mLsWYksTkk965qMKkW3N3EriVt+G25uF/wB0/wA6xK1PD8my/ZD/ABoR+I5/xry+JaTq5XWiuyf3NP8AQ9PKZ8mMpt97ferHnumONO8dWjscLb6khOe22Uf4V9XzR+bBJGejqV/MV8o+MrU2fiu+AGA7+ap9dwz/ADJr6i0LU01nQbHUYyCtzAkvHYkcj8DkV8lRkqlOMu6R9BNcsmuzODZSjFWGCDgikrX8R6e1pqLSqP3U53A+h7j/AD61kV8TXpSo1HTl0PchNTipIK8S1POoeKLoDnzrtlH4vgV7HqV2LDTLm6bGIYmfnuQOBXkXhO2a/wDFdirfNiXzWJ/2fm/pXr5P7kKtZ9F/wTjxnvOMD0zxG2IoE9ST+WP8awq1fEMu+8SMdET9T/kVlV+lcMUXSyuknu7v722vwPkM3qKeMm100+5EltbyXU6wxDLN69qv3uhzWduZt6yKv3sDBFVdOu/sN4kxXcoyCB1wa1tR12CazeKAMWkGCWGABXrVJVVUSitDy3e5gUUUV0jCuV8Wf8fkH/XP+tdVXK+LP+PyD/rn/WvLzj/dX8vzO7L/AOOvmYNFFFfHn0IV0/hL/UXP+8P5VzFdP4S/1Fz/ALw/lXp5R/vcfn+RxZh/Afy/M6GiiivsT50KK1NM0U30Jmkk2JnAAGSarajYNp9wIy25WGVbGM1mqsHLkT1C5UooorQDc8HaNBrmvpb3RPkIhkdQcFwMcfmfyr0bUvA2jX9p5UVstrIB8ksIwR9R3/GvJdP1C40u9ju7OQxzRnIP9D7V6h4c8e2erbLe+22t2eBk/u3Psex9j+teFmkMUpqtSbsu3T5HqYGVBxdOotX3OA17wtqHh+Qm4j8y3Jws6DKn6+h9jWNX0DJGk0bRyorowwysMgj3FcJ4j+HKSb7nRCEfqbZjwf8AdPb6H9KMHnMZ+5X0ffp/wAxOXOPvUtV2POaKkuLaa0neC5ieKVDhkcYIqOvcTTV0eY1bRnS+DPFA8P3skd1vNlP98LyUYdGA/Q//AFq6Txd410u50Kaz0+b7RLcAKSEZQg7k5A59q82orhq5fRqVlXe6/E6YYupCm6S2Ciiiu85QooooAKltJzbXUco/hbJ+neoqKzq041YOnPZqz+ZUJOElKO6IPiTpJlittWgXcqjy5SPQ8qf1I/EV0fwY8eW1taf8I5qs6Q4ctZySMAp3HJjz2OSSPXJHpmPTLuG6tW06+VXjcFQG6EHtXHa98P72xlaXS1a6tjyFH+sT2x3/AA/KvzHklltV4LEu1vhfRrp/XyPs4zWLgq9LruuzPpie3iuojHPGsiHsRWRL4TsXbKPNH7BgR+or5rg8SeJ9DCwx6nqloqDaImldVUegU8CnT+LfFGrJ5Eur6nOh4Mayths9iB1rWrQo1takUyYVJw0i7HZ/FjWtLtoxoWk3L3E4cNdSBgUQDonHU5wT6Yx16Z3w20gotxq042qQYoie46sf0A/OsvQfAN/qMqyaij2dt1IYYkb2A7fU/rXa6ldwWlounWKqsaKEO3ooHauanh1i5rAYNbv3mtkur/r0NKlb2EXiK/TZd2Zl5P8AabuWXszcfTtUNFFfqVKlGlTjThskkvRHxc5ucnOW7CiiitCAooooAK5XxZ/x+Qf9c/611Vcr4s/4/IP+uf8AWvLzj/dX8vzO7L/46+Zg0UUV8efQhXT+Ev8AUXP+8P5VzFdP4S/1Fz/vD+VenlH+9x+f5HFmH8B/L8zoaKKK+xPnTV0vWhYwGGWMsgOVK9RVXUtQOoXAfbtVRhRmqlFZKlBS50tQsFFFFagFFFFAHU+HPHd7o2yC73XVmONpPzoP9k/0P6V6bpWsWWtWonsZlkX+JejIfQjtXhNWLG/udNuluLKZ4ZV6Mp/Q+o9q8nGZVTr+9D3Zfgzvw2PnS92WqPaNa8PWGvQbLyL5wMJKvDp9D/Q8V5d4i8H33h8tKR59nnAmQdP94dv5V2Phz4h219st9W221weBKOI3+v8AdP6Vu+JL+ytfD9213JH5csLKq5GZCRwB615WHq4vA1VRkrp9P8jvrU6GKg6ievf/ADPEqKKK+rPBCiirttpN3cgFY9in+J+K58TiqGFhz15qK83Y1pUalaXLTi2/IpUVuLoMMKb7u5wo6kYUD8TVaTUfC9iSJb23dh1w5k/Rc18/V4twEXaipT/wx/zsepDI8S9Z2j6v/K5mUAEnAGTVt/G/hq3/ANSGfH/PO3x/PFV3+JumpxDZXTD/AGgq/wBTXHLiys/4eFfzdv0OhZHBfFWXyV/1AQyEZEbkf7prQtNQ1C3UKI3lQdmUnH41jyfFKIZ8vS3b/emA/wDZTUTfFJiPk0oA+9xn/wBlrjxWdYjGQ5K2DjJecl/X3G9HLadCXNTrtPyR1q6zJj57CcH2BP8ASmvrpVcrZy/8COP6VyS/FKXI3aWhHoJyP/Zak/4Wn/1Cf/Jn/wCwrxFQoqV3gv8Ayo/8z0HKrayxH/kqNi71m6nBT/VKey9T+NZ9Nj+KFo3EunTKP9lw3+FTr8QdBmOJbS4XPUvChH6GveweffUoezp4LlX92Sf6a/eebXyx15c08Rd+a/4JFRV6PxD4UvMDz442PZkePH44xV2LT9KvxmxvEf8A65yq4r0ocXYT/l9TnD1Wn4P9DklkVf7Eoy+ZiUVqz+H7iPJhdZR6fdNZssMkD7ZUZG9CMV7mDzPCY1f7PUUvLr9z1PNr4Ovh/wCLFr8vvGV10ejWS24jMKtxguep981yNXk1q9jgESy8AYBIGQPrW9enOduR2OVoq3MQhuZYgchHKg+uDXI+LP8Aj8g/65/1rqiSSSTkmuV8Wf8AH5B/1z/rXFm/+6P5Hfl/8dfMwaKKK+QPoQrp/CX+ouf94fyrmK6fwl/qLn/eH8q9PKP97j8/yOLMP4D+X5nQ0UUEEAZB5r7E+dCiiigAoro/DHgy48RxSTmcW1sh2hym4s3oBkfnWxN8LLlf9RqUL/78ZX+RNcVTMMNTm4TnqvU6YYStOPNGOhwlFdbN8Ndaj+41pL/uyEfzAqjN4H8QQ9dPZh6pIjfyNXHG4eW0195Lw1aO8WYFFaE3h/V7f/W6ZeKPXyWI/PFUZI3icpIjIw6hhg1vGcZfC7mTjKO6G0UUVZIUUU6EBpkB6FgKmUuWLl2Gld2NdI7PQ9NOo6mwGACARnGegA7muM1j4iaheOyacBZw9AcBnI9yeB+H51qfFKVhDpsQPyM0jEe424/ma5nwzf6TY3DHVLUyMT8kpG5U/wCA/wBea/Kqblj743E+9J3suiV9kj7qnSjRksNTaiur7+pTW21bW5A+y7uyT99tzD8zwK0rbwLq84zIsMH/AF0kz/6Dmu7i13TZbfzLe6ikUD7qH5h+HUVTm12ViRDGqD1bk1pLEuGiVj3sNkVOqubmcvPoYMfw5kIHm6gin0WIn+oq2vw9sUH769nPuAq/41PJqF1L96d/+AnH8qrsxY5Ykn3NYvFzZ6kMgw63S/F/qOPgjQ4z897ccdjKnP8A47T18LeHEyDI7fWU/wBKhoqXiaj6m8ckwq+yvuJW8OeGgOsn4OxqFvDHh1hgXFyp9QT/AFWlopfWancp5Lg3vH8F/kRN4R0Mj5NQuR9cH/2WoJPBVix/c6wFHo8Wf6irlFNYqoupnLIcHL7JkS+CLnP+jX1lMPdyp/LmqFx4X1i0G82cjAHhoiH/AJc101BmEI3NIIx6lsVpHGT6q5yVeG8M1eMnH+vM56w8V61o8mxLqRlU4MU+WA9ueR+GK7nQPFtl4nH2K9hEN2RlVzlX/wB09j7fzrktV1iyniMcx+1MOnfH/Au34Vh6S7R6xZtGxVhOhBHb5hTnh41Y+1jHkmtU1o7nzeLpRwtT2SqKpF7r/Pp+J6NqFk1jcmMnKnlT6iq1bfiTG6345w39KxK/QMjxlTG5fSr1fia1+Tav87HxWY0I4fEzpw2X6q4Vyviz/j8g/wCuf9a6quV8Wf8AH5B/1z/rVZx/ur+X5hl/8dfMwaKKK+PPoQrp/CX+ouf94fyrmK6fwl/qLn/eH8q9PKP97j8/yOLMP4D+X5nV6Ysb6jAs2NhbnPT2/Wuo1JIm06bzgNoQkZ7HtiuNp73EsqBZJXZR0DMSBX1FWg6k1JPY+caGUUUV0jO48EeMbPSLFrDUt0aBy6SqpYc9QQOa7KHxjoM+NmpwjP8Afyn8wK8VorysRlFGtN1LtNnfSzCpTio2TSPeIdX064/1N/aSf7kyn+tW1YMAVIIPcV8+U+OaSE5ikdD6qxFccshX2Z/h/wAE6Fmr6x/E+ga4z4mW9q2hxTyBRcrKFjb+Ig5yPp3rz6HxBq0H+q1O8UennNj8s1BfaleanKJL65lndRgF2zge3pVYXJ6lGtGo56IVfMI1Kbhy7laiiivfPJCnwf8AHxH/ALw/nTKfB/x8R/7w/nWVb+HL0ZdP4kVPin/zC/8Atr/7JWHovhL+29GN1Dc+VMJGTay5U4A/Edfetz4p/wDML/7a/wDslWPAP/IvN/13b+Qr8qwEnHBQa8/zZ+h0KMK2MlCaurfoji9Q8N6jp0vlyxB+MgxncCP51UE97a8eZPHjsSR+lej68P8AS4z/ALH9TWWeRzWrxbvaUbnuQ4dg4qdGo4v+vQ5JNcv0/wCW24e6ipl8R3i/eWJvqp/xroXsraT79vEx9SgqFtIsW62yfhkUvb0XvAr+yszh8GIv6t/8EyB4ln7wRn6E08eJnxzbLn/f/wDrVoHQrA9ISPo7f400+H7En7rj/gRo9phn9n+vvD6pnUdqq/r/ALdKP/CTv/z7L/33/wDWpD4mlzxbpj/eNXv+Efsv7r/99U4aDYjrGx+rmjnw38v9feH1XO3vVX4f/ImW3iW6I+WKEfgT/Wom1++bo6L9FH9a3F0WwXpbj8WJ/rUq6bZp0tovxUGj21BbQD+zc1n8eIt6N/5I5d9Uvpjg3EmT/d4/lSLZXt02RDM5P8TA/wAzXYJEkf3EVfoMU6j64l8EbAuHZVNcRWcv682zm7bw5O5BuJFjHoOT/hVOxQR65boOi3KgZ/3hXYVyNr/yMEP/AF9L/wCh1dGtKopc3Y8/OsuoYKFNUlq27t/I9V8Sfet/o39KxK2/En3rf6N/SsSvsuFv+RTR/wC3v/Smfn+c/wC+z+X5IK5XxZ/x+Qf9c/611Vcr4s/4/IP+uf8AWu3OP91fy/Mxy/8Ajr5mDRRRXx59CFdP4S/1Fz/vD+VcxXT+Ev8AUXP+8P5V6eUf73H5/kcWYfwH8vzOhooor7E+dCiiigAooooAKKKKACiiigAooooAKfB/x8R/7w/nTKVWKOGHUHIqKkXKDiupUXaSZX+KSkppbdgZR/6B/hTvh/cRtossIceakxYrnnBAwa3tSsbXxdoxt3bypkO5WHJjb+oNecal4e1jw5P5rRyKqH5biAkr+Y6fjivyjCL2UPqdb3Zxb0frf5n6BSxHs6qxVNc0WjuNeH76E/7JrJrmv+Eo1J1QXEqzhOhdefzGKsR+Jlx+9tyPdWzTqYWpe6Vz6rCZ9g3BRnLlfmv8rm7RWWniGzb73mJ9V/wqZdasH6XAH1Uj+lYujUX2WelDMsJParH70XqKqDVbInH2mP8AOnjULQjIuofxcVPJLsbLFUHtNfeixRUH2+0/5+oP+/gpranZr1uYvwbNHJLsN4mit5r70WaKpnV7FRzcJ+GTUT69Yr0kZvoh/rVKlUe0WZSzDCx3qx+9GjRWNJ4lgH+rhkY++BVSbxJcPxFHHGPU/Ma0jhar6HHVz3A0/t39E/8Ahjo3dUQs7BVHJJOAK5GzcNrkDryDcqR7/NSBr/V5xEgmuJD0RFJ/QV23hPwPLZXMeo6vtRovnjhyDg9mY9OPStJSp4SEnOWr6HzWZZj/AGlKMacbRj1Z0PiTrbf8C/pWJV7V71b26Hl/6tBhT6+pqjX3vD2GqYXLaVKqrSSb+9t/qfAZpWjWxc5w2/yVgrlfFn/H5B/1z/rXVVyviz/j8g/65/1rbOP91fy/MnL/AOOvmYNFFFfHn0IV3HgjRLi70ya5jeII0m0Bic5A+nvXD1fsde1LTYPJs7yWGItu2qeM+tHtsRRanhmlJd9hOnTqLlqrTyPTv+Eeuv8AnpD/AN9H/Cj/AIR66/56Q/8AfR/wrzr/AIS3XP8AoJT/AJij/hLdc/6CU/5ir/tXOf54fcZ/UMB/K/vPRf8AhHrr/npD/wB9H/Cj/hHrr/npD/30f8K86/4S3XP+glP+Yo/4S3XP+glP+Yo/tXOf54fcH1DAfyv7z0X/AIR66/56Q/8AfR/wo/4R66/56Q/99H/CvOv+Et1z/oJT/mKP+Et1z/oJT/mKP7Vzn+eH3B9QwH8r+89F/wCEeuv+ekP/AH0f8KP+Eeuv+ekP/fR/wrzr/hLdc/6CU/5ij/hLdc/6CU/5ij+1c5/nh9wfUMB/K/vPRf8AhHrr/npD/wB9H/Cj/hHrr/npD/30f8K86/4S3XP+glP+Yo/4S3XP+glP+Yo/tXOf54fcH1DAfyv7z0X/AIR66/56Q/8AfR/wo/4R66/56Q/99H/CvOv+Et1z/oJT/mKP+Et1z/oJT/mKP7Vzn+eH3B9QwH8r+89F/wCEeuv+ekP/AH0f8KP+Eeuv+ekP/fR/wrzr/hLdc/6CU/5ij/hLdc/6CU/5ij+1c5/nh9wfUMB/K/vPR49CvYXDxzRKw6EMf8K1rYXyALceQ/8AtKxB/LFeRf8ACW65/wBBKf8AMUf8Jbrn/QSn/MV5+OeOx6tiOR+drP71qdOGhh8M70uZfPT7j1S88NaRfkm50+BmPVlXYx/EYNeYeMdJttG1021krLF5avhmzgnNRf8ACW65/wBBKf8AMVnXt/c6jcefeTNNLgLubriubA4LEYed5zvHtdm9evTqR92Op0Nl4Ke+06C6jvVUyoG2NH0/HNI/gLUB9y4tW+pYf0rrfD3/ACL9j/1yFaNesch503gjVgcAQH3ElMbwZrAOBDGfcSCvSKKAPNv+EN1j/n3T/v4v+NP/AOEJ1b+5D/38r0aigDz9PAmpMfmltVH++x/pU8fgC5J/e3sS/wC6hb/Cu5ooA838Q+HF0K3gcXBmaViD8m0DH4mug8AaBpup6ZNc3tqs0qTlFLE4xtB6Zx3qH4gf8eln/vt/IVy1jrmo6ZC0VldyQxs24qp6npn9K5cZRqVqThTlZmtGcYSvJXR7THapZQ+XYW1vGv8AdUbB+grPu7DU7ziSeAJ/cUkD+VeYf8Jbrn/QSn/MUf8ACW65/wBBKf8AMVx4LDYrBS9pT5HLu02/x2+RriJ0sQuWfNbsnY9F/wCEeuv+ekP/AH0f8KP+Eeuv+ekP/fR/wrzr/hLdc/6CU/5ij/hLdc/6CU/5ivZ/tXOf54fccH1DAfyv7z0X/hHrr/npD/30f8K4vx1p0theWhlZDvjONpPY/T3rO/4S3XP+glP+Yqlf6re6oyNfXLzlAQpftmk8fmVb3MRKLj5LUccJhaT5qSd/NlSiiipNAr1P4RxRyaXqJeNWImX7wz/DXlleq/CD/kF6j/12X/0Gmuojv/s0H/PGP/vgUfZoP+eMf/fAqSikMj+zQf8APGP/AL4FH2aD/njH/wB8CpKKAI/s0H/PGP8A74FH2aD/AJ4x/wDfAqSigCP7NB/zxj/74FH2aD/njH/3wKkooAj+zQf88Y/++BR9mg/54x/98CpKKAI/s0H/ADxj/wC+BR9mg/54x/8AfAqSigCP7NB/zxj/AO+BR9mg/wCeMf8A3wKkooAj+zQf88Y/++BR9mg/54x/98CpKKAI/s0H/PGP/vgV438UUWPxeQihR9nTgDHrXtFczr/gLTPEepfbbye8SXYExE6hcD6qfWgDzfTvG32DT4LX7Bv8pAu7zsZ/DbVj/hYX/UN/8j//AGNdb/wqTQ/+frUf+/if/EUf8Kk0P/n61H/v4n/xFAHJf8LC/wCob/5H/wDsaP8AhYX/AFDf/I//ANjXW/8ACpND/wCfrUf+/if/ABFH/CpND/5+tR/7+J/8RQByX/Cwv+ob/wCR/wD7Gj/hYX/UN/8AI/8A9jXW/wDCpND/AOfrUf8Av4n/AMRR/wAKk0P/AJ+tR/7+J/8AEUAcl/wsL/qG/wDkf/7Gj/hYX/UN/wDI/wD9jXW/8Kk0P/n61H/v4n/xFH/CpND/AOfrUf8Av4n/AMRQB534g8Sf27FCn2XyfKYnPmbs5/AV3/wmhjk8OXZeNGP2s8lQf4FqX/hUmh/8/Wo/9/E/+Iro/Dnhu08MWMlrZSTyRySGQmZgTnAHYDjigDS+zQf88Y/++BR9mg/54x/98CpKKAI/s0H/ADxj/wC+BR9mg/54x/8AfAqSigCP7NB/zxj/AO+BXlfxcjSPVdPCIqgwt90Y/ir1ivKfi/8A8hXTv+uDf+hU11Eee0UUUhhXefDzxZpfh2xvItRkkRpZFZdsZbIA9q4OimmB7X/ws7w5/wA/E/8A35aj/hZ3hz/n4n/78tXilFF/IVj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1H/AAs7w5/z8T/9+WrxSii/kFj2v/hZ3hz/AJ+J/wDvy1cF8Q/EVh4iv7OXTnd0iiKsWQryTnvXI0UXCwUUUUhn/9k=",
                fileName="modelica://PNlib/../../../Ausarbeitungen/Prozessmodellierung/Mohn Media/Modell/MakuButton.jpg"),
              Text(
                extent={{-50,8},{156,-18}},
                lineColor={0,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid,
                textString="Maculation Press")}));
      end Maculation;

      model PrintingMachine "printing machine"

        TC printing(
          nOut=2,
          maximumSpeed=speed,
          nIn=1)
          annotation (Placement(transformation(extent={{-146,70},{-126,90}})));
        PC printed_paper(
          nIn=1,
          nOut=1,
          reStart=reStart) "[m]"
          annotation (Placement(transformation(extent={{-94,70},{-74,90}})));
        TC cutting(
          nIn=1,
          nOut=1,
          maximumSpeed=speed,
          arcWeightIn={1.2})
          annotation (Placement(transformation(extent={{-64,70},{-44,90}})));
        PC Sections(
          nIn=1,
          nOut=1,
          reStart=reStart) "m"
          annotation (Placement(transformation(extent={{-30,70},{-10,90}})));
        TC fold(
          nIn=1,
          nOut=1,
          arcWeightOut={2},
          maximumSpeed=speed)
          annotation (Placement(transformation(extent={{4,70},{24,90}})));
        PC FoldedSections(
          nIn=1,
          nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{40,70},{60,90}})));
        TC bundle(
          nIn=1,
          nOut=1,
          arcWeightIn={2},
          maximumSpeed=speed)
          annotation (Placement(transformation(extent={{74,70},{94,90}})));
        PC Bundle(
          nIn=1,
          nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{-172,-6},{-152,14}})));
        TC chainUp(
          nIn=1,
          nOut=2,
          maximumSpeed=speed)
          annotation (Placement(transformation(extent={{-140,-6},{-120,14}})));
        PC Bundle_on_chain(
          nIn=1,
          nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{-96,-6},{-76,14}})));
        TC       Chain_to_macu_press(
          nIn=2,
          nOut=1,
          arcWeightIn={1,999},
          maximumSpeed=speed)
          annotation (Placement(transformation(extent={{-54,-6},{-34,14}})));
       PC bundle_at_macu_press(
          nIn=1,
          enablingType=1,
          nOut=2,
          reStart=reStart)
                  annotation (Placement(transformation(extent={{-6,-6},{14,14}})));
        PC                        Chain_full(nOut=1, nIn=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{-100,-42},{-80,-22}})));
        TA       TA1(testValue=999)
          annotation (Placement(transformation(extent={{-7.49998,-2.50001},{7.49994,2.50001}},
              rotation=90,
              origin={-62.5,-6.5})));
        TC       chain_up2(
          nOut=2,
          maximumSpeed=speed,
          arcWeightIn={1,0},
          nIn=2) annotation (Placement(transformation(extent={{50,-6},{70,14}})));
        PC Bundle_on_chain2(
          nIn=1,
          nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{104,-6},{124,14}})));
        TC       chain1(
          nIn=2,
          nOut=2,
          arcWeightIn={1,999},
          maximumSpeed=speed)
          annotation (Placement(transformation(extent={{156,-6},{176,14}})));
        PC                        Chain_full2(nIn=1, nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{102,-42},{122,-22}})));
        TA       TA2(testValue=999)
                     annotation (Placement(transformation(extent={{-8.5,-2.50012},{8.5,
                  2.50015}},
              rotation=90,
              origin={135.5,-5.5})));
        PC                        Counter_exemplars(nIn=1, nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=90,
              origin={180,68})));
        PC                        Exemplars(nIn=1, nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{-164,-100},{-144,-80}})));
        TC Exemplars_Packets(
          nIn=1,
          nOut=1,
          arcWeightIn={240},
          maximumSpeed=1)
          annotation (Placement(transformation(extent={{-122,-100},{-102,-80}})));
        PC Packets(
          nIn=1,
          nOut=1,
          reStart=reStart)
          annotation (Placement(transformation(extent={{-84,-100},{-64,-80}})));
        TC Packets_Pallet(
          nIn=1,
          nOut=1,
          arcWeightIn={100})
          annotation (Placement(transformation(extent={{-42,-100},{-22,-80}})));
        PC Pallets(nIn=1, reStart=reStart)
          annotation (Placement(transformation(extent={{-4,-100},{16,-80}})));
        Interfaces.TransitionIn drucken_
          annotation (Placement(transformation(extent={{-214,70},{-194,90}}),
              iconTransformation(extent={{-166,-10},{-146,10}})));
        Interfaces.TransitionIn maku_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={50,-134}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-50,-122})));
        Interfaces.PlaceOut ausschleussen annotation (Placement(transformation(
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
        Modelica.Blocks.Interfaces.RealOutput number_exemplars_ annotation (
            Placement(transformation(extent={{142,58},{162,78}}),
              iconTransformation(extent={{150,70},{170,90}})));
        Interfaces.PlaceOut exemplare_ annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={178,130}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-90,120})));
        PC Counter_paper(nIn=1, reStart=reStart)
          annotation (Placement(transformation(extent={{-96,102},{-76,122}})));
        Modelica.Blocks.Interfaces.RealOutput papier_total_ annotation (
            Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-86,140}), iconTransformation(
              extent={{-10,-10},{10,10}},
              rotation=0,
              origin={160,40})));
      equation
        connect(printing.outPlaces[1], printed_paper.inTransition[1])
                                                     annotation (Line(
            points={{-131.2,79.5},{-113,79.5},{-113,80},{-94.8,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(printed_paper.outTransition[1], cutting.inPlaces[1])
                                                     annotation (Line(
            points={{-73.2,80},{-58.8,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(cutting.outPlaces[1], Sections.inTransition[1])
                                                     annotation (Line(
            points={{-49.2,80},{-30.8,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Sections.outTransition[1], fold.inPlaces[1])
                                                     annotation (Line(
            points={{-9.2,80},{9.2,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(fold.outPlaces[1], FoldedSections.inTransition[1])
                                                     annotation (Line(
            points={{18.8,80},{39.2,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(FoldedSections.outTransition[1], bundle.inPlaces[1])
                                                     annotation (Line(
            points={{60.8,80},{79.2,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle.outPlaces[1], Bundle.inTransition[1])
                                                     annotation (Line(
            points={{88.8,80},{112,80},{112,48},{-182,48},{-182,4},{-172.8,4}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Bundle.outTransition[1], chainUp.inPlaces[1])
                                                     annotation (Line(
            points={{-151.2,4},{-134.8,4}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(chainUp.outPlaces[1], Bundle_on_chain.inTransition[1])
                                                     annotation (Line(
            points={{-125.2,3.5},{-96.8,3.5},{-96.8,4}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Bundle_on_chain.outTransition[1], Chain_to_macu_press.inPlaces[1])
                                                     annotation (Line(
            points={{-75.2,4},{-62,4},{-62,3.5},{-48.8,3.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Chain_to_macu_press.outPlaces[1], bundle_at_macu_press.inTransition[
          1])                                        annotation (Line(
            points={{-39.2,4},{-6.8,4}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TA1.outTransition,Chain_to_macu_press. inPlaces[2])
                                                   annotation (Line(
            points={{-61.2879,-4.93079},{-61.2879,3},{-48.8,3},{-48.8,4.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TA1.inPlace,Chain_full. outTransition[1])
                                                   annotation (Line(
            points={{-61.2879,-22.3117},{-61.2879,-32},{-79.2,-32}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Chain_full.inTransition[1], chainUp.outPlaces[2])
                                                      annotation (Line(
            points={{-100.8,-32},{-118,-32},{-118,4.5},{-125.2,4.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(chain_up2.outPlaces[1], Bundle_on_chain2.inTransition[1])
                                                     annotation (Line(
            points={{64.8,3.5},{78,3.5},{78,4},{103.2,4}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Bundle_on_chain2.outTransition[1], chain1.inPlaces[1])
                                                     annotation (Line(
            points={{124.8,4},{161.2,4},{161.2,3.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Chain_full2.inTransition[1],chain_up2. outPlaces[2])
                                                      annotation (Line(
            points={{101.2,-32},{76,-32},{76,4},{64.8,4},{64.8,4.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Chain_full2.outTransition[1],TA2. inPlace)
                                                   annotation (Line(
            points={{122.8,-32},{138.4,-32},{138.4,-23.0261},{137.268,-23.0261}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(TA2.outTransition,chain1. inPlaces[2])
                                                   annotation (Line(
            points={{137.268,-3.32772},{136,-6},{136,4},{161.2,4},{161.2,4.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(chain1.outPlaces[2],Counter_exemplars. inTransition[1])
                                                      annotation (Line(
            points={{170.8,4.5},{180,4.5},{180,57.2}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Exemplars.outTransition[1], Exemplars_Packets.inPlaces[1])
                                                      annotation (Line(
            points={{-143.2,-90},{-116.8,-90}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Exemplars_Packets.outPlaces[1], Packets.inTransition[1])
                                                       annotation (Line(
            points={{-107.2,-90},{-84.8,-90}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Packets.outTransition[1], Packets_Pallet.inPlaces[1])
                                                       annotation (Line(
            points={{-63.2,-90},{-36.8,-90}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Packets_Pallet.outPlaces[1], Pallets.inTransition[1])
                                                       annotation (Line(
            points={{-27.2,-90},{-4.8,-90}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(chain1.outPlaces[1],Exemplars. inTransition[1])
                                                     annotation (Line(
            points={{170.8,3.5},{182,3.5},{182,-54},{-186,-54},{-186,-90},{-164.8,-90}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(printing.inPlaces[1], drucken_)
                                               annotation (Line(
            points={{-140.8,80},{-204,80}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_at_macu_press.outTransition[1], chain_up2.inPlaces[1])
          annotation (Line(
            points={{14.8,3.5},{55.2,3.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(chain_up2.inPlaces[2], maku_) annotation (Line(
            points={{55.2,4.5},{50,4.5},{50,-134}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(bundle_at_macu_press.outTransition[2], ausschleussen)   annotation (
            Line(
            points={{14.8,4.5},{28,4.5},{28,-134}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Counter_exemplars.pc_t,number_exemplars_)  annotation (Line(
            points={{169.2,68},{152,68}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Counter_exemplars.outTransition[1], exemplare_) annotation (
            Line(
            points={{180,78.8},{180,130},{178,130}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(printing.outPlaces[2], Counter_paper.inTransition[1])
          annotation (Line(
            points={{-131.2,80.5},{-120,80.5},{-120,112},{-96.8,112}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Counter_paper.pc_t, papier_total_)  annotation (Line(
            points={{-86,122.8},{-86,140}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,
                  -125},{200,125}}),
                               graphics), Icon(coordinateSystem(preserveAspectRatio=true,
                extent={{-200,-125},{200,125}}), graphics={Bitmap(
                extent={{-168,110},{172,-112}},
                imageSource="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"
                     + "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",
                fileName="modelica://PNlib/../../../Ausarbeitungen/Prozessmodellierung/Mohn Media/Modell/druckmaschine.jpg")}));
      end PrintingMachine;

      model Counter "counter for paper, examples, maculations, ..."
       parameter String text="counter";
       parameter Real color[3]={255,0,0};
        Modelica.Blocks.Interfaces.RealInput    levelSensor
          annotation (Placement(transformation(extent={{-61,-30},{-81,-10}},
                  rotation=0), iconTransformation(
              extent={{10,-10},{-10,10}},
              rotation=270,
              origin={0,-70})));
        Real count;
        parameter Integer hmax=1000000;
        Real levelSensor_=if levelSensor>0 then levelSensor else 0;
      equation
        count=levelSensor_/hmax;
        annotation (
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-4,46},{-4,66}},
                  lineColor={0,0,0},
                textString="%text"),
                Rectangle(
                  extent={{-50.5,51},{50.5,-51}},
                  lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255},
                origin={0,-9.5},
                rotation=90),
                Rectangle(
                  extent={{-50.5,51},{50.5,51-count*100}},
                  lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor=color,
                origin={0,-9.5},
                rotation=90),
                Text(
                  extent={{0,-27},{0,12}},
                  textString=DynamicSelect("0",realString(levelSensor_,1,0)),
                  lineColor={0,0,0})}));
      end Counter;
    annotation (Documentation(info="<html>
<p> Documentation is comming soon.</p> </html>"));
    end Printing;

    package PNproBP "Petri Nets for Modeling Business Processes"
      model Model "Top Model"
        parameter Integer Nr_Consultant=2 "Number of consultants";
        parameter Integer Nr_Advisor1=2 "Number of advisor type 1";
        parameter Integer Nr_Advisor2=1 "Number of advisor type 2";
        parameter Integer Nr_Controller=1 "Number of Controllers";
        parameter Integer Nr_Installer=2 "Number of installers";
        parameter Integer Nr_Accountant=2 "Number of accountants";
        parameter Real time_between_requests=1.5
          "Expected time between two requests";
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
        PD Solution(nOut=1, nIn=1)
          "A solution for the customer wish has been found"
          annotation (Placement(transformation(extent={{10,10},{-10,-10}},
              rotation=180,
              origin={-154,104})));
        PD Complete(nIn=1, nOut=1) "Consulting is completed"
          annotation (Placement(transformation(extent={{-256,90},{-236,110}})));
        PD Offer(nOut=1, nIn=1) "The offer is complete"
          annotation (Placement(transformation(extent={{-42,94},{-22,114}})));
        PD No_Solution(nIn=1)
          "No solution for the costumer wish has been found"
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
          arcWeightOut={pre(Offer.t)})
          "The offers of a day are sent to the customer"
          annotation (Placement(transformation(extent={{4,94},{24,114}})));
        PD Offer_at_Customer(nIn=1, nOut=1)
          "The offer has arrived the customer"
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
        PD No_Order(nIn=2) "no order "
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
        inner Settings settings1(scale=10, showCapacity=2)
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
        PNproBP.XOR Resulting2(upperProb=0.5, lowerProb=0.5)
          "Result of the answer"
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
        PD WaitingTime_over(nOut=1, nIn=1)
          "The waiting time of the answer is over"
          annotation (Placement(transformation(extent={{150,94},{170,114}})));
        PNproBP.Waiting Waiting(delay=40)
          "Waiting of the answer from the customer"
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

      model Parallel
        parameter Real delay=1;
        parameter Real noParallel=2;
        Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input place"  annotation(Dialog(enable = true, group = "Arc Weights"));

        Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output place"
                                           annotation(Dialog(enable = true, group = "Arc Weights"));
        parameter Integer nIn=0 "number of input places" annotation(Dialog(connectorSizing=true));
        parameter Integer nOut=0 "number of output places" annotation(Dialog(connectorSizing=true));
        Boolean fire "firability of continuous transition";
        Integer fireColor[3] "for animation";
        TD T1(
          delay=delay,
          nIn=1,
          nOut=1) annotation (Placement(transformation(extent={{2,74},{22,94}})));
        TD puffern(
          nOut=1,
          nIn=nIn,
          arcWeightIn=arcWeightIn,
          delay=0.001)
                   annotation (Placement(transformation(extent={{-100,4},{-80,24}})));
        PD Puffer(nIn=1, nOut=6)
          annotation (Placement(transformation(extent={{-70,4},{-50,24}})));
        TD T2(
          delay=delay,
          nIn=1,
          nOut=1,
          firingCon=noParallel > 1)
                 annotation (Placement(transformation(extent={{2,40},{22,60}})));
        TD T3(
          delay=delay,
          nIn=1,
          nOut=1,
          firingCon=noParallel > 2)
                  annotation (Placement(transformation(extent={{2,6},{22,26}})));
        TD T4(
          delay=delay,
          nIn=1,
          nOut=1,
          firingCon=noParallel > 3)
                  annotation (Placement(transformation(extent={{2,-28},{22,-8}})));
        TD T5(
          delay=delay,
          nIn=1,
          nOut=1,
          firingCon=noParallel > 4)
                  annotation (Placement(transformation(extent={{2,-62},{22,-42}})));
        TD T6(
          delay=delay,
          nIn=1,
          nOut=1,
          firingCon=noParallel > 5)
                  annotation (Placement(transformation(extent={{2,-96},{22,-76}})));
        Interfaces.TransitionIn inPlaces1[nIn]
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
        PD P1(nIn=6, nOut=1)
          annotation (Placement(transformation(extent={{46,0},{66,20}})));
        TD T7(
          nOut=nOut,
          nIn=1,
          arcWeightOut=arcWeightOut,
          delay=0.0001)
                  annotation (Placement(transformation(extent={{70,0},{90,20}})));
        Interfaces.TransitionOut outPlaces1[nOut]
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Boolean ani "for transition animation";
      protected
        outer Settings settings1 "global settings for animation and display";
        discrete Real fireTime;
      equation
        fire=T1.fire or T2.fire or T3.fire or T4.fire or T5.fire or T6.fire;
        when fire then
           fireTime=time;
           ani=true;
        end when;
        fireColor=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {128,255,0};

        connect(puffern.outPlaces[1], Puffer.inTransition[1]) annotation (Line(
            points={{-85.2,14},{-70.8,14}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[1], T1.inPlaces[1]) annotation (Line(
            points={{-49.2,13.1667},{-22,13.1667},{-22,84},{7.2,84}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[2], T2.inPlaces[1]) annotation (Line(
            points={{-49.2,13.5},{-22,13.5},{-22,50},{7.2,50}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[3], T3.inPlaces[1]) annotation (Line(
            points={{-49.2,13.8333},{-22,13.8333},{-22,16},{7.2,16}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[4], T4.inPlaces[1]) annotation (Line(
            points={{-49.2,14.1667},{-22,14.1667},{-22,-18},{7.2,-18}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[5], T5.inPlaces[1]) annotation (Line(
            points={{-49.2,14.5},{-22,14.5},{-22,-52},{7.2,-52}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[6], T6.inPlaces[1]) annotation (Line(
            points={{-49.2,14.8333},{-22,14.8333},{-22,-86},{7.2,-86}},
            color={0,0,0},
            smooth=Smooth.None));
        for i in 1:nIn loop
          connect(puffern.inPlaces[i], inPlaces1[i]) annotation (Line(
            points={{-94.8,14},{-104,14},{-104,0},{-110,0}},
            color={0,0,0},
            smooth=Smooth.None));
        end for;
        connect(T1.outPlaces[1], P1.inTransition[1]) annotation (Line(
            points={{16.8,84},{32,84},{32,9.16667},{45.2,9.16667}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T2.outPlaces[1], P1.inTransition[2]) annotation (Line(
            points={{16.8,50},{32,50},{32,9.5},{45.2,9.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T3.outPlaces[1], P1.inTransition[3]) annotation (Line(
            points={{16.8,16},{32,16},{32,9.83333},{45.2,9.83333}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T4.outPlaces[1], P1.inTransition[4]) annotation (Line(
            points={{16.8,-18},{32,-18},{32,10.1667},{45.2,10.1667}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T5.outPlaces[1], P1.inTransition[5]) annotation (Line(
            points={{16.8,-52},{32,-52},{32,10.5},{45.2,10.5}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T6.outPlaces[1], P1.inTransition[6]) annotation (Line(
            points={{16.8,-86},{32,-86},{32,10.8333},{45.2,10.8333}},
            color={0,0,0},
            smooth=Smooth.None));
        for i in 1:nOut loop
          connect(T7.outPlaces[i], outPlaces1[i]) annotation (Line(
            points={{84.8,10},{98,10},{98,0},{110,0}},
            color={0,0,0},
            smooth=Smooth.None));
        end for;
        connect(P1.outTransition[1], T7.inPlaces[1]) annotation (Line(
            points={{66.8,10},{75.2,10}},
            color={0,0,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics), Icon(graphics={Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={128,255,0},
                fillColor=DynamicSelect({128,255,0},fireColor),
                fillPattern=FillPattern.HorizontalCylinder),
                                                Text(
                extent={{0,59},{0,42}},
                lineColor={0,0,0},
                textString="Parallel"),         Text(
                extent={{-4,137},{-4,118}},
                lineColor={0,0,0},
                textString="%name"),            Text(
                extent={{0,-15},{0,-32}},
                lineColor={0,0,0},
                textString=DynamicSelect("","d="+realString(delay,1,0)))}));
      end Parallel;

      model XOR
       parameter Real upperProb=0.5;
       parameter Real lowerProb=0.5;
       Real arcWeightOut1=1 "arc weights of output place"
                                           annotation(Dialog(enable = true, group = "Arc Weights"));
       Real arcWeightOut2=1 "arc weights of output place"
                                           annotation(Dialog(enable = true, group = "Arc Weights"));
        TD T1(
          nIn=1,
          nOut=1,
          arcWeightOut={arcWeightOut1},
          delay=0.0001)
                   annotation (Placement(transformation(extent={{-18,30},{2,50}})));
        TD T2(
          nIn=1,
          nOut=1,
          arcWeightOut={arcWeightOut2},
          delay=0.0001)
                   annotation (Placement(transformation(extent={{-18,-50},{2,-30}})));
        PD P1(
          nIn=1,
          nOut=2,
          enablingType=2,
          enablingProbOut={upperProb,lowerProb},
          maxTokens=1)
          annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
        TD T3(
          nOut=1,
          nIn=1,
          delay=0.0001)
                 annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
        Interfaces.TransitionIn inPlaces1
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
        Interfaces.TransitionOut outPlaces1
          annotation (Placement(transformation(extent={{100,30},{120,50}})));
        Interfaces.TransitionOut outPlaces2
          annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
        Boolean fire "firability of continuous transition";
        Integer fireColor[3] "for animation";
         Boolean ani "for transition animation";
      protected
        outer Settings settings1 "global settings for animation and display";
        discrete Real fireTime;
      equation
        fire=T1.fire or T2.fire;
        when fire then
           fireTime=time;
           ani=true;
        end when;
        fireColor=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {85,170,255};
        connect(T3.outPlaces[1], P1.inTransition[1]) annotation (Line(
            points={{-73.2,0},{-68,0},{-62.8,0}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T3.inPlaces[1], inPlaces1) annotation (Line(
            points={{-82.8,0},{-110,0}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P1.outTransition[1], T1.inPlaces[1]) annotation (Line(
            points={{-41.2,-0.5},{-26,-0.5},{-26,40},{-12.8,40}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P1.outTransition[2], T2.inPlaces[1]) annotation (Line(
            points={{-41.2,0.5},{-26,0.5},{-26,-40},{-12.8,-40}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T1.outPlaces[1], outPlaces1) annotation (Line(
            points={{-3.2,40},{-3.2,40},{110,40}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T2.outPlaces[1], outPlaces2) annotation (Line(
            points={{-3.2,-40},{-3.2,-40},{110,-40}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        annotation (Diagram(graphics), Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={170,255,255}),                                Text(
                extent={{-28,12},{-28,-12}},
                lineColor={0,0,0},
                textString="XOR"),              Text(
                extent={{56,51},{56,26}},
                lineColor={0,0,0},
                textString="%upperProb"),       Text(
                extent={{58,-29},{58,-54}},
                lineColor={0,0,0},
                textString="%lowerProb"),       Text(
                extent={{-4,137},{-4,118}},
                lineColor={0,0,0},
                textString="%name")}));
      end XOR;

      model Puffer
       parameter Real delay=1;
       parameter Integer nIn=0 "number of input places" annotation(Dialog(connectorSizing=true));
        parameter Integer nOut=0 "number of output places" annotation(Dialog(connectorSizing=true));
        Real arcWeightIn[nIn]=fill(1,nIn) "arc weights of input place"  annotation(Dialog(enable = true, group = "Arc Weights"));

        Real arcWeightOut[nOut]=fill(1,nOut) "arc weights of output place"
                                           annotation(Dialog(enable = true, group = "Arc Weights"));
        TD T1(
          nIn=1,
          nOut=nOut,
          delay=delay,
          arcWeightOut=arcWeightOut)
                   annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
        PD P1(nIn=1, nOut=1)
          annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
        TD T3(
          nOut=1,
          nIn=nIn,
          arcWeightIn=arcWeightIn,
          delay=0.0001)
                   annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
        Interfaces.TransitionIn inPlaces1[nIn]
          annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
        Interfaces.TransitionOut outPlaces1[nOut]
          annotation (Placement(transformation(extent={{100,-10},{120,10}})));
        Boolean fire "firability of continuous transition";
        Integer fireColor[3] "for animation";
         Boolean ani "for transition animation";
      protected
        outer Settings settings1 "global settings for animation and display";
        discrete Real fireTime;
      equation
        fire=T1.fire;
        when fire then
           fireTime=time;
           ani=true;
        end when;
        fireColor=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {255,128,8};
        connect(T3.outPlaces[1], P1.inTransition[1]) annotation (Line(
            points={{-73.2,0},{-54.8,0}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        for i in 1:nIn loop
          connect(T3.inPlaces[i], inPlaces1[i]) annotation (Line(
            points={{-82.8,0},{-110,0}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        end for;
        connect(P1.outTransition[1], T1.inPlaces[1]) annotation (Line(
            points={{-33.2,0},{-33.2,0},{-12.8,0}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        for i in 1:nOut loop
          connect(T1.outPlaces[i], outPlaces1[i]) annotation (Line(
            points={{-3.2,0},{-3.2,0},{110,0}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        end for;
        annotation (Diagram(graphics), Icon(graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor=DynamicSelect({255,128,8},fireColor)),        Text(
                extent={{0,74},{0,42}},
                lineColor={0,0,0},
                textString="Puffer"),           Text(
                extent={{0,-51},{0,-76}},
                lineColor={0,0,0},
                textString="d=%delay"),         Text(
                extent={{0,9},{0,-16}},
                lineColor={0,0,0},
                textString="%name")}));
      end Puffer;

      model Waiting
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
                  annotation (Placement(transformation(extent={{-20,74},{0,94}})));
        PD Puffer(nOut=24, nIn=1)
          annotation (Placement(transformation(extent={{-70,4},{-50,24}})));
        TD T2(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P2.t) == 0)
                  annotation (Placement(transformation(extent={{-20,40},{0,60}})));
        TD T3(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P3.t) == 0)
                  annotation (Placement(transformation(extent={{-22,6},{-2,26}})));
        TD T4(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P4.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-28},{-2,-8}})));
        TD T5(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P5.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-60},{-2,-40}})));
        TD T6(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P6.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-94},{-2,-74}})));
        PD P1(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{8,74},{28,94}})));
        TD T7(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P1.t)},
          arcWeightOut={pre(P1.t)},
          firingCon=pre(P1.t) > 0)
                  annotation (Placement(transformation(extent={{48,74},{68,94}})));
        Boolean ani "for transition animation";
      protected
        outer Settings settings1 "global settings for animation and display";
        discrete Real fireTime;
      public
        PD P2(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{8,40},{28,60}})));
        PD P3(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,6},{26,26}})));
        PD P4(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-28},{26,-8}})));
        PD P5(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-62},{26,-42}})));
        PD P6(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{8,-96},{28,-76}})));
        TD T8(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P2.t)},
          arcWeightOut={pre(P2.t)},
          firingCon=pre(P2.t) > 0)
                  annotation (Placement(transformation(extent={{46,40},{66,60}})));
        TD T9(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P3.t)},
          arcWeightOut={pre(P3.t)},
          firingCon=pre(P3.t) > 0)
                  annotation (Placement(transformation(extent={{46,6},{66,26}})));
        TD T10(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P4.t)},
          arcWeightOut={pre(P4.t)},
          firingCon=pre(P4.t) > 0)
                  annotation (Placement(transformation(extent={{46,-28},{66,-8}})));
        TD T11(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P5.t)},
          arcWeightOut={pre(P5.t)},
          firingCon=pre(P5.t) > 0)
                  annotation (Placement(transformation(extent={{46,-62},{66,-42}})));
        TD T12(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P6.t)},
          arcWeightOut={pre(P6.t)},
          firingCon=pre(P6.t) > 0)
                  annotation (Placement(transformation(extent={{46,-96},{66,-76}})));
        PD P7(nIn=24, nOut=1)
          annotation (Placement(transformation(extent={{104,-132},{124,-112}})));
        TD T13(
          nOut=1,
          nIn=1,
          arcWeightIn={arcWeight},
          arcWeightOut={arcWeight},
          delay=0.001,
          firingCon=pre(arcWeight) > 0)
          annotation (Placement(transformation(extent={{-98,4},{-78,24}})));
        Interfaces.TransitionIn inPlaces1 annotation (Placement(transformation(extent=
                 {{-120,4},{-100,24}}), iconTransformation(extent={{-120,-10},{-100,10}})));
        TD T14(
          nIn=1,
          delay=0.001,
          arcWeightIn={pre(P7.t)},
          nOut=1,
          arcWeightOut={pre(P7.t)},
          firingCon=pre(P7.t) > 0)
                  annotation (Placement(transformation(extent={{126,-132},{146,-112}})));
        Interfaces.TransitionOut outPlaces1 annotation (Placement(transformation(
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
                  annotation (Placement(transformation(extent={{-22,-126},{-2,-106}})));
        PD P8(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-126},{26,-106}})));
        TD T16(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P8.t)},
          arcWeightOut={pre(P8.t)},
          firingCon=pre(P8.t) > 0)
                  annotation (Placement(transformation(extent={{46,-126},{66,-106}})));
        TD T17(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P9.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-160},{-2,-140}})));
      public
        PD P9(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-160},{26,-140}})));
        TD T18(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P9.t)},
          arcWeightOut={pre(P9.t)},
          firingCon=pre(P9.t) > 0)
                  annotation (Placement(transformation(extent={{44,-160},{64,-140}})));
        TD T19(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P10.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-194},{-4,-174}})));
        TD T20(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P11.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-228},{-4,-208}})));
        TD T21(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P12.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-260},{-4,-240}})));
        TD T22(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P13.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-294},{-4,-274}})));
        PD P10(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{4,-194},{24,-174}})));
        PD P11(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{4,-228},{24,-208}})));
        PD P12(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{4,-262},{24,-242}})));
        PD P13(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-296},{26,-276}})));
        TD T23(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P10.t)},
          arcWeightOut={pre(P10.t)},
          firingCon=pre(P10.t) > 0)
                  annotation (Placement(transformation(extent={{44,-194},{64,-174}})));
        TD T24(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P11.t)},
          arcWeightOut={pre(P11.t)},
          firingCon=pre(P11.t) > 0)
                  annotation (Placement(transformation(extent={{44,-228},{64,-208}})));
        TD T25(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P12.t)},
          arcWeightOut={pre(P12.t)},
          firingCon=pre(P12.t) > 0)
                  annotation (Placement(transformation(extent={{44,-262},{64,-242}})));
        TD T26(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P13.t)},
          arcWeightOut={pre(P13.t)},
          firingCon=pre(P13.t) > 0)
                  annotation (Placement(transformation(extent={{44,-296},{64,-276}})));
        TD T27(
          nIn=1,
          nOut=1,
          delay=0.001,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P14.t) == 0)
                  annotation (Placement(transformation(extent={{-20,-334},{0,-314}})));
        TD T28(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P15.t) == 0)
                  annotation (Placement(transformation(extent={{-20,-368},{0,-348}})));
        TD T29(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P16.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-402},{-2,
                  -382}})));
        TD T30(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P17.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-436},{-2,
                  -416}})));
        TD T31(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P18.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-468},{-2,
                  -448}})));
        TD T32(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P19.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-502},{-2,
                  -482}})));
        PD P14(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{8,-334},{28,-314}})));
        TD T33(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P14.t)},
          arcWeightOut={pre(P14.t)},
          firingCon=pre(P14.t) > 0)
                  annotation (Placement(transformation(extent={{48,-334},{68,-314}})));
      public
        PD P15(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{8,-368},{28,-348}})));
        PD P16(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-402},{26,-382}})));
        PD P17(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-436},{26,-416}})));
        PD P18(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-470},{26,-450}})));
        PD P19(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{8,-504},{28,-484}})));
        TD T34(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P15.t)},
          arcWeightOut={pre(P15.t)},
          firingCon=pre(P15.t) > 0)
                  annotation (Placement(transformation(extent={{46,-368},{66,-348}})));
        TD T35(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P16.t)},
          arcWeightOut={pre(P16.t)},
          firingCon=pre(P16.t) > 0)
                  annotation (Placement(transformation(extent={{46,-402},{66,-382}})));
        TD T36(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P17.t)},
          arcWeightOut={pre(P17.t)},
          firingCon=pre(P17.t) > 0)
                  annotation (Placement(transformation(extent={{46,-436},{66,-416}})));
        TD T37(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P18.t)},
          arcWeightOut={pre(P18.t)},
          firingCon=pre(P18.t) > 0)
                  annotation (Placement(transformation(extent={{44,-470},{64,-450}})));
        TD T38(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P19.t)},
          arcWeightOut={pre(P19.t)},
          firingCon=pre(P19.t) > 0)
                  annotation (Placement(transformation(extent={{46,-504},{66,-484}})));
        TD T39(
          nIn=1,
          nOut=1,
          delay=0.001,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P20.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-534},{-2,
                  -514}})));
        PD P20(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-534},{26,-514}})));
        TD T40(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P20.t)},
          arcWeightOut={pre(P20.t)},
          firingCon=pre(P20.t) > 0)
                  annotation (Placement(transformation(extent={{46,-534},{66,-514}})));
        TD T41(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P21.t) == 0)
                  annotation (Placement(transformation(extent={{-22,-568},{-2,
                  -548}})));
      public
        PD P21(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-568},{26,-548}})));
        TD T42(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P21.t)},
          arcWeightOut={pre(P21.t)},
          firingCon=pre(P21.t) > 0)
                  annotation (Placement(transformation(extent={{44,-568},{64,-548}})));
        PD P22(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{4,-602},{24,-582}})));
        PD P23(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{4,-636},{24,-616}})));
        PD P24(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{4,-670},{24,-650}})));
        PD P25(nOut=1, nIn=1)
          annotation (Placement(transformation(extent={{6,-704},{26,-684}})));
        TD T43(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P22.t)},
          arcWeightOut={pre(P22.t)},
          firingCon=pre(P22.t) > 0)
                  annotation (Placement(transformation(extent={{44,-602},{64,-582}})));
        TD T44(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P23.t)},
          arcWeightOut={pre(P23.t)},
          firingCon=pre(P23.t) > 0)
                  annotation (Placement(transformation(extent={{44,-636},{64,-616}})));
        TD T45(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P24.t)},
          arcWeightOut={pre(P24.t)},
          firingCon=pre(P24.t) > 0)
                  annotation (Placement(transformation(extent={{44,-670},{64,-650}})));
        TD T46(
          nOut=1,
          nIn=1,
          delay=delay,
          arcWeightIn={pre(P25.t)},
          arcWeightOut={pre(P25.t)},
          firingCon=pre(P25.t) > 0)
                  annotation (Placement(transformation(extent={{46,-704},{66,-684}})));
        TD T47(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P22.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-602},{-4,
                  -582}})));
        TD T48(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P23.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-636},{-4,
                  -616}})));
        TD T49(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P24.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-668},{-4,
                  -648}})));
        TD T50(
          nIn=1,
          delay=0.001,
          nOut=1,
          arcWeightIn={pre(Puffer.t)},
          arcWeightOut={pre(Puffer.t)},
          firingCon=pre(Puffer.t) > 0 and pre(P25.t) == 0)
                  annotation (Placement(transformation(extent={{-24,-702},{-4,
                  -682}})));
      equation
        fire=T1.fire or T2.fire or T3.fire or T4.fire or T5.fire or T6.fire;
        when fire then
           fireTime=time;
           ani=true;
        end when;
        fireColor=if (fireTime+settings1.timeFire>=time and settings1.animateTransition==1 and ani) then {255,255,0} else {128,255,0};

        connect(Puffer.outTransition[1], T1.inPlaces[1]) annotation (Line(
            points={{-49.2,13.0417},{-30,13.0417},{-30,84},{-14.8,84}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[2], T2.inPlaces[1]) annotation (Line(
            points={{-49.2,13.125},{-30,13.125},{-30,50},{-14.8,50}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[3], T3.inPlaces[1]) annotation (Line(
            points={{-49.2,13.2083},{-46,13.2083},{-46,16},{-16.8,16}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[4], T4.inPlaces[1]) annotation (Line(
            points={{-49.2,13.2917},{-30,13.2917},{-30,-18},{-16.8,-18}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[5], T5.inPlaces[1]) annotation (Line(
            points={{-49.2,13.375},{-30,13.375},{-30,-50},{-16.8,-50}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[6], T6.inPlaces[1]) annotation (Line(
            points={{-49.2,13.4583},{-30,13.4583},{-30,-84},{-16.8,-84}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(P1.outTransition[1], T7.inPlaces[1]) annotation (Line(
            points={{28.8,84},{36,84},{36,86},{42,86},{42,82},{53.2,84}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T1.outPlaces[1], P1.inTransition[1]) annotation (Line(
            points={{-5.2,84},{-2,84},{-2,86},{2,86},{2,84},{7.2,84}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T2.outPlaces[1], P2.inTransition[1]) annotation (Line(
            points={{-5.2,50},{-2,50},{-2,52},{2,52},{2,50},{7.2,50}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T3.outPlaces[1], P3.inTransition[1]) annotation (Line(
            points={{-7.2,16},{5.2,16}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T4.outPlaces[1], P4.inTransition[1]) annotation (Line(
            points={{-7.2,-18},{5.2,-18}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T5.outPlaces[1], P5.inTransition[1]) annotation (Line(
            points={{-7.2,-50},{-7.2,-52},{5.2,-52}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T6.outPlaces[1], P6.inTransition[1]) annotation (Line(
            points={{-7.2,-84},{-8.88178e-016,-84},{-8.88178e-016,-86},{7.2,-86}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P2.outTransition[1], T8.inPlaces[1]) annotation (Line(
            points={{28.8,50},{34,50},{34,52},{40,52},{40,48},{51.2,50}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P3.outTransition[1], T9.inPlaces[1]) annotation (Line(
            points={{26.8,16},{26.8,16},{51.2,16}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P4.outTransition[1], T10.inPlaces[1]) annotation (Line(
            points={{26.8,-18},{40,-18},{51.2,-18}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P5.outTransition[1], T11.inPlaces[1]) annotation (Line(
            points={{26.8,-52},{40,-52},{51.2,-52}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P6.outTransition[1], T12.inPlaces[1]) annotation (Line(
            points={{28.8,-86},{51.2,-86}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T7.outPlaces[1], P7.inTransition[1]) annotation (Line(
            points={{62.8,84},{68,84},{68,-122.958},{103.2,-122.958}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T8.outPlaces[1], P7.inTransition[2]) annotation (Line(
            points={{60.8,50},{68,50},{68,-122.875},{103.2,-122.875}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T9.outPlaces[1], P7.inTransition[3]) annotation (Line(
            points={{60.8,16},{68,16},{68,-122.792},{103.2,-122.792}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T10.outPlaces[1], P7.inTransition[4]) annotation (Line(
            points={{60.8,-18},{68,-18},{68,-122.708},{103.2,-122.708}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T11.outPlaces[1], P7.inTransition[5]) annotation (Line(
            points={{60.8,-52},{60.8,-121},{103.2,-121},{103.2,-122.625}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T12.outPlaces[1], P7.inTransition[6]) annotation (Line(
            points={{60.8,-86},{68,-86},{68,-122.542},{103.2,-122.542}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T13.outPlaces[1], Puffer.inTransition[1]) annotation (Line(
            points={{-83.2,14},{-83.2,14},{-70.8,14}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T13.inPlaces[1], inPlaces1) annotation (Line(
            points={{-92.8,14},{-110,14}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P7.outTransition[1], T14.inPlaces[1]) annotation (Line(
            points={{124.8,-122},{131.2,-122}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T14.outPlaces[1], outPlaces1) annotation (Line(
            points={{140.8,-122},{186,-122},{186,-126}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T15.outPlaces[1], P8.inTransition[1]) annotation (Line(
            points={{-7.2,-116},{-7.2,-116},{5.2,-116}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P8.outTransition[1], T16.inPlaces[1]) annotation (Line(
            points={{26.8,-116},{51.2,-116}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T17.outPlaces[1], P9.inTransition[1]) annotation (Line(
            points={{-7.2,-150},{-7.2,-150},{5.2,-150}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P9.outTransition[1], T18.inPlaces[1]) annotation (Line(
            points={{26.8,-150},{50,-152},{49.2,-152},{49.2,-150}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T19.outPlaces[1], P10.inTransition[1]) annotation (Line(
            points={{-9.2,-184},{3.2,-184}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T20.outPlaces[1], P11.inTransition[1]) annotation (Line(
            points={{-9.2,-218},{4,-220},{3.2,-220},{3.2,-218}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T21.outPlaces[1], P12.inTransition[1]) annotation (Line(
            points={{-9.2,-250},{-2,-250},{-2,-252},{3.2,-252}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T22.outPlaces[1], P13.inTransition[1]) annotation (Line(
            points={{-9.2,-284},{-2,-284},{-2,-286},{5.2,-286}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P13.outTransition[1], T26.inPlaces[1]) annotation (Line(
            points={{26.8,-286},{38,-286},{49.2,-286}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P12.outTransition[1], T25.inPlaces[1]) annotation (Line(
            points={{24.8,-252},{49.2,-252}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P11.outTransition[1], T24.inPlaces[1]) annotation (Line(
            points={{24.8,-218},{38,-218},{49.2,-218}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P10.outTransition[1], T23.inPlaces[1]) annotation (Line(
            points={{24.8,-184},{36,-184},{49.2,-184}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(Puffer.outTransition[7], T15.inPlaces[1]) annotation (Line(
            points={{-49.2,13.5417},{-32,13.5417},{-32,-112},{-32,-116},{-16.8,
                -116}},
            color={0,0,0},
            smooth=Smooth.Bezier));

        connect(Puffer.outTransition[8], T17.inPlaces[1]) annotation (Line(
            points={{-49.2,13.625},{-32,13.625},{-32,-150},{-16.8,-150}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(Puffer.outTransition[9], T19.inPlaces[1]) annotation (Line(
            points={{-49.2,13.7083},{-32,13.7083},{-32,-184},{-18.8,-184}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(Puffer.outTransition[10], T20.inPlaces[1]) annotation (Line(
            points={{-49.2,13.7917},{-32,13.7917},{-32,-218},{-18.8,-218}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(Puffer.outTransition[11], T21.inPlaces[1]) annotation (Line(
            points={{-49.2,13.875},{-32,13.875},{-32,-250},{-18.8,-250}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(Puffer.outTransition[12], T22.inPlaces[1]) annotation (Line(
            points={{-49.2,13.9583},{-49.2,-283},{-18.8,-283},{-18.8,-284}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T16.outPlaces[1], P7.inTransition[7]) annotation (Line(
            points={{60.8,-116},{70,-116},{70,-122.458},{103.2,-122.458}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T18.outPlaces[1], P7.inTransition[8]) annotation (Line(
            points={{58.8,-150},{82,-150},{82,-122.375},{103.2,-122.375}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T23.outPlaces[1], P7.inTransition[9]) annotation (Line(
            points={{58.8,-184},{82,-184},{82,-122.292},{103.2,-122.292}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T24.outPlaces[1], P7.inTransition[10]) annotation (Line(
            points={{58.8,-218},{58.8,-170},{103.2,-170},{103.2,-122.208}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T25.outPlaces[1], P7.inTransition[11]) annotation (Line(
            points={{58.8,-252},{82,-252},{82,-122.125},{103.2,-122.125}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T26.outPlaces[1], P7.inTransition[12]) annotation (Line(
            points={{58.8,-286},{82,-286},{82,-122.042},{103.2,-122.042}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P14.outTransition[1], T33.inPlaces[1])
                                                     annotation (Line(
            points={{28.8,-324},{36,-324},{36,-322},{42,-322},{42,-326},{53.2,
                -324}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T27.outPlaces[1], P14.inTransition[1])
                                                     annotation (Line(
            points={{-5.2,-324},{-2,-324},{-2,-322},{2,-322},{2,-324},{7.2,-324}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T28.outPlaces[1], P15.inTransition[1])
                                                     annotation (Line(
            points={{-5.2,-358},{-2,-358},{-2,-356},{2,-356},{2,-358},{7.2,-358}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T29.outPlaces[1], P16.inTransition[1])
                                                     annotation (Line(
            points={{-7.2,-392},{5.2,-392}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T30.outPlaces[1], P17.inTransition[1])
                                                     annotation (Line(
            points={{-7.2,-426},{5.2,-426}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T31.outPlaces[1], P18.inTransition[1])
                                                     annotation (Line(
            points={{-7.2,-458},{-7.2,-460},{5.2,-460}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T32.outPlaces[1], P19.inTransition[1])
                                                     annotation (Line(
            points={{-7.2,-492},{0,-492},{0,-494},{7.2,-494}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P15.outTransition[1], T34.inPlaces[1])
                                                     annotation (Line(
            points={{28.8,-358},{34,-358},{34,-356},{40,-356},{40,-360},{51.2,
                -358}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P16.outTransition[1], T35.inPlaces[1])
                                                     annotation (Line(
            points={{26.8,-392},{26.8,-392},{51.2,-392}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P17.outTransition[1], T36.inPlaces[1])
                                                      annotation (Line(
            points={{26.8,-426},{40,-426},{51.2,-426}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P18.outTransition[1], T37.inPlaces[1])
                                                      annotation (Line(
            points={{26.8,-460},{49.2,-460}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P19.outTransition[1], T38.inPlaces[1])
                                                      annotation (Line(
            points={{28.8,-494},{51.2,-494}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T39.outPlaces[1], P20.inTransition[1])
                                                      annotation (Line(
            points={{-7.2,-524},{-7.2,-524},{5.2,-524}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P20.outTransition[1], T40.inPlaces[1])
                                                      annotation (Line(
            points={{26.8,-524},{51.2,-524}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T41.outPlaces[1], P21.inTransition[1])
                                                      annotation (Line(
            points={{-7.2,-558},{-7.2,-558},{5.2,-558}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P21.outTransition[1], T42.inPlaces[1])
                                                      annotation (Line(
            points={{26.8,-558},{50,-560},{49.2,-560},{49.2,-558}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T47.outPlaces[1],P22. inTransition[1]) annotation (Line(
            points={{-9.2,-592},{3.2,-592}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T48.outPlaces[1],P23. inTransition[1]) annotation (Line(
            points={{-9.2,-626},{4,-628},{3.2,-628},{3.2,-626}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T49.outPlaces[1],P24. inTransition[1]) annotation (Line(
            points={{-9.2,-658},{-2,-658},{-2,-660},{3.2,-660}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(T50.outPlaces[1],P25. inTransition[1]) annotation (Line(
            points={{-9.2,-692},{-2,-692},{-2,-694},{5.2,-694}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P25.outTransition[1],T46. inPlaces[1]) annotation (Line(
            points={{26.8,-694},{51.2,-694}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P24.outTransition[1],T45. inPlaces[1]) annotation (Line(
            points={{24.8,-660},{49.2,-660}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P23.outTransition[1],T44. inPlaces[1]) annotation (Line(
            points={{24.8,-626},{38,-626},{49.2,-626}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(P22.outTransition[1],T43. inPlaces[1]) annotation (Line(
            points={{24.8,-592},{36,-592},{49.2,-592}},
            color={0,0,0},
            smooth=Smooth.Bezier));
        connect(Puffer.outTransition[13], T27.inPlaces[1]) annotation (Line(
            points={{-49.2,14.0417},{-49.2,-321},{-14.8,-321},{-14.8,-324}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[14], T28.inPlaces[1]) annotation (Line(
            points={{-49.2,14.125},{-30,14.125},{-30,-358},{-14.8,-358}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[15], T29.inPlaces[1]) annotation (Line(
            points={{-49.2,14.2083},{-32,14.2083},{-32,-392},{-16.8,-392}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[16], T30.inPlaces[1]) annotation (Line(
            points={{-49.2,14.2917},{-34,14.2917},{-34,-426},{-16.8,-426}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[17], T31.inPlaces[1]) annotation (Line(
            points={{-49.2,14.375},{-49.2,-455},{-16.8,-455},{-16.8,-458}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[18], T32.inPlaces[1]) annotation (Line(
            points={{-49.2,14.4583},{-49.2,-490},{-16.8,-490},{-16.8,-492}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[19], T39.inPlaces[1]) annotation (Line(
            points={{-49.2,14.5417},{-50,14.5417},{-50,-524},{-16.8,-524}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[20], T41.inPlaces[1]) annotation (Line(
            points={{-49.2,14.625},{-38,14.625},{-38,-558},{-16.8,-558}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[21], T47.inPlaces[1]) annotation (Line(
            points={{-49.2,14.7083},{-49.2,-585},{-18.8,-585},{-18.8,-592}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[22], T48.inPlaces[1]) annotation (Line(
            points={{-49.2,14.7917},{-58,14.7917},{-58,-626},{-18.8,-626}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[23], T49.inPlaces[1]) annotation (Line(
            points={{-49.2,14.875},{-24,-532},{-18.8,-658}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(Puffer.outTransition[24], T50.inPlaces[1]) annotation (Line(
            points={{-49.2,14.9583},{-86,14.9583},{-86,-692},{-18.8,-692}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T33.outPlaces[1], P7.inTransition[13]) annotation (Line(
            points={{62.8,-324},{62.8,-225},{103.2,-225},{103.2,-121.958}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T34.outPlaces[1], P7.inTransition[14]) annotation (Line(
            points={{60.8,-358},{84,-358},{84,-128},{103.2,-128},{103.2,-121.875}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(T35.outPlaces[1], P7.inTransition[15]) annotation (Line(
            points={{60.8,-392},{86,-392},{86,-126},{103.2,-126},{103.2,
                -121.792}},
            color={0,0,0},
            smooth=Smooth.None));

        connect(T36.outPlaces[1], P7.inTransition[16]) annotation (Line(
            points={{60.8,-426},{82,-426},{82,-121.708},{103.2,-121.708}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T37.outPlaces[1], P7.inTransition[17]) annotation (Line(
            points={{58.8,-460},{84,-460},{84,-121.625},{103.2,-121.625}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T38.outPlaces[1], P7.inTransition[18]) annotation (Line(
            points={{60.8,-494},{80,-494},{80,-121.542},{103.2,-121.542}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T40.outPlaces[1], P7.inTransition[19]) annotation (Line(
            points={{60.8,-524},{84,-524},{84,-121.458},{103.2,-121.458}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T42.outPlaces[1], P7.inTransition[20]) annotation (Line(
            points={{58.8,-558},{84,-558},{84,-121.375},{103.2,-121.375}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T43.outPlaces[1], P7.inTransition[21]) annotation (Line(
            points={{58.8,-592},{58.8,-358},{103.2,-358},{103.2,-121.292}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T44.outPlaces[1], P7.inTransition[22]) annotation (Line(
            points={{58.8,-626},{58.8,-372},{103.2,-372},{103.2,-121.208}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T45.outPlaces[1], P7.inTransition[23]) annotation (Line(
            points={{58.8,-660},{58.8,-393},{103.2,-393},{103.2,-121.125}},
            color={0,0,0},
            smooth=Smooth.None));
        connect(T46.outPlaces[1], P7.inTransition[24]) annotation (Line(
            points={{60.8,-694},{86,-694},{86,-126},{103.2,-126},{103.2,
                -121.042}},
            color={0,0,0},
            smooth=Smooth.None));

        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-800},
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
                textString="Waiting"),          Text(
                extent={{-4,137},{-4,118}},
                lineColor={0,0,0},
                textString="%name"),            Text(
                extent={{-2,-17},{-2,-34}},
                lineColor={0,0,0},
                textString="d=%delay")}));
      end Waiting;

      model Workload
        Real cap;
        Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-120,0})));
        Integer[3] color;
      protected
        Real help1;
      algorithm
        when  u==0 then
          help1:=time;
          color:={255,0,0};
        elsewhen u>0 then
          cap:=cap + time - help1;
          color:={128,255,0};
        end when;

        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.05),
                         graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor=DynamicSelect({128,255,0},color),
                fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.05)));
      end Workload;

      model TotalNumber
        Integer total;
        Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
              transformation(
              extent={{-20,-20},{20,20}},
              rotation=0,
              origin={-120,0})));

      algorithm
        when u>pre(u) then
          total:=total + (u - pre(u));
        end when;
        annotation (Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.05),
                         graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillColor={170,255,213},
                fillPattern=FillPattern.Solid), Text(
                textString=DynamicSelect(" ",realString(total,0,0)),
                extent={{2,12},{2,-4}},
                lineColor={0,0,0},
                fillColor={170,255,213},
                fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              initialScale=0.05)));
      end TotalNumber;

     annotation (Documentation(info="<html>
<p> Documentation is comming soon.</p> </html>"));
    end PNproBP;
  end Models;

  annotation(uses(ModelicaAdditions(version = "1.5"), Modelica(version="3.2")),   version = "1", conversion(noneFromVersion = ""));
end PNlib;
