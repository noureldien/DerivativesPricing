% main file
clc;

data = averageCompletion(train,[]);
trainD = pdist2(data,data);

%save('trainD.mat','trainD','-v7.3');



