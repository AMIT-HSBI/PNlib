package PNlib
  annotation(
    uses(Modelica(version = "4.0.0")),
    version = "3.0.0",
    Documentation(info = "<html>
    <p>Free Modelica library for modelling xHPN.</p>
    <h2 id=\"library-description\">Library description</h2>
    <p>The advanced Petri Net library, called PNlib, enables the modeling of extended
      hybrid Petri Nets (xHPN). It comprises</p>
    <ul>
      <li>discrete (PD) and continuous places (PC),</li>
      <li>discrete (TD), stochastic (TS), and continuous transitions (TC), and</li>
      <li>test (TA), inhibitor (IA), and read arcs (RA).</li>
    </ul>
    <p><img src=\"modelica://PNlib/Resources/Images/iconsxHPN.png\" alt=\"iconsxHPN\" title=\"xHPN: Extended Hybrid PetriNets\"></p>
    <p>The main package PNlib is divided into the following sub-packages:</p>
    <ul>
      <li><em>Interfaces</em>: contains the connectors of the Petri net component models.</li>
      <li><em>Blocks</em>: contains blocks with specific procedures that are used in the Petri
        net component models.</li>
      <li><em>Functions</em>: contains functions with specific algorithmic procedures which
        are used in the Petri net component models.</li>
      <li><em>Constants</em>: contains constants which are used in the Petri net component
        models.</li>
      <li><em>Examples</em>: contains several examples and unit tests.</li>
    </ul>
    <h2 id=\"license\">License</h2>
    <p>This package is licensed with the <a href=\"https://github.com/AMIT-HSBI/PNlib/blob/v3.0.0/LICENSE\">3-Clause BSD License</a>.</p>
    <h2 id=\"development-and-contribution\">Development and contribution</h2>
    Hochschule Bielefeld - University of Applied Sciences and Arts<br>
    Faculty of Engineering and Mathematics
    <ul>
      <li>Sabrina Proß</li>
      <li>Lennart Ochel</li>
      <li>Timo Lask</li>
      <li>Bernhard Bachmann</li>
    </ul>
    <p>You may report feedback, issues or feature-requests using
      <a href=\"https://github.com/AMIT-HSBI/PNlib/issues\">GitHub Issues</a>.
    </p>
    </html>")
  );
end PNlib;
