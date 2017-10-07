a_1 = 2.87;
a_2 = -0.65;

V_g = 637/3.6;
g = 9.81;

zeta_X = 0.8;
zeta_phi = 0.707;
k_i_phi = 0;
k_p_phi = -5/3;
k_i_x = 0.195;

w_n_phi = sqrt(a_2*k_p_phi);
w_n_x = w_n_phi/10;
k_d_phi = (2*zeta_phi*w_n_phi-a_1)/a_2;
k_p_x = 2*zeta_X*w_n_x*V_g/g;

sim('autopilot2e')

p = plot(X.time, [Xc.Data, X.Data, d_a.Data]);
title('Course and aileron angle')
l = legend('$\chi^c$', '$\chi$', '$\delta_a$');
set(l,'Interpreter','latex');
set(p,'LineWidth', 1.7)

xlabel('t')