# Sparse-Bayesian-Learing-for-Regression with Monte Carlo Error Measurement



This code implements the Sparse Bayesian Learning (SBL) algorithm to solve a regression problem, based on the model described by Tipping in his paper. Monte Carlo error measurement is used to evaluate the performance of the model.

## Code

The code is written in MATLAB and can be found in the following file: `sbl_regression.m`.

## Simulation Parameters

- `num_runs`: number of independent runs (default = 10)
- `rng_seed`: random seed for reproducibility (default = 123)
- `N`: number of data points (default = 20)
- `M`: number of features (default = 40)
- `D0`: sparsity level (default = 7)
- `noise_variances`: noise variances (in dB) (default = [-20, -15, -10, -5, 0])
- `a`: prior mean of weights (default = 0)
- `b`: prior precision (inverse variance) of weights (default = 1e-6)
- `gamma`: regularization parameter for alpha (default = 1e-6)

## Output

The code outputs a plot of the Normalized Mean Squared Error (NMSE) vs. the noise variance (in dB) for each run. The mean and standard deviation of the NMSE across all runs are also computed and displayed.

## Usage

To run the code, simply run the `sbl_regression.m` script in MATLAB. You can modify the simulation parameters in the script to customize the experiment.

