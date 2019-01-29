Nuclear penalized multinomial regression
========================================

NPMR is an adaptation of multinomial regression which leverages latent
structure between the outcome classes to improve probability predictions.
Vanilla multinomial regression assumes no relationship between outcome classes.
The classes compete because their probabilities must sum to one, but no effort
is made to learn which classes tend to co-occur. NPMR learns this latent
structure by applying a penalty to the nuclear norm of the regression
coefficient matrix.

Currently, this repo includes source code for the CRAN package `npmr` and
slides from Scott Powers' presentation at the 2016 Joint Statistical Meetings
in Chicago: *Nuclear penalized multinomial regression for predicting at bat
outcomes in baseball*.
The full paper is available at https://arxiv.org/abs/1706.10272.

