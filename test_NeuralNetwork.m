% w: the weight of the function
% x :the inputs
% y: the real output
% error_num: the number of which predict one is different from the real output
% predict_3 : the predict values [0,1]; predict: the modified predict values {0,1}
function [error_num,predict_3]=test_NeuralNetwork(w,x,y)
    m = size(x, 1); % m is the number of row
    n = size(x, 2); % n is the number of column % In this case, n = 4
    error_num = 0;
    correct_num = 0; % the number of which predict one is the same as the real output
    predic_3 = zeros(m,1); % the predict values
    for i =1 : m
            predict_O1 = sigmoid_f(x(i,1));% for the first layer
            predict_O2 = sigmoid_f(x(i,2));
            predict_O3 = sigmoid_f(x(i,3));
            predict_O4 = sigmoid_f(x(i,4));
            
            predict_O5 = sigmoid_f(w(1,5) * predict_O1 +w(2,5) * predict_O2 +w(3,5) * predict_O3 +w(4,5) * predict_O4);% for the sencond layer
            predict_O6 = sigmoid_f(w(1,6) * predict_O1 +w(2,6) * predict_O2 +w(3,6) * predict_O3 +w(4,6) * predict_O4);
            
            predict_3(i) = sigmoid_f(w(5,7) * predict_O5 +w(6,7) * predict_O6); % for the third layer
            if predict_3(i) >= 0.5 % force the predict results to be 0-1
                predict = 1;
            else
                predict = 0;
            end
            if predict == y(i) % to compute the accuracy and the error number
                correct_num = correct_num+1;
            else
                error_num = error_num +1;
            end                
    end
        
function y = sigmoid_f(x)  % the transformation function
    y = 1/(1+e^-(x));