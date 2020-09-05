r2servo - R to servo
================

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

Control your Raspberry Pi’s servo from R.

**Note:** This package and README was only tested with the SG90 servo
motor.

**Acknowledgments:** This package imports the
[gpiozero](https://gpiozero.readthedocs.io/) Python library.

## Installation

`r2servo` is currently only available as a GitHub package.

To install it run the following from an R console:

``` r
if (!require("remotes")) {
  install.packages("remotes")
}
remotes::install_github("jcrodriguez1989/r2servo", dependencies = TRUE)
```

## Prerequisites

### Servo Connection

Please make sure that your servo is correctly connected to your
Raspberry Pi. Take note to which GPIO pin is your servo connected.

## Usage

In this example, the servo is connected to the GPIO14 pin:

``` r
# Load the library.
library("r2servo")
# Get a servo instance (by default, the initial position is 0, i.e. middle).
servo <- get_servo(14)
# Read the actual position (should be 0).
get_position(servo)
# Move it to its maximum position (1).
set_position(servo, 1)
```
