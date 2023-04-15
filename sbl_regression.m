clc; clearvars; close all;

% This code contains the all code for the 5 questions
% I have calculated to get the maximum aposterior estimate of the
% weight vector w, but since there are lot of w_new, I have not plotted
% them separately but printing them in the terminal. You can keep track of 
% code with corresponding comments
% with each line of code

N = 20;                                         % number of input features
M = 40;                                         % number of basis functions
D = 7;                                          % sparsity level of weight vector

num_runs = 1000;                                % number of runs for Monte Carlo error measurement

noise_variance_dB = [-20, -15, -10, -5, 0]';      % noise variance in dB
sigma = sqrt(10.^(noise_variance_dB./10));       % convert noise variance to linear scale

nmse = zeros(length(noise_variance_dB),num_runs); % normalized mean squared error of size 5xnum_runs

tolerance = 1e-3;                               % tolerance limit for convergence
a = 0;                                          % prior mean of weights (SBL hyperparameters) used in alpha
b = 1e-6;                                       % prior precision (inverse variance) of weights

for index = 1:length(sigma)
    
    alpha = 100*eye(M);                        % set alpha = 100*I
    gamma=zeros(M,1);                          % initializing gamma and S
    S = zeros(M,M);

    for j = 1:num_runs                         % monte carlo loop for error averaging
        
        w = zeros(M,1);                        % initialize w to zero
        rand_index = randi(M, [D,1]);           % random D index from W of size Mx1
        w(rand_index) = randn(D,1);             % randomly assign D indices to Gaussian weights

        phi= randn(N,M);                        % generate NxM Gaussian matrix
        n = sigma(index)*randn(N,1);            % generate noise with variance sigma^2

        t = phi*w + n;                          % calculate t matrix

        w_old = w;                              % variable to keep previous w

    
        while 1                                 % loop until convergence

            S = ((phi'*phi)/(sigma(index)^2)+alpha)\eye(M,M);   % calculate posterior covariance S using equation 12
            w_new = (S*phi'*t)/(sigma(index)^2);                % calculate posterior mean w_new using equation 13
            
            if norm(w_old - w_new) <= tolerance * norm(w_old)   % check for convergence
                break;
            end
    
            for i = 1:M                                        % loop for computing individual elements of alpha and gamma
                gamma(i) = 1-alpha(i,i)*S(i,i);                % calculate gamma using equation 17
                alpha(i,i) = (gamma(i)+2*a)/((w_new(i)^2)+2*b); % calculate alpha using equation 44 given in Appendix A.2.1
            end
        
            w_old = w_new;                                     % update w_old
        end

        %  w_new is MAP estimate  %

        fprintf("%d\n",w_new);                                 % print the estimated weight vector
        fprintf("\n next w \n\n");

        % Compute NMSE
        error = norm(w_new-w)^2 / norm(w)^2;                   % calculate normalized MSE 
        nmse(index,j) = error;                                
    end    

end

nmse_mean = mean(nmse, 2);                          % NMSE mean over num_runs

figure;                                             % 5th part
plot(noise_variance_dB, nmse_mean, '-o');
xlabel('Noise variance (dB)');
ylabel('Normalized Mean Squared Error (NMSE)');
title('NMSE vs Noise Variance');

