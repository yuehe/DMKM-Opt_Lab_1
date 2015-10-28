#number of rows in data file (values of x)
param p;

#number of input in the first level and +1 for the output
param n;

#parameter for the data to make the network learn
param x{i in {1..p} , j in {1..n}};

#parameter for the intial values of w
param winit{i in {1..7},j in {1..7}};

#parameter for w to find
var w{i in {1..7},j in {1..7}} := winit[i,j];

#parameter for the output
param y{i in {1..p}} := x[i,5];

#objective function
minimize distance: sum{k in {1..p}}(
1/(1+exp(-(w[5,7]* 
(1/(1+exp(-(sum {i in {1..4}}(w[i,5]*(1/(1+exp(-x[k,i]))))))))
+w[6,7]*
(1/(1+exp(-(sum {i in {1..4} }(w[i,6]*(1/(1+exp(-x[k,i]))))))))
)))
-y[k])^2;

#constraint for the weights
subject to c1 { i in {1..7},j in {1..7} } : w[i,j] >=-10000;

#subject to c2 {k in {1..p}} : abs(
#1/(1+exp(-(w[5,7]* 
#(1/1+exp(-(sum {i in {1..4}}(w[i,5]*(1/(1+exp(-x[k,i])))))))
#+w[6,7]*
#(1/1+exp(-(sum {i in {1..4} }(w[i,6]*(1/(1+exp(-x[k,i])))))))
#)))
#-y[k]) <= 1;