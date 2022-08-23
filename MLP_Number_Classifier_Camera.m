% Camilo Alejandro Hernández Salazar - 214019774
%% Cámara web para clasificación de colores 
clc; clear; close all; 

cam = webcam;
preview(cam)
a = 1;

for k = 1:100000000
    img = snapshot(cam);
    img_g = rgb2gray(img);
    
    [n,m] = size(img_g);
    for i = 1:n
        for j = 1:m
            if img_g(i,j)>100
                img_g(i,j) = 0;
            else
                img_g(i,j) = 255;
            end
        end
    end
    
    img_g = imresize(img_g,[28 28]);
    img_g = (double(img_g)/255);
    imshow(img_g)
    
    %%
    sigmoide = @(v,a) 1./(1+exp(-v*a));
    load data_Net_40000
    
    x = reshape(img_g',1,784);
    
    xO = [1; x'];
    vO = wO'*xO;
    yO = tanh(vO);
    
    xS = [1; yO];
    vS = wS'*xS;
    yS = sigmoide(vS,a);

    [~,ind] = max(yS); 
    detect = ind-1
end