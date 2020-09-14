---
title: "Pi Cluster case with 5 PI's"
linkTitle: "Cluster Case (5 Pi's)"
weight: 30
description: >
  A case for 5 PIs.
---

## Cluster Case With Cooling (5 Pi's) {#temp-cluster}

Many instructions on the Web exist describing how to build clusters with
3 or more Pi's. One of the considerations that we have to think about is
that we may run rather demanding applications on such clusters causing
heat issues. To eliminate them we must provide proper cooling. In some
cluster projects cooling is not adequately addressed. Hence we like to
provide an example that discusses in detail how to add a fan and what
the fan has for an impact on the temperature.

![Closed case for 5 Pi's with case](../images/IMG16_6273_sweb.jpg)

* <http://climbers.net/sbc/add-fan-raspberry-pi/>
* <http://climbers.net/sbc/diy-raspberry-pi-3-cluster/>

From the previous Web page we find the following information as shown in
the following table. From the data in the table it is clear that we
need to keep the Pi from throttling while being in a case by adding a
fan as obvious from experiment No. 2.


Table: Temperature comparison of fan impact


No.   Case   Fan   Direction   RPM      Idle    100% Load   Performance
----- ------ ----- ----------- -------- ------- ----------- -------------
1     no     no    -           -        41.0C   75.5C       OK (barely)
2     yes    no    -           -        45.0C   82.5C       throttles
3     yes    5V    in          unknown   37.9C   74.5C       OK (barely)
4     yes    7V    in          800      35.6C   69.5C       OK
5     yes    12V   in          1400     32.5C   61.1C       OK
6     yes    7V    out         800      34.5C   66.4C       OK

Interesting is also the design of the case that uses snaps instead of
screws to affix the walls to each other. The case layout can be found at:

* <http://climbers.net/sbc/diy-raspberry-pi-3-cluster-2017/>
