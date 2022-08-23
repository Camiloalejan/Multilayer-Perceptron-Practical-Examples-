clc; close all; clear;

%****Inicializaci\'on****
x = -pi:0.1:pi; y = x; L = length(x); a = .4; eta = .0007; G = 1000;
[X,Y] = meshgrid(x,y); errores = zeros(1,G);
Z = 2*cos(X) + sin(Y);
X_v = reshape(X,[1,L*L]); Y_v = reshape(Y,[1,L*L]); Z_v = reshape(Z,[1,L*L]);
[~,tam] = size(X_v); Bias = ones(1,tam); o = zeros(1,tam);
Xn = [Bias; X_v; Y_v]'; w1 = zeros(4,3); w2 = zeros(1,5);
for i = 1:7
    for j = 1:3
        w1(i,j) = unifrnd(-1,1);
    end
end
for i = 1:8
    w2(i) = unifrnd(-1,1);
end
L = length(X); 

%****Entrenamiento Estocástico****
for i=1:G
    sum = 0;
   for j = 1:L*L
       x_aux = Xn(j,:)'; 
       v1 = w1*x_aux;
       v1 = hiperbolica(a,v1);
       y1 = 0;
       y1 = [1; v1];
       v3 = w2*y1;
       y = v3;
       error = (Z_v(j)-y);
       delta = deltaf(a,y1).*(w2'*error);
       delta(1) = [];
       w2 = w2 + eta*error*y1';
       w1 = w1 + eta*delta*x_aux';
       o(j)=y;
       sum = sum+error^2;
   end
   errores(i) = sum/L;
   surf(X,Y,reshape(o,[L, L]));
   pause(.01);
end

disp(Z(1:10));
disp(o(1:10));
disp(Z(1:10)-o(1:10));

%*****Ploteo de los resultados obtenidos*****
sp = 1:G;
plot(sp,errores,'r','LineWidth',1);
figure()
subplot(1,2,1), surf(X,Y,Z), title('Función Original');
grid on;
subplot(1,2,2), surf(X,Y,reshape(o,[L, L])), title('Función Obtenida con entrenamiento');

%*****Funciones Utilizadas****
function y = hiperbolica(a,v)
    y = (exp(v) - exp(-a*v))./(exp(v) + exp(-a*v));
end
function dif = deltaf(a,v)
    dif = (2*exp(-a*v+v)+2*a*exp(-a*v+v))./(exp(v)+exp(-a*v)).^2;
end