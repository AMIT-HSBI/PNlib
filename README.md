# PNlib
Free library for Modeling xHPN

## Library description

The advanced Petri Net library, called PNlib, enables the modeling of extended hybrid Petri Nets (xHPN). It comprises
 * a discrete (PD) and a continuous place (PC),
 * a discrete (TD), a stochastic (TS), and a continuous transitions (TC), and
 * a test (TA), an inhibitor (IA), and a read arcs (RA).

The main package PNlib is divided into the following sub-packages:

 * Interfaces: contains the connectors of the Petri net component models.
 * Blocks: contains blocks with specific procedures that are used in the Petri net component models.
 * Functions: contains functions with specific algorithmic procedures which are used in the Petri net component models.
 * Constants: contains constants which are used in the Petri net component models.
 * Models: contains several examples and offers the possibility to structure further Petri net models.

## Current release

Download [PNlib v1.0 (2012-05-15)](../../archive/v1.0.zip)

#### Release notes

* [Version v1.1](../../archive/v1.1.zip) (2015-01-13)
  * This is basically an adaption of PNlib version 1.0 to Modelica 3.3 to remove tool dependencies (e.g. impure instead of __Dymola_pure annotation).
  * New function PNlib.Functions.Random.initRandom is introduced to make stochastic simulations reproducible.
* [Version v1.0](../../archive/v1.0.zip) (2012-05-15)
  * Initial release.

## License

This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).

## Development and contribution
    University of Applied Sciences Bielefeld
    Department of engineering and mathematics
    33609 Bielefeld - Germany
    http://www.fh-bielefeld.de/ammo
* Sabrina Pro&szlig;
* Lennart Ochel
* Timo Kleine-Döpke
* Bernhard Bachmann

You may report feedback, issues or feature-requests using the [Issues](../../issues) button.
