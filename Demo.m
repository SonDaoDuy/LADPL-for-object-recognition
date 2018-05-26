% =========================================================================
%   Shuhang Gu, Lei Zhang, Wangmeng Zuo and Xiangchu Feng,
%   "Projective Dictionary Pair Learning for Pattern Classification," In NIPS 2014.
%
%
%       Written by Shuhang Gu @ COMP HK-PolyU
%       Email: shuhanggu@gmail.comd
%       Oct, 2014.
% =========================================================================

warning off
% Load training and testing data
DataPath   = 'YaleB_Jiang';
load(DataPath);


% Column normalization
TrData = normcol_equal(TrData);
TtData = normcol_equal(TtData);


%Parameter setting
DictSize = 30;
%alpha = 0.01;
%sigma = 0.01;
tau    = 0.019;
beta = 0.0135;
lambda = 0.003;
gamma  = 0.0001;

% DPL training
tic
[ DictMat , EncoderMat, W_Mat ,CoefMat] = TrainDPL(  TrData, TrLabel, DictSize, tau, beta, lambda, gamma);
TrTime = toc;

%DPL testing
tic
[ PredictLabel] = ClassificationDPL( TtData, DictMat, EncoderMat, DictSize, W_Mat);
TtTime = toc;

%Show accuracy and time
Accuracy = 1-nnz(TtLabel-PredictLabel)/size(TtLabel,2);

fprintf('\nThe running time for DPL training is : %.03f ', TrTime);
fprintf('\nThe running time for DPL testing is : %.03f ', TtTime);
fprintf('\nRecognition rate for DPL is : %.03f ', Accuracy);

