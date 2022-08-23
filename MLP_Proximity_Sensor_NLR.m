clc; clear; close; 

% a = arduino('COM3','Uno'); configurePin(a,'A0'); % Configuración Arduino
eta = .01; m = 10000; n = 3; % Valor de aprendizaje; epocas/iteraciones; numero de neuronas.

% Toma de muestras
% for i=1:12
%     x(i) = readVoltage(a,'A0');
%     pause()
% end

% Muestras tomadas
x = [2.8592 1.9697 1.7155 1.4663 1.3050 1.1632 1.2659 0.9629 0.8847 0.7820 0.7527 0.7185];
d = [10 12.5 15 17.5 20 22.5 25 27.5 30 32.5 35 37.5]/100; % Valores deseados.
w = rand(6,1); ws = rand(4,1); % Pesos capa oculta; Pesos capa de salida

[w,ws] = MLP (x,w,ws,d,m,n,eta); % Entrenamiento MLP

xn = 0:0.01:3; % Vector de muestras generales
wo1 = w(1:2); 
wo2 = w(3:4);
wo3 = w(5:6);

% FEED FORWARD
for i=1:length(xn)
    xo = [1 xn(i)]';
    xs = [1, tanh(wo1*xo), tanh(wo2*xo), tanh(wo3*xo)]';
    y = ws'*xs;
    on(i) = y;
end

mp = 1.2121; % Muestra de prueba para los resultados a 26 cms. aprox.
% FEED FORWARD para 'mp'
mpo = [1 mp]';
mps = [1, tanh(wo1*mpo), tanh(wo2*mpo), tanh(wo3*mpo)]';
y = ws'*mps;

hold on
grid on 
plot(x,d*100,'*b') % Mapeo del entrenamiento con las muestras
plot(xn,on*100,'g') % Mapeo de la generalización.
plot(mp,y*100,'Or') % Mapeo de muestra de prueba
legend('Muestras', 'Generalización', 'Muestra de prueba')
xlabel('Voltaje')
ylabel('Distancia (cms)')