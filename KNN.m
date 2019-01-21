function relustLabel = KNN(inx,data,labels,k)  
%   inx Ϊ ����������ݣ�dataΪ�������ݣ�labelsΪ������ǩ

[datarow , datacol] = size(data);
diffMat = repmat(inx,[datarow,1]) - data ;
distanceMat = sqrt(sum(diffMat.^2,2));%L2distance
[B , IX] = sort(distanceMat,'ascend');%ascendʱΪ�������з�֮descend��IXΪB��Ԫ����Դ�����е�λ������
len = min(k,length(B));
relustLabel = mode(labels(IX(1:len)));%����������������������г���Ƶ��������ֵ

end

