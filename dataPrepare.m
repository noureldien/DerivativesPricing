% prepare the data we have, get the data from
% the files and save it in one matrix

% meanining of columns of the data
% 1. the date
% 2. the price of the option
% 3. the value of the underlying asset 

clc;
fileNames = {'c2925', 'c3025', 'c3125', 'c3225', 'c3325', ...
             'p2925', 'p3025', 'p3125', 'p3225', 'p3325'};

for i=1:length(fileNames)
    load(strcat('Data\', fileNames{i} ,'.prn'));
end

% data for call and put options
data = [c2925; c3025; c3125; c3225; c3325; p2925; p3025; p3125; p3225; p3325];

[M,N] = size(data);
m = 5;
n = M/(m*2);

% split prices, dates and stock value
stock = data(+1:n,3);
prices = zeros(n, m*2);
dates = zeros(n, m*2);


for i=1:m
    
idx = i;

% price of the option
prices(:,idx) = data(n*(idx-1)+1:n*idx,2);
dates(:,idx) = data(n*(idx-1)+1:n*idx,1);

idx = i + m;

% price of the option
prices(:,idx) = data(n*(idx-1)+1:n*idx,2);
dates(:,idx) = data(n*(idx-1)+1:n*idx,1);
end

% save data
save('Data\prices', 'prices');
save('Data\dates', 'dates');
save('Data\stock', 'stock');




