clc; clear; close all;

%*****Inicialización de entradas, pesos y resultados deseados****
a = .5; eta = .1; G = 600; errores = zeros(1,G);
X = [1 0 0; 1 0 1; 1 1 0; 1 1 1]; D = [0 1 1 0];
for i = 1:4
    for j = 1:3
        w1(i,j) = unifrnd(-1,1);
    end
end
for i = 1: 5
    w2(i) = unifrnd(-1,1);
end
L = length(X);

%*****Entrenamiento Estocástico*****
for i=1:G
    sum = 0;
   for j = 1:L
       x_aux = X(j,:)'; 
       v1 = w1*x_aux;
       v1 = logistica(a,v1);
       y1 = 0;
       y1 = [1; [v1]];
       v3 = w2*y1;
       y = logistica(a,v3);
       error = (D(j)-y);
       delta_g = error.*a.*y.*(i-y);
       delta = a.*y1.*(1-y1).*(w2'*delta_g);
       delta(1) = [];
       w2 = w2 + eta*delta_g*y1';
       w1 = w1 + eta*delta*x_aux';
       sum = sum+error^2;
   end
    errores(i) = sum/L;
end

%*****Comprobaci\'on de Resultados*****
o = zeros(1,L);
for i = 1:L
    x_aux = X(i,:)';
    vo1 = w1*x_aux;
    o1 = logistica(a,vo1);
    vo2 = [1; [o1]];
    o2 = w2*vo2;
    o2 = logistica(a,o2);
    o(i) = o2;
end
disp(o)

%****Ploteo del Error y la gr\'afica de funcionamiento******
sp = 1:600;
subplot(1,2,1), plot(sp,errores), title('Error');
u = linspace(-0.5,1.5,350); w = u;
[U,W] = meshgrid(u,w);
Z = zeros(length(u),length(w));
tam = length(u);
for i = 1:tam
    for j = 1:tam
        for k = 1:L
            x = [1; U(i,j); W(i,j)];
            vo1 = w1*x;
            o1 = logistica(a,vo1);
            xo2 = [1; o1];
            vo2 = w2*xo2;
            o = logistica(a,vo2);
            Z(i,j) = umbral(o);
        end
    end
end
subplot(1,2,2), contourf(U,W,Z,[0.1,0.1,0.1]), title('XOR');
hold on;
plot(0,0,'bo','LineWidth',2,'MarkerSize',10);
plot(1,1,'bo','LineWidth',2,'MarkerSize',10);
plot(1,0,'rx','LineWidth',2,'MarkerSize',10);
plot(0,1,'rx','LineWidth',2,'MarkerSize',10);
grid on;
axis([-0.5,1.5,-0.5,1.5]);


%****Funciones de activación******
function y = logistica(a,v)
    y = 1./(1+exp(-a*v));
end

function v = umbral(v)
    if v >= 0.5
        v = 1;
    else
        v = 0;
    end
end
