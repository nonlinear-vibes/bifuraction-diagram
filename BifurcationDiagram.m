% Iterates the logistic map and plots the bifurcation diagram.
endpoint = 4;     % bifurcation parameter limit
n        = 200;   % number of iterations
res      = 0.001; % parameter increment

num_r    = floor(endpoint/res);
sol      = zeros(n,num_r);   
sol(1,:) = 0.5;

% iteration
for j = 1:num_r
    % increment the parameter
    r = res*j;
    for i = 1:n-1
        sol(i+1,j) = r*sol(i,j)*(1-sol(i,j));
        
        % another sigle-hump function:
        % sol(i+1,j) = r*cos(sol(i,j));
    end
end

% keep only the long-term solution
longterm = sol(end-0.25*n:end,:);

% plot results
t = 0:res:endpoint-res;
figure;
grid on;
hold on;
for i = 1:floor(0.25*n)
    scatter(t,longterm(i,:),0.1,[0.161,0.318,0.427]);
end
xlabel('r'); ylabel('x_n');
title('Logistic Map Bifurcation');
