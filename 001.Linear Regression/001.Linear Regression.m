X=load('featureX.dat');
Y=load('priceY.dat');
% 绘制训练样本点
plot(X,Y,'*');
% 添加全1列
X = [ones(size(X,1),1) X]
% 参数theta
theta = [-42; 0.25];
% 假设函数
h = X * theta;
hold on;
% 绘制可能的假设函数h
plot(X(:,2),h,'r*-');
% 正规方程法求出theta
theta = pinv(X'*X)*X'*Y;
% 绘制假设函数h
h = X * theta;
plot(X(:,2),h,'g*-');
hold off;
