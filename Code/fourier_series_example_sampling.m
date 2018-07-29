%% Initial Data
x = zeros(1,257);
%% Duration 16s, sampling rate 16Hz, sample signal
t = linspace(-8,8,16*16+1);
len = length(t);
T = 4;
for i = 1:len
    temp = rem(t(i),T);
    if temp>1 && temp<3 
        x(i) = 0.5*(temp-1);
    elseif temp<-1 && temp>-3
        x(i) = 0.5*(temp+T-1);
    else
        x(i) = 0;
    end
end
%% Draw the picture of signal
figure
plot(x);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
legend("Sampling Signal")
%% Calculate fourier-series N =10
N = 10;
[a_o,a_k,b_k] = getFourierSeries(x,16,T,N,len);
%% Reconstruct signal
x_re = getReconstrcution(a_o,a_k,b_k,t,T);
figure
plot(x);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
hold on
plot(x_re,'r');
legend("Sampling Signal","N=10 Fourier Serise Reconstruction")
