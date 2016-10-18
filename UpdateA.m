function [ Coef] = UpdateA(  Dict, Data, P_Mat,tau, beta, DictSize, W_Mat, LabelMat, Q_Mat, M_Mat)

    ClassNum = size(Data,2);
    I_Mat    = eye(DictSize,DictSize);
    for i=1:ClassNum
        TempDict       = Dict{i};
        TempData       = Data{i};
        TempM = M_Mat{i};
        TempQ = Q_Mat{i};
        tempW = W_Mat{i};
        TempLabel      = LabelMat{i};
        Coef{i}        = (TempDict'*TempDict+tau*I_Mat+beta*tempW'*tempW)\(TempDict'*TempData+tau*P_Mat{i}*TempData + beta*tempW'*TempLabel);
        
    end
    