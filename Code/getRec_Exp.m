function x_re = getRec_Exp(c_k,t,T)
len = length(t);
N = length(c_k);
x_re = zeros(1,len);
for i = 1:len
    for j = 1:N
        x_re(1,i)=x_re(1,i)+c_k(1,j)*exp(1i*(j-N-1)*pi*t(1,i)*2/T);
    end
end
x_re = abs(x_re);