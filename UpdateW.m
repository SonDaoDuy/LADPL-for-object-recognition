function [ W_Mat ] = UpdateW(  Coef, Label, W_Mat,beta )

[ ClassNum] = size(Label,2);
Dim = size(Label{1},1);
Imat= eye(size(Coef{1},1));
lamda = 0.0001;
%
for i = 1:ClassNum
    TempCoef = Coef{i};
    TempData = Label{i};
    TempW = (beta*TempCoef*TempCoef')\(beta*TempCoef*TempData');
    W_Mat{i} = TempW';
end
%}
