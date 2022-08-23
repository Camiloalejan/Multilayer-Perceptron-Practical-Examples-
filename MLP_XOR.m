clc; clear; close all;

x = [1 0 0; 1 0 1; 1 1 0; 1 1 1]; d = [0 1 1 0];
w1 = [-1.5 1 1]; w2 = [-.5 1 1]; w3 = [-.5 -2 1];
L = length(x);

%**********
o = zeros(1,L);
for i = 1:L
    x_aux = x(i,:);
    vo1= x_aux*w1';
    vo2= x_aux*w2';
    o1 = limite(vo1);
    o2 = limite(vo2);
    vo3 = o1*w3(2)+o2*w3(3)+w3(1);
    o2 = limite(vo3);
    o(i) = o2;
end
disp(o)

%**********
function y = limite(v)
    if v>0
        y = 1;
    else
        y = 0;
    end
end