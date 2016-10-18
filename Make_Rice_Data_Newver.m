%load data from 6 files

%chia ra train va test cua thienuu
load('randomthienuu.mat');
thienuu_label = labelMat;
thienuu_feature = randomfacefeature;

TrainSize = fix(size(thienuu_feature,2)/4)*3;
Total = size(thienuu_feature,2);
allIndex = 1:Total;
TestSize = Total-TrainSize;
Data = thienuu_feature;
%phan train
index = randsample(1:Total,TrainSize);
tempTrain = Data(:,index);
TrData = tempTrain;
tempTrLabel = repmat(1,1,length(index));
TrLabel = tempTrLabel;
%phan test
theRest = setdiff(allIndex,index);
tempTest = Data(:,theRest);
TtData = tempTest;
tempTtLabel = repmat(1,1,length(theRest));
TtLabel = tempTtLabel;
%done chia thienuu

%chia ra train va test cho tap BC
load('randomBC.mat');
BC_label = labelMat;
BC_feature = randomfacefeature;

TrainSize = fix(size(BC_feature,2)/4)*3;
Total = size(BC_feature,2);
allIndex = 1:Total;
TestSize = Total-TrainSize;
Data = BC_feature;
%phan train
index = randsample(1:Total,TrainSize);
tempTrain = Data(:,index);
TrData = horzcat(TrData,tempTrain);
tempTrLabel = repmat(2,1,length(index));
TrLabel = horzcat(TrLabel,tempTrLabel);

%phan test
theRest = setdiff(allIndex,index);
tempTest = Data(:,theRest);
TtData = horzcat(TtData,tempTest);
tempTtLabel = repmat(2,1,length(theRest));
TtLabel = horzcat(TtLabel,tempTtLabel);
%done chia BC

%chia ra train va test cho tap huongthom
load('randomhuongthom.mat');
huongthom_label = labelMat;
huongthom_feature = randomfacefeature;

TrainSize = fix(size(huongthom_feature,2)/4)*3;
Total = size(huongthom_feature,2);
allIndex = 1:Total;
TestSize = Total-TrainSize;
Data = huongthom_feature;
%phan train
index = randsample(1:Total,TrainSize);
tempTrain = Data(:,index);
TrData = horzcat(TrData,tempTrain);
tempTrLabel = repmat(3,1,length(index));
TrLabel = horzcat(TrLabel,tempTrLabel);

%phan test
theRest = setdiff(allIndex,index);
tempTest = Data(:,theRest);
TtData = horzcat(TtData,tempTest);
tempTtLabel = repmat(3,1,length(theRest));
TtLabel = horzcat(TtLabel,tempTtLabel);
%done chia huongthom

%chia ra train va test cua tap nep
load('randomnep.mat');
nep_label = labelMat;
nep_feature = randomfacefeature;

TrainSize = fix(size(nep_feature,2)/4)*3;

Total = size(nep_feature,2);
allIndex = 1:Total;
TestSize = Total-TrainSize;
Data = nep_feature;
%phan train
index = randsample(1:Total,TrainSize);
tempTrain = Data(:,index);
TrData = horzcat(TrData,tempTrain);
tempTrLabel = repmat(4,1,length(index));
TrLabel = horzcat(TrLabel,tempTrLabel);

%phan test
theRest = setdiff(allIndex,index);
tempTest = Data(:,theRest);
TtData = horzcat(TtData,tempTest);
tempTtLabel = repmat(4,1,length(theRest));
TtLabel = horzcat(TtLabel,tempTtLabel);
%done chia nep

%chia ra tap train va test cua Q
load('randomQ.mat');
Q_label = labelMat;
Q_feature = randomfacefeature;

TrainSize = fix(size(Q_feature,2)/4)*3;
Total = size(Q_feature,2);
allIndex = 1:Total;
TestSize = Total-TrainSize;
Data = Q_feature;
%phan train
index = randsample(1:Total,TrainSize);
tempTrain = Data(:,index);
TrData = horzcat(TrData,tempTrain);
tempTrLabel = repmat(5,1,length(index));
TrLabel = horzcat(TrLabel,tempTrLabel);

%phan test
theRest = setdiff(allIndex,index);
tempTest = Data(:,theRest);
TtData = horzcat(TtData,tempTest);
tempTtLabel = repmat(5,1,length(theRest));
TtLabel = horzcat(TtLabel,tempTtLabel);
%done chia Q

%chia ra tap train va test cua Xi
load('randomXi.mat');
Xi_label = labelMat;
Xi_feature = randomfacefeature;

TrainSize = fix(size(Xi_feature,2)/4)*3;
Total = size(Xi_feature,2);
allIndex = 1:Total;
TestSize = Total-TrainSize;
Data = Xi_feature;
%phan train
index = randsample(1:Total,TrainSize);
tempTrain = Data(:,index);
TrData = horzcat(TrData,tempTrain);
tempTrLabel = repmat(6,1,length(index));
TrLabel = horzcat(TrLabel,tempTrLabel);
%phan test
theRest = setdiff(allIndex,index);
tempTest = Data(:,theRest);
TtData = horzcat(TtData,tempTest);
tempTtLabel = repmat(6,1,length(theRest));
TtLabel = horzcat(TtLabel,tempTtLabel);

%done chia Xi

%save data
dataPath = 'data_rice.mat';
save(dataPath,'TrData','TrLabel','TtData','TtLabel');

% done load data


