X=load('featureX.dat');
Y=load('priceY.dat');
% ����ѵ��������
plot(X,Y,'*');
% ���ȫ1��
X = [ones(size(X,1),1) X]
% ����theta
theta = [-42; 0.25];
% ���躯��
h = X * theta;
hold on;
% ���ƿ��ܵļ��躯��h
plot(X(:,2),h,'r*-');
% ���淽�̷����theta
theta = pinv(X'*X)*X'*Y;
% ���Ƽ��躯��h
h = X * theta;
plot(X(:,2),h,'g*-');
hold off;
