func =  @(x) x.^2-sin(x);
x_start = -4;
x_finish = 6;
N = 0;
L = x_finish - x_start;
sigma = 0.01;

x1 = (L/2) - (sigma/2);
x2 = (L/2) + (sigma/2);
f1 = func(x1);
f2 = func(x2);

f_start = func(x_start);
f_finish = func(x_finish);

iteration = 0;
%disp('iteration  x_start  f(x_start)  x_finish  f(x_finish)')

while N < 6
        %disp([iteration', x_start', func(x_start)', x_finish', func(x_finish)',])
    if f1>f2
        x_start = x1; 
        L = x_finish - x_start;
        x1 = (x_start+((1-x_start)/2))-(sigma/2);
        x2 = (x_start+((1-x_start)/2))+(sigma/2);
        f1 = func(x1);
        f2 = func(x2);
        iteration = iteration + 1;
        N = N+1;
    else f1<f2
        x_finish = x2; 
        L = x_finish - x_start;
        x1 = (x_start+((1-x_start)/2))-(sigma/2);
        x2 = (x_start+((1-x_start)/2))+(sigma/2);
        f1 = func(x1);
        f2 = func(x2);
        iteration = iteration + 1; 
        N = N+1;
    end
end    

x_opt = (x_start+x_finish)/2;

fprintf('\nThe final interval of uncertainity is %f-%f',x_start,x_finish)
fprintf('\nThe total iterations: %f',iteration)
fprintf('\nThe optimum point of the function is %5.4f', x_opt)