within PNlib.Examples.Models;
package Senseo "Model of a Senseo coffee machine"
  extends Modelica.Icons.ExamplesPackage;


annotation (Documentation(info="<html>
<h1>Background</h1>
<p>
A model of a Senseo coffee machine is presented. The main feature of a Senseo coffee machine is that the coffee is placed in the machine
in a pre-portioned form by so-called coffee pads. One pad is generally used to make one cup of coffee (125°ml) and two pads reach for two cups at 125 ml or one big cup at 250 ml.
After a warm-up time of about 60 seconds and the insertion of a coffee pad, the coffee can be made. In this warm-up phase, the water is heated at 90°C and then pressed with a pressure
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
      The maximum temperature of the water is 90°C.</td>
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
    <td>When the water reaches a temperature of 90°C, the user can chose if he wants one or two cups of coffee.
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
  <img src=\"modelica://PNlib/Resources/Images/senseotop.png\">
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
  <img src=\"modelica://PNlib/Resources/Images/senseo.png\">
</p>
<p>
The following figure shows one possible result for simulating the Senseo machine 5 hours.
It has to mentioned that every simulation result is different due to the included stochastic effects (starting the machine, inserting coffee pads,
choosing one or two coffees, stopping the machine or producing another coffee).
</p>
<p>
  <img src=\"modelica://PNlib/Resources/Images/senseoresults.png\">
</p>
</html>"));
end Senseo;
