# PNlib
Free Modelica library for modelling xHPN.

## Library description
The advanced Petri Net library, called PNlib, enables the modeling of extended hybrid Petri Nets (xHPN). It comprises
 * discrete (PD) and continuous places (PC),
 * discrete (TD), stochastic (TS), and continuous transitions (TC), and
 * test (TA), inhibitor (IA), and read arcs (RA).

![iconsxHPN](PNlib/Resources/Images/iconsxHPN.png "xHPN: Extended Hybrid Petri Nets")

The main package PNlib is divided into the following sub-packages:
 * _Interfaces_: contains the connectors of the Petri net component models.
 * _Blocks_: contains blocks with specific procedures that are used in the Petri net component models.
 * _Functions_: contains functions with specific algorithmic procedures which are used in the Petri net component models.
 * _Constants_: contains constants which are used in the Petri net component models.
 * _Examples_: contains several examples and unit tests.

## Current release
Download [PNlib v2.2 (2019-10-24)](../../archive/v2.2.zip)

## Compatibility
* Works in OpenModelica (latest release) ([trend](http://libraries.openmodelica.org/branches/history/master/PNlib.svg), [coverage](http://libraries.openmodelica.org/branches/master/PNlib/PNlib.html))
* Works in Dymola 2017/2019/2020

## License
This Modelica package is free software and the use is completely at your own risk;
it can be redistributed and/or modified under the terms of the [Modelica License 2](https://modelica.org/licenses/ModelicaLicense2).

## Development and contribution
    University of Applied Sciences Bielefeld
    Department of engineering and mathematics
    33619 Bielefeld - Germany
* Sabrina Pro&szlig;
* Lennart Ochel
* Timo Lask
* Bernhard Bachmann

You may report feedback, issues or feature-requests using the [Issues](../../issues) button.
