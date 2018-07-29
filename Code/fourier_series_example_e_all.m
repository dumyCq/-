%% Initial Data
x_s = zeros(1,257);
x_b = ones(1,257);
%% Duration 16s, sampling rate 16Hz, sample signal
t_s = linspace(-8,8,16*16+1);
t_o = linspace(-2,2,4*16+1);
x_o = (5*t_o.^2 + 2*t_o)./(2*t_o+15);
len = length(t_s);
T = 4;
for i = 1:len
    temp = rem(i+0.5*T*16,T*16);
    x_s(1,i) = x_o(1,temp+1);
end
%% Draw the picture of original signal
figure
plot(x_s);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
legend("Original Signal")
%% Calculate fourier series N = 10
N = 10;
l = 0.5*T;
syms t x
x = (5*t^2 + 2*t)/(2*t+15);
c_k = zeros(1,2*N+1);
c_k(1,N+1)= int(x,t,-l,l)/(2*l);    
for j = N:-1:1
    c_k(1,j) = int(x*exp(1i*(j-N-1)*pi*t/l),t,-l,l)/(2*l);
end
for j = 1:N
    c_k(1,j+N+1) = int(x*exp(1i*-j*pi*t/l),t,-l,l)/(2*l);
end
%% Reconstruct signal
x_re = getRec_Exp(c_k,t_s,T);
figure
plot(x_s);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
hold on
plot(x_re,'r');


%% Reconstruc signal from sampling
[a_o,a_k,b_k] = getFourierSeries(x_s,16,T,N,len);
c_k(1,N+1) = a_o/2;
for j = N:-1:1
    c_k(1,j) = (a_k(1,abs(j-N-1)) + 1i*b_k(1,abs(j-N-1)))/2;
end
for j = 1:N
    c_k(1,j+N+1) = (a_k(1,j) - 1i*b_k(1,j))/2;
end
x_res = getRec_Exp(c_k,t_s,T);
hold on
plot(x_re,'g-.');
legend("Original Signal","N=10 Fourier Serise Reconstruction sys","N=10 Fourier Serise Reconstruction exp sample")
