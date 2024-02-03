# PNlib

[![Test][test-badge]][test-link]

Free Modelica library for modelling xHPN.

## Library description

The advanced Petri Net library, called PNlib, enables the modeling of extended
hybrid Petri Nets (xHPN). It comprises

  * discrete (PD) and continuous places (PC),
  * discrete (TD), stochastic (TS), and continuous transitions (TC), and
  * test (TA), inhibitor (IA), and read arcs (RA).

![iconsxHPN][pnlib-img]

The main package PNlib is divided into the following sub-packages:

  * _Interfaces_: contains the connectors of the Petri net component models.
  * _Blocks_: contains blocks with specific procedures that are used in the Petri
    net component models.
  * _Functions_: contains functions with specific algorithmic procedures which
    are used in the Petri net component models.
  * _Constants_: contains constants which are used in the Petri net component
    models.
  * _Examples_: contains several examples and unit tests.

## Current release

Download [PNlib v2.2 (2019-10-24)][release-v-2-2]

## Compatibility

  * Coverage with OpenModelica master and latest PNlib release:

    ![Pnlib omc-master](https://libraries.openmodelica.org/branches/history/master/PNlib.svg)

  * OpenModelica coverage reports:

      * Release: [Nightly coverage reports][coverage-link]
      * Master: [Latest commit][gh-pages-link]

  * Works in Dymola 2017/2019/2020

## License

This package is licensed with the [3-Clause BSD License](./LICENSE).

## Development and contribution

```
Hochschule Bielefeld – University of Applied Sciences and Arts
Faculty of Engineering and Mathematics
```

  * Sabrina Pro&szlig;
  * Lennart Ochel
  * Timo Lask
  * Bernhard Bachmann

You may report feedback, issues or feature-requests using
[GitHub Issues][issues].

[test-badge]: https://github.com/AMIT-HSBI/PNlib/actions/workflows/Test.yml/badge.svg
[test-link]: https://github.com/AMIT-HSBI/PNlib/actions/workflows/Test.yml
[pnlib-img]: PNlib/Resources/Images/iconsxHPN.png "xHPN: Extended Hybrid PetriNets"
[release-v-2-2]: https://github.com/AMIT-HSBI/PNlib/releases/tag/v2.2
[coverage-link]: http://libraries.openmodelica.org/branches/master/PNlib/PNlib.html
[license-link]: https://modelica.org/licenses/ModelicaLicense2
[issues]: https://github.com/AMIT-HSBI/PNlib/issues
[gh-pages-link]: https://amit-hsbi.github.io/PNlib/stable/PNlib_master/PNlib_master.html
