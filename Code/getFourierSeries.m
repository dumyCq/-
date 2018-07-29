function [a_o,a_k,b_k] = getFourierSeries(signal,samplerate,cycletime,N,len)
position_zero = floor(len/2)+1;
half_t = samplerate*cycletime/2;
%% calculate a_o
a_o = 0;
for i = position_zero-half_t:position_zero+half_t
    a_o = a_o + signal(i)*(1/16);
end
a_o = a_o/cycletime*2;
%% caluculate a_k b_k
a_k = zeros(1,N);
b_k = zeros(1,N);
for i = position_zero-half_t:position_zero+half_t
    for j = 1:N
        a_k(1,j) = a_k(1,j) + signal(i)*cos(j*pi*(i-position_zero)/half_t)*(1/16);
        b_k(1,j) = b_k(1,j) + signal(i)*sin(j*pi*(i-position_zero)/half_t)*(1/16);
    end
end
a_k = a_k/cycletime*2;
b_k = b_k/cycletime*2;