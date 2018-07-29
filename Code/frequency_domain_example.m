%% Initial space
x = zeros(1,256);
x1 = zeros(1,256);
x2 = zeros(1,256);
x3 = zeros(1,256);
X = zeros(1,256);
%% Duration 16s, sampling rate 16Hz, sample signal
for t = 0:1/16:16
    x(1,16*t+1) = 0.2*sin(8*pi*t) + 0.4*sin(4*pi*t) + 0.8*sin(2*pi*t);
    x1(1,16*t+1) = 0.2*sin(8*pi*t);
    x2(1,16*t+1) = 0.4*sin(4*pi*t);
    x3(1,16*t+1) = 0.8*sin(2*pi*t);
end
%% Draw the signal and component of signal
figure
plot(x);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',0:1:16);
xlabel('Time (second)');
ylabel('Amplitude');
figure
subplot(3,1,1)
plot(x1)
axis tight
set(gca,'xtick',1:16:257,'xticklabel',0:1:16);
xlabel('Time (second)');
ylabel('Amplitude');
subplot(3,1,2)
plot(x2)
axis tight
set(gca,'xtick',1:16:257,'xticklabel',0:1:16);
xlabel('Time (second)');
ylabel('Amplitude');
subplot(3,1,3)
plot(x3)
axis tight
set(gca,'xtick',1:16:257,'xticklabel',0:1:16);
xlabel('Time (second)');
ylabel('Amplitude');
%% Analysis frequency domain
X = fftshift(fft(x));
%% Draw the frequency domain
figure
plot(abs(X));
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-16:2:16);
xlabel('Frequency (Hz)');
ylabel('Engery');
