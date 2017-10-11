y = [1, 2, 3];
r_noise_var = 0.2; % (deg/s)^2 
p_noise_var = 0.5; % (deg/s)^2
phi_noise_var = 2; % (deg)^2

vars = [r_noise_var; p_noise_var; phi_noise_var];
randn(1,3)
y_noise = y + randn(1,3)* sqrt(vars)