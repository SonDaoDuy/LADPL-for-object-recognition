function [ DataMat, DictMat, P_Mat, DataInvMat, CoefMat , W_Mat, LabelMat, Q_Mat, M_Mat] = Initilization( Data , Label, DictSize, tau, beta, lambda, gamma)
% TrData(504x1216) = Data ,TrLabel(1x1216) = Label ,DictSize = 30,beta = 0.05, tau = 0.05, lambda = 0.003, gamma = 0.0001, beta = 0.05

ClassNum = max(Label); % = 38
[Dim,numOfData]      = size(Data); % = 504
I_Mat    = eye(Dim,Dim);
H = zeros(ClassNum,numOfData);
Q = zeros(DictSize*ClassNum,numOfData);
for i = 1 : numOfData
        H(Label(i),i) = 1;
end
for i = 1 : ClassNum
    Q((i-1)*DictSize+1:i*DictSize,Label==i)=1;
end;

for i=1:ClassNum
    TempQ = Q(:,Label==i);
    Q_Mat{i} = TempQ;
    TempLabel = H(:,Label==i);
    LabelMat{i} = TempLabel;
    TempData      = Data(:,Label==i);
    DataMat{i}    = TempData;
    %randn('seed',i);
    DictMat{i}    = normcol_equal(randn(Dim, DictSize)); %tim ra mot ma tran gan bang ma tran dau vao nhung gom cac vecto don vi
    %randn('seed',2*i);
    P_Mat{i}      = normcol_equal(randn(Dim, DictSize))';
    %randn('seed',3*i);
    W_Mat{i}    = normcol_equal(randn(ClassNum,DictSize));
    %randn('seed',4*i);
    M_Mat{i}    = normcol_equal(randn(DictSize*ClassNum,DictSize));

    TempDataC     = Data(:,Label~=i);
    DataInvMat{i} = inv(tau*TempData*TempData'+lambda*TempDataC*TempDataC'+gamma*I_Mat);
end

[CoefMat] = UpdateA(  DictMat, DataMat, P_Mat, tau, beta, DictSize, W_Mat, LabelMat, Q_Mat, M_Mat);