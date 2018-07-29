%% Initial Data
x_s = zeros(1,257);
%% Duration 16s, sampling rate 16Hz, sample signal
t_s = linspace(-8,8,16*16+1);
t_o = linspace(-2,2,4*16+1);
x_o = 2*t_o.^3+5*t_o.^2;
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
x = 2*t^3+5*t^2;
a_o = int(x,t,-l,l)/l;
a_k = zeros(1,N);
b_k = zeros(1,N);
for j = 1:N
    a_k(1,j) = int(x*cos(j*pi*t/l),t,-l,l)/l;
    b_k(1,j) = int(x*sin(j*pi*t/l),t,-l,l)/l;
end
%% Reconstruct signal
x_re = getReconstrcution(a_o,a_k,b_k,t_s,T);
figure
plot(x_s);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
hold on
plot(x_re,'r');
legend("Original Signal","N=10 Fourier Serise Reconstruction")