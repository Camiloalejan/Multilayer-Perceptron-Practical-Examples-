% Camilo Alejandro Hern�ndez Salazar - 214019774
%% Multilayer Perceptron (MLP) Network para clasificaci�n de N�meros 
clc; clear; close all; 

% Funci�n sigmoidal
sigmoide = @(v,a) 1./(1+exp(-v*a));

% Matriz de base de datos
data = dlmread('NumbersToTrain.txt');
% Matriz de datos de entrada
X = data(1:40000, 1:end-10)';
% Matr�z de vectores deseados
D = data(1:40000, 785:794)';
% nK = n�m. de muestras; nP = n�m. entradas; nS = n�m. de neuronas de salida; 
% nO = n�m. de neuronas de capa oculta; raz�n de aprendizaje eta; factor de exploraci�n alpha;     
nK = 40000; nP = 784; nS = 10; nO = 25; eta = .14; a = .93;

% Inicializaci�n de Matrices de pesos para la capa oculta y la capa de
% salida
wO = rand(nP+1, nO)*0.001;
wS = rand(nO+1, nS)*0.001;
count = 0;

for i = 1:150
    for k = 1:nK
        %Propagaci�n hacia adelante
        %primera capa
        xO = [1; X(:,k)];
        vO = wO'*xO;
        yO = tanh(vO);
        %Capa de salida
        xS = [1; yO];
        vS = wS'*xS;
        yS = sigmoide(vS,a);
        
        %Propagaci�n hacia atr�s
        %C�lculo de delta de acuerdo al error
        e = D(:,k) - yS;
        deltaS = e.*(yS.*(1-yS));
        deltaO = ((ones(nO,1) - yO).*(ones(nO,1)+yO)).*(wS(2:end,:)*deltaS);
        %Actualizaci�n de pesos nuevos para ambas capas
        wS = wS + eta*(deltaS*xS')';
        wO = wO + eta*(deltaO*xO')';
    end
end
disp('Done')
save('data_Net_40000','wO','wS')

%% Generalizaci�n
clc; clear; close all; 

% Funci�n sigmoidal
sigmoide = @(v,a) 1./(1+exp(-v*a));
load data_Net_40000

% Matriz de base de datos
data = dlmread('NumbersToTrain.txt');
% Matriz de datos de entrada
Xg = data(40001:50000, 1:end-10)';
% Matr�z de vectores deseados
Dg = data(40001:50000, 785:794)';
% nK = n�m. de muestras; factor de exploraci�n alpha; sum = contador;
nK = 10000; a = .93; sum = 0;

for k = 1:nK
        %Propagaci�n hacia adelante
        %primera capa
        xO = [1; Xg(:,k)];
        vO = wO'*xO;
        yO = tanh(vO);
        %Capa de salida
        xS = [1; yO];
        vS = wS'*xS;
        yS = sigmoide(vS,a);
        
        [~,ny] = max(yS);
        [~,nd] = max(Dg(:,k));
        
        if ny == nd
            sum = sum+1;
        end
end

exitos = (sum/nK)*100