rad2deg = 180/pi;
deg2rad = pi/180;
a_1 = 2.87;
a_2 = -0.65;

V_g = 637/3.6;
g = 9.81;
d = 2*deg2rad;
zeta_X = 0.8;
zeta_phi = 0.707;
k_i_phi = 0;
k_p_phi = -5/3;
k_i_x = 0.195;

large_step = 30;

w_n_phi = sqrt(a_2*k_p_phi);
w_n_x = w_n_phi/10;
k_d_phi = (2*zeta_phi*w_n_phi-a_1)/a_2;
k_p_x = 2*zeta_X*w_n_x*V_g/g;

A = [-0.322     0.052   0.028   -1.12   0.002;
     0          0       1       -0.001  0;
     -10.6      0       -2.87   0.46    -0.65;
     6.87       0       -0.04   -0.32   -0.02;
     0          0       0       0       -10];
 
B = [0; 0; 0; 0; 10];
 
C = [0 0 0 1 0;
      0 0 1 0 0;
      1 0 0 0 0;
      0 1 0 0 0];
  
D = zeros(4, 1);
  
%%%%%%%%%%%%%%%%%%%
% Added in part 2

step_size = 0.001 % [s]
A_kal = A(1:4, 1:4)
B_kal = A(1:4,5)
C_kal = [0 0 0 1;
         0 0 1 0;
         0 1 0 0];
  
D_kal = zeros(3, 1);

Q =[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1] * 10^-6;

r_noise_var = 0.2; % (deg/s)^2 
p_noise_var = 0.5; % (deg/s)^2
phi_noise_var = 2; % (deg)^2

R = [r_noise_var 0 0;
    0 p_noise_var 0;
    0 0 phi_noise_var];


P =[1 0 0 0;
    0 1 0 0;
    0 0 1 0;
    0 0 0 1];

E = 0;
x_hat_init = [0;
         0;
         0;
         0];
x_hat = x_hat_init;
     
% Simmulate and plot
sim('autopilot3d');

p = plot(to_print);
title('Course and aileron angle')
l = legend('$\chi^c$', '$\chi$', '$\delta_a$');
set(l,'Interpreter','latex');
set(p,'LineWidth', 1.7)

xlabel('t')


