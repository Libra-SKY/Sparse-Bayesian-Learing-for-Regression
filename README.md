# Sparse-Bayesian-Learing-for-Regression with Monte Carlo Error Measurement


This repository contains code for solving the regression problem using Sparse Bayesian Learning (SBL) algorithm.

## Problem Statement

The problem is to estimate a weight vector `w` given input feature vector `x` and target vector `t` such that `t = Phi*w + noise` where `Phi` is a matrix of size NxM and `noise` is a Gaussian noise with variance `sigma^2`.

## Solution Approach

SBL algorithm can be used to estimate `w` in a sparse and efficient way. The steps involved in SBL algorithm are:

1. Initialize `w` to zero.
2. Update `w` using SBL algorithm until convergence is reached.
3. Compute the NMSE of the estimated `w`.

## Code Explanation

The `sbl_regression.m` file contains the code for solving the above problem. The code reads as follows:

1. Set the problem parameters, such as number of input features `N`, number of basis functions `M`, and sparsity level of weight vector `D`.
2. Set the prior mean of weights `a` and prior precision `b`.
3. Generate a random sparse weight vector `w` of size Mx1 with D non-zero elements.
4. Generate a random matrix `Phi` of size NxM and a noise vector `n` of size Nx1 with variance `sigma^2`.
5. Update the weight vector `w` using SBL algorithm until convergence is reached.
6. Compute the NMSE of the estimated `w` using the formula `norm(w_new-w)^2/norm(w)^2`.
7. Repeat steps 3 to 6 `num_runs` times and average the NMSE over `num_runs` to get the final result.
8. Plot the NMSE vs Noise Variance graph.

## Usage

To use the code, simply run the `sbl_regression.m` file in MATLAB. The code contains all the necessary parameters and can be customized as needed.

## References

1. Tipping, M. E. (2001). Sparse Bayesian learning and the relevance vector machine. The Journal of Machine Learning Research, 1, 211-244.

2. Bishop, C. M. (2006). Pattern recognition and machine learning (Vol. 1). springer.
