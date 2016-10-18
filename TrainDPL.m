function [ DictMat , EncoderMat , W_Mat,CoefMat] = TrainDPL( Data, Label, DictSize, tau,beta, lambda, gamma)

% Initilize D and P, W, update A for one time
[ DataMat, DictMat, P_Mat, DataInvMat, CoefMat, W_Mat, LabelMat,Q_Mat,M_Mat] = Initilization( Data , Label, DictSize, tau, beta, lambda, gamma );

% Alternatively update P, D, W and A
for i=1:30
    [ P_Mat ]   = UpdateP(  CoefMat, DataInvMat, P_Mat, DataMat, tau );
    [ DictMat ] = UpdateD(  CoefMat, DataMat, DictMat);
    [W_Mat]     = UpdateW(  CoefMat,LabelMat,W_Mat,beta);
    [ CoefMat] = UpdateA(  DictMat, DataMat, P_Mat,tau, beta, DictSize , W_Mat, LabelMat,Q_Mat,M_Mat);
    
end

% Reorganize the P matrix to make the classification fast
for i=1:size(P_Mat,2)
    tempP = P_Mat{i};    
    EncoderMat((i-1)*DictSize+1:i*DictSize,:) = tempP;
end

