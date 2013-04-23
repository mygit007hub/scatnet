
% load lena
x = lena;

tic;
% compute filter bank
filters = morlet_filter_bank_2d(size(x));
toc;
%%
options.antialiasing = 0;
tic;
[x_phi, x_psi] = wavelet_2d(x, filters, options);
toc;
% compute energy
energy_x = sum(x(:).^2);
energy_Wx = sum(x_phi(:).^2) + sum(cellfun(@(x)(sum(abs(x(:).^2))),x_psi));