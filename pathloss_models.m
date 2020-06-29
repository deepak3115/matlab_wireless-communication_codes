% plot_PL_general.m
clc;
clear all;
fc=1.5e9; d0=100; sigma=3; distance=[1:2:31].^2;
Gt=[1 1 0.5]; Gr=[1 0.5 0.5]; Exp=[2 3 6];
for k=1:3
y_Free(k,:)=PL_free(fc,distance,Gt(k),Gr(k));
y_logdist(k,:)=PL_logdist_or_norm(fc,distance,d0,Exp(k));
y_lognorm(k,:)=PL_logdist_or_norm(fc,distance,d0,Exp(1),sigma);
end
% plot(distance,y_Free)
semilogx(distance,y_Free);
grid on; axis([1 1000 40 110]);
title(['Free Path-loss Model, f_c=',num2str(fc/1e6),'MHz']);
xlabel("Distance[m]");
ylabel("Path loss[dB]");
legend('G_t=1, G_r=1','G_t=1, G_r=0.5','G_t=0.5, G_r=0.5');
