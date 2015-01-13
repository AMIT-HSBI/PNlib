within PNlib;
model UserGuide
 extends Modelica.Icons.Information;
  annotation (Documentation(info="<html>
<h1>Extended Hybrid Petri Nets (xHPN)</h1>
<p>
The xHPN formalism comprises of three different processes, called <b>transitions</b>: discrete, stochastic, and continuous transition,
two different states, called <b>places</b>: discrete and continuous places, and four different <b>arcs</b>: normal, inhibition, test, and read arc. The icons of the formalism are shown
in the following figure.
</p>

<p><img src=\"Resources/Images/iconsxHPNklein.png\"></p>

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
e.g. for firing conditions or speed functions. </p>
<p>
If a place is connected to a transition by a test arc, the marking of the place must be greater than the arc weight to enable firing. If a place is connected to a transition by an inhibitor
arc, the marking of the place must be less than the arc weight to enable firing. In both cases the markings of the places are not changed by fining.
</p>
<h3>Example: Arcs of xHPNs</h3>
<p>
The Petri nets at top contain test arcs and the Petri nets at the bottom inhibitor arcs.
Transition T1 is active with regard to a concrete marking m because the token number of P2 is above the weight of the test arc (m(P2)=3&gt;f(P2&rarr;T1)=2).
However, T2 is not active because the marking of P5 is less than the arc weight (m(P5)=1&lt;f(P5&rarr;T2)=2). T3 is also not active because the token number of P8 is
greater than the weight of the inhibitor arc (m(P8)=3&gt;f(P8&rarr;T3)=2). However, T4 is active because the marking of P11 is less than the arc weight (m(P11)=1&lt;f(P11&rarr;T4)=2).
</p>

<p><img src=\"Resources/Images/arcsforma.png\"></p>

<p>
The <b>conversion</b> of a discrete to a continuous marking is realized by connecting a discrete transition to a continuous place and the conversion from a continuous to a discrete marking is
realized by connecting a continuous place to a discrete transition. However, the conversion is always performed by discrete transitions, discrete places can only influence the time
when continuous transitions fire but their marking cannot be changed during the firing process.</p>

<h3>Example: Basic concepts of hybrid Petri nets</h3>
<p>The figure shows examples of these two basic principles:</p>
<ul>
<li>T1 can only fire when P1 has more than zero marks and P3 has at least one mark,</li>
<li>T2 can only fire when P4 has at least one mark and P6 has at least 5.4 marks,</li>
<li>T3 fires by removing one mark from P7 and adding 1.8 marks to P8</li>
<li>T4 fires by removing 0.8 marks from P9 and adding one mark to P10.</li>
</ul>

<p><img src=\"Resources/Images/hybridPNklein.png\"></p>

<p>
It is important to mention that a discrete transition fires always in a discrete manner by removing and adding marks after a delay is passed regardless of whether a
discrete or a continuous place is connected to it. However, a continuous transition fires always by a continuous flow so that a discrete place can only be connected to
continuous transition if it is input as well as output of the transition with arcs of same weight. In this way the continuous transition can only be <b>influenced</b> by a discrete
place but the discrete marking cannot be changed by continuous firing.</p>
<p>Summarized, an xHPN comprises of:</p>
<ul>
<li>        discrete and continuous places,</li>
<li>        discrete, stochastic, and continuous transitions,</li>
<li>        places can be connected to transitions by normal, test, inhibitor, and read arcs while transitions can only be connected to places by normal arcs,</li>
<li>        arc weights can be functions depending on markings and/or time,</li>
<li>        discrete place must be input as well as output of continuous transitions with arcs of same weights,</li>
<li>        places can be provided with minimum and maximum capacities,</li>
<li>        discrete transitions can be provided with delays,</li>
<li>        stochastic transitions can be provided with hazard functions depending on markings,</li>
<li>        continuous transitions can be provided with maximum speed function depending on markings and/or time, and</li>
<li>        all transitions can be provided with additional firing conditions depending on all possible model variables.</li>
</ul>
<p>A formal definition of the xHPN-formalism and the corresponding processes is given in [Proß et al.2012].</p>
<h2>Possible conflicts in xHPNs</h2>
<h3>Type-1-Conflict</h3>
<p>Several conflicts can occur when the places have to enable their connected active transitions. Possibly, a discrete place or a continuous place connected to discrete
transitions has not enough marks to enable all output transitions simultaneously or cannot receive marks from all active input transitions due to the maximum capacity.
Then an actual conflict arises that has to be resolved. This can be either done by providing the transitions with <b>priorities</b> or <b>probabilities</b>.
In the first case, a deterministic process decides which place enables which transitions and in the second case the enabling is performed at random;
thereby transitions assigned with a high probability are chosen preferentially.</p>
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

<p><img src=\"Resources/Images/type1klein.png\"></p></p>

<h3>Type-2-Conflict</h3>
<p>Another conflict can occur between a continuous place and two or more continuous transitions when the input speed is not sufficient to fire all output transitions with the instantaneous speed
(type-2-output-conflict) or when the output speed is not sufficient to fire all input transitions with the instantaneous speed (type-2-input-conflict).
 This conflict is solved by sharing the speeds proportional to the assigned maximum speeds (see [Proß2012]).</p>
<h4>Example</h4>
<p>
The left Petri net has no actual conflict but P2 and P3 of the right Petri net have an actual conflict. Their input speed is not sufficient to fire T5 and T6 with the respective speed.
</p>

<p><img src=\"Resources/Images/type2.png\"></p>

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

<p><img src=\"Resources/Images/type3.png\"></p>

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

<p><img src=\"Resources/Images/type4.png\"></p>

<h1> PNlib: A Modelica Library for Modeling xHPN </h1>
<p><b>IMPORTANT:</b></p>
<ul>
<li>the PNlib works only with Dymola</li>
</ul>
<p>The advanced Petri Net library, called PNlib, enables the modeling of extended hybrid Petri Nets (xHPN).
It comprises</p>
<ul>
<li> a discrete (PD) and a continuous place (PC),</li>
<li> a discrete (TD), a stochastic (TS), and a continuous transitions (TC), and</li>
<li> a test (TA), an inhibitor (IA), and a read arcs (RA).</li>
</ul>
<p>The main package PNlib is divided into the following sub-packages:</p>
<ul>
<li>Interfaces: contains the connectors of the Petri net component models.</li>
<li>Blocks: contains blocks with specific procedures that are used in the Petri net component models.</li>
<li>Functions: contains functions with specific algorithmic procedures which are used in the Petri net component models.</li>
<li>Constants: contains constants which are used in the Petri net component models.</li>
<li>Models: contains several examples and offers the possibility to structure further Petri net models.</li>
</ul>
<p>
Additionally, the package contains the component <b>settings</b> which enables the setting of
global parameters for the display and animation of a Petri net model:</p>
<ul>
<li> showPlaceName: displays the names of places,</li>
<li> showTransitionName: displays the names of transitions,</li>
<li> showDelay: displays the delays of discrete transitions,</li>
<li> showCapacity: displays the minimum and maximum capacities of places,</li>
<li> showWeightTIarc: displays the arc weights of test and inhibitor arcs,</li>
<li> animateMarking: animates the current marking in the places; the change of</li>
<li> tokens/marks is displayed in the places during animation,</li>
<li> animatePlace: animates the color of places. Places change their degree of redness</li>
according to the amount of tokens/marks; thereby, the redness degree is scaled by the
parameter scale from 0 to 100,</li>
<li> antimateTransition: animates the color of transitions. Transitions change their color
to yellow when they fire; thereby, discrete transitions blink yellow for specified time units
(timeFire) while continuous transitions are yellow the whole time when they fire,</li>
<li> animatePutFireTime: animates the putative firing time of stochastic transitions; the
putative firing time is displayed under the transition during animation,</li>
<li> animateHazardFunc: animates the hazard function of stochastic transitions; the hazard
function is displayed under the transition during animation,</li>
<li> animateSpeed: animates the instantaneous speed of continuous transitions; the
instantaneous speed is displayed under the transition during animation,</li>
<li> animateWeightTIarc: animates the weights of threshold and inhibition arcs; the
weights are displayed under the arc during animation,</li>
<li> animateTIarc: animates the color of test and inhibitor arcs; the arc is green when the
weight is satisfied and red otherwise,</li>
</ul>
<p>
Places, transitions, and arcs are represented by the icons depicted in the figure. Thereby, the
discrete place is represented by a circle and the continuous place by a double circle. The
transitions are boxes which are black for discrete transitions, black with a white triangle for
stochastic transitions, and white for continuous transitions. The test arc is represented by a
dashed arc, the inhibitor arc by an arc with a white circle at its end, and the read arc by an arc
with a black square at its end.
</p>

<p><img src=\"Resources/Images/iconsklein.png\"></p>

<h2>Connectors</h2>
<p> The PNlib contains four different connectors: PlaceOut, PlaceIn, TransitionOut, and TransitionIn.
The connectors PlaceOut and PlaceIn are part of place models and connect them to output and input transitions, respectively.
Similar, TransitionOut and TransitionIn are connectors of the transition model and connect them to output and input places, respectively.
The figure shows which connector belongs to with Petri net component model.</p>

<p><img src=\"Resources/Images/connectorsklein.png\"></p>

<p>The connectors of the Petri net component models are vectors to enable the connection to an arbitrary number of input and output components.
Therefore, the dimension parameters nIn and nOut are declared in the place and transition models with the connectorSizing annotation.</p>
<h2>Places</h2>
<p>Parameters and modification possibilities of discrete (d) and continuous (c) places:</p>
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
<p>If the type-1-conflict is resolved by priorities, the corresponding priorities of the transitions are given by the indices of the connections,
i.e. the transition connected to the place with the index 1 has also the priority 1, the transition connected to the place with the index 2 has also the priority 2 etc.
Otherwise, if the probabilistic enabling type is chosen, the corresponding probabilities for the transitions have to be entered as a vector
(numbers separated by commas within braces). Thereby, the first vector element corresponds to the connection with the index 1, the second to the connection with the index 2 etc.
The input of enabling probabilities as vectors in the place model, and not at the corresponding arcs, is necessary due to the fact that properties cannot be assigned to
connections according to the Modelica Specification 3.2.</p>
<h3>Example: Input of enabling probabilities</h3>
<p>Place P1 is connected to the transitions T1, T2, and T3 and the connection to T1 is indexed by 1, the connection to T2 is indexed by 2,
and the connection to T3 is indexed by 3. Thus, the corresponding connect-equations are
connect(P1.outTransition[1], T1.inPlaces[1]);
connect(P1.outTransition[2], T2.inPlaces[1]);
connect(P1.outTransition[3], T3.inPlaces[1]);
The enabling probabilities 0.3 for T1, 0.25 for T2, and 0.45 for T3 have to be entered by the parameter vector
enablingProbOut={0.3,0.25,0.45}.</p>

<p><img src=\"Resources/Images/enablingprobklein.png\"></p>

<h3>Implementation</h3>
<p>The main process in the place model is the recalculation of the marking after firing
a connected transition. In the case of the discrete place model, this is realized by the
discrete equation</p>
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
Transitions can also be provided with additional conditions that have to be satisfied to permit the activation. The condition</p>
<p>
firingCon = time>9.7
</p>
<p>
causes that the transition cannot be activated as long as time is less than 9.7.
</p>

<p><img src=\"Resources/Images/inputarcweightsklein.png\"></p>

<h3>Example: Input of maximum speed functions</h3>
<p>
The figure shows two continuous Petri nets. Transition T1 has a maximum speed function which depends on the makings of P1 and P2.
The input of this function to the property dialog or as modification equation is performed by the expression
</p>
<p>
maximumSpeed = 0.75*P1.t*P2.t,
</p>
<p>
whereby P1.t and P2.t accesses the marks of P1 and P2, respectively. Transition T2 has a maximum speed function that depends on time and can be entered by the expression
</p>
<p>
maximumSpeed = <b>if</b> time&le;6.5 <b>then</b> 2.6 <b>else</b> 1.7.
</p>

<p><img src=\"Resources/Images/inputmaximumspeedklein.png\"></p>

<h3>Implementation</h3>
<p>
Based on the current markings of the places, it is checked in the transition model by an algorithmic procedure if the transition can become active.
discrete transition waits then as long as the delay is passed and a stochastic transition waits till the next putative firing time is reached.
Based on this information the places enable some of the active transition to fire.
At this point, several conflicts can occur which have to be resolved appropriately by the methods mentioned in [Proß2012] to get a successful and reliable simulation.
When a transition is enabled by all its connected places, it is firable and reports this via the connector variable fire to the connected places.
The places recalculate then their markings based on this information.
</p>
<h2>Arcs</h2>
<p>
xHPNs comprise four different kinds of arcs: normal, test, inhibitor, and read arc. The Modelica language do not support the assignment of properties
to arcs that are generated by connect equations. Due to that fact, the test, inhibitor, and read arcs are realized by component models which are interposed between places
and transitions (see figure); the normal arc is simply generated by the connect equation. Test and inhibitor arc can be normal arcs simultaneously.
</p>

<p><img src=\"Resources/Images/arcsklein.png\"></p>

<p>
Parameters of test and inhibitor arcs (read arcs have no parameters)
</p>
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

<h2>Animation</h2>
<p>
A possibility to represent the simulation results of an xHPN model is an animation.
Thereby, several settings can be made in the property dialog of the settings-box. These settings are global and, thus, affect all components of the Petri net model.
By using the prefixes inner and outer, it is achieved that the settings are common to all Petri net components of a model.
The settings-box provides several display and animation options mentioned before.
The animation toolbar allows the control of the animation. An animation offers a way to analyze the marking evolutions of large and complex xHPNs.
The figure shows four selected points in time of the animation of an xHPN example.
</p>

<p><img src=\"Resources/Images/animationklein.png\"></p>

<p>
All display and animation options are realized with the DynamicSelect annotation.
</p>
<h2>Connection to Matlab/Simulink</h2>
<p>
To simulate the established xHPN model several times with different parameter settings and use the arising simulation results
for parameter estimation, sensitivity analysis, deterministic and stochastic hybrid simulation, or process optimization (see [Proß2012]),
the Modelica models in Dymola are connected to Matlab/Simulink. This is realized with the aid of a Dymola interface in Simulink and
a set of Matlab m-files utilities [Dynasim201]. All markings which should be available in Matlab have to be declared with the
prefix output on the highest level. This is achieved by creating a connector of the output connector
at the top of the place icon. In the case of discrete places it is an orange IntegerOutput connector and in the case of continuous places
it is a blue RealOutput connector. In the figure above the markings of P1, P3, P5, and P6 are available in Matlab.
</p>

<p><img src=\"Resources/Images/simulink.png\"></p>

</html>"));
end UserGuide;
