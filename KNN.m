function relustLabel = KNN(inx,data,labels,k)  
%   inx 为 输入测试数据，data为样本数据，labels为样本标签

[datarow , datacol] = size(data);
diffMat = repmat(inx,[datarow,1]) - data ;
distanceMat = sqrt(sum(diffMat.^2,2));%L2distance
[B , IX] = sort(distanceMat,'ascend');%ascend时为升序排列反之descend，IX为B中元素在源矩阵中的位置索引
len = min(k,length(B));
relustLabel = mode(labels(IX(1:len)));%返回向量、数组或数据域中出现频率最多的数值

end

