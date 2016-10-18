function [PredictLabel] = ClassificationDPL( TestData, DictMat , EncoderMat, DictSize, W_Mat )

%Projective representation coefficients estimation
ClassNum = size(DictMat,2);
for i=1:size(W_Mat,2)
    tempW = W_Mat{i};
    ClassifyMat(:,(i-1)*DictSize+1:i*DictSize) = tempW;
end
Predict = ClassifyMat*EncoderMat*TestData;

[Distance PredictLabel] = max(Predict);



