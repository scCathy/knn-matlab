clc;clear;
data=load('data.txt');
dataMat=data(:,1:3);
labels=data(:,4);
len=size(dataMat,1);
k=4;
error=0;
ratio=0.1;
numTest=ratio*len;%the number of test data
maxV = max(dataMat);
minV = min(dataMat);
range = maxV-minV;
newdataMat = (dataMat-repmat(minV,[len,1]))./(repmat(range,[len,1]));%min-max

Mdl = fitcknn(newdataMat(numTest:len,:),labels(numTest:len,:),'NumNeighbors',4);%get model
for i=1:numTest
    flwr = newdataMat(i,:); % test set
    flwrClass(i) = predict(Mdl,flwr);%predict results
end
