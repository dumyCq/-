%% Initial Data
x = zeros(1,257);
%% Duration 16s, sampling rate 16Hz, sample signal
t = linspace(-8,8,16*16+1);
len = length(t);
T = 4;
for i = 1:len
    if i >9*16+1 && i<= 11*16
        x(i) = 1;
    else
        x(i) = 0;
    end
end

figure
plot(x);
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
legend("original signal")


%% Fourier Transform
X =fft(x);
figure
plot(abs( fftshift(X)));
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-16:2:16);
xlabel('Frequency (Hz)');
ylabel('Engery');

figure
plot(x,'g');
axis tight
set(gca,'xtick',1:16:257,'xticklabel',-8:1:8);
xlabel('Time (second)');
ylabel('Amplitude');
hold on
x_re = ifft(X);
plot(x_re,'r-.');
legend("original signal","fourier reconstruction")