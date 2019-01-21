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

%test
for i=1:numTest
    classifyresult=KNN(newdataMat(i,:),newdataMat(numTest:len,:),labels(numTest:len,:),k);
    if (classifyresult~=labels(i))
        error=error+1; 
        fprintf('��%d������ ���Խ��Ϊ%d ��ʵ���Ϊ��%d\n',i,classifyresult,labels(i));
    end
end
zhunquelv=1-error/numTest