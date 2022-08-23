# Multilayer-Perceptron-Practical-Examples-

## MLP_XOR.m

In this file, I show the way we use a Multilayer Perceptron (MLP) with a sigmoid function to classify and XOR gate as example. In the figure 1, we can see te Mean Squared Error on the left, and the classification of the XOR gate on the right

![_figure 1: Mean Squared Error and XOR gate graphics_](https://github.com/Camiloalejan/Multilayer-Perceptron-Practical-Examples-/blob/main/images/MLP_XOR_results.png)

## MLP_Aproximation_of_Functions.m

In this case, I use the MLP algorithm to get an aproximation to the 3d function 2*cos(X) + sin(Y) with an Hyperbolic function as activation function of the Artificial Neural Network (ANN). We can see the Error through the iterations in the figure 2.

![_figure 2: Mean Squared Error from the MLP through each iteration_](https://github.com/Camiloalejan/Multilayer-Perceptron-Practical-Examples-/blob/main/images/iterations_results.png)

In figure 3 the results are shown.

![_figure 3: The results showing the original function and the results from the MLP training_](https://github.com/Camiloalejan/Multilayer-Perceptron-Practical-Examples-/blob/main/images/MLP_Aproximation_of_Functions_results.png)

## MLP_Proximity_Sensor_NLR.m

In this project I included the use of the proximity sensor sharp GP2Y0A21YK0F to make a nonlinear regression with the MLP as it is displayed in figure 4.

![_figure 4: Nonlinear Regression for a Proximity Sensor Data_](https://github.com/Camiloalejan/Multilayer-Perceptron-Practical-Examples-/blob/main/images/MLP_Proximity_Sensor_NLR_results.png)

## MLP_Colors_Classifier.m

This file contains a routine with 3 sub-routines within to make a color classification according to the frequency in the RGB format. To complete the project we can use a sensor (I used the TCS230 module) to get the frequency of the color in any surface and once we get the results in the RGB format, we can compare it with the second sub-routine and see if the training has been done in the right way.
We can see the results of the generalization presented in figure 5.

![_figure 5: Color classifier generalization_](https://github.com/Camiloalejan/Multilayer-Perceptron-Practical-Examples-/blob/main/images/MLP_Colors_Classifier_generalization.png)

## MLP_Number_Classifier.m & MLP_Number_Classifier_Camera.m

This project has been made to classify numbers from 0 to 9 with an image taken with the web camera or any other picture taken before. The first file contains the training of the ANN, after, I create a file with the training data (data_Net_40000.mat). Afterwards, the file is loaded in the second algorithm. There, the web camera in use will be on. Now, we are going to be able to see the results showing a paper sheet with a number from 0 to 9 in front of the camera. The answer will be displayed in the console.
