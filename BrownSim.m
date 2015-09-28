%   Mean distance traveled by a molecule (Brownian motion)
%
%   N = number of molecules to average
%   dt = timestep
%   
N = 100;
dt = 0.01;
Y = zeros(1,5);

for i=1:N;
    X = brown(1, [0 0 0], dt, 0);
    Y(i) = norm(X,2);
end
hist(mean(Y), 100);