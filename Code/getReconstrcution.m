function x_re = getReconstrcution(a_o,a_k,b_k,t,T)
len = length(t);
N = length(a_k);
x_re = zeros(1,len);
for i = 1:len
    for j = 1:N
        x_re(1,i)=x_re(1,i)+a_k(1,j)*cos(j*pi*t(1,i)*2/T)+b_k(1,j)*sin(j*pi*t(1,i)*2/T);
    end
    x_re(1,i) = x_re(1,i) + a_o*2/T;
end