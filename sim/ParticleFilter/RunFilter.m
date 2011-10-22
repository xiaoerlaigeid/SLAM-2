% Read data from file
data = getData('sim5');

% Load Constants
Constants

% Get Initial Distribution
chi = GenerateInitialDistribution();

dataSize = size(data);

result = zeros(4,dataSize(1));
err = zeros(2,dataSize(1));

for X = 1:dataSize(1)
    u = [data(X,2);data(X,3);data(X,4);data(X,5)];
    z = [data(X,6);data(X,7);data(X,8);data(X,9)];
    chi = ParticleFilter(chi,u,z);
    result(:,X) = mean(chi,2);
    err(:,X) = [std(unique(chi(1,:))); std(unique(chi(2,:)))];
    X
end

clf
errorbarxy(result(1,:), result(2,:), err(1,:), err(2,:))
%scatter(result(1,:), result(2,:))
hold on
scatter(data(:,10), data(:,11), 'r')