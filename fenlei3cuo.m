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


Mdl = KDTreeSearcher(newdataMat(numTest:len,:));
[idx,D]=knnsearch(Mdl,newdataMat(1:numTest,:),'distance','cityblock','k',4);%default value is 1
que=labels(idx+100);
pre=mode(que,2);
for i=1:numTest
    if pre(i)~=labels(i)
        error=error+1;
    end
end
