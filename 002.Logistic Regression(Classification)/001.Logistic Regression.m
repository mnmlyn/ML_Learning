% Octave4.4.1
% 使用Logistics Regression来处理分类问题
% 这里是一个根据肿瘤大小，判断良性和恶性肿瘤

alpha = 0.05;
% 训练集
X = load('tumorSize.dat');
Y = load('tumorResult.dat');
m = length(X);
% 输入处理，theta0 + theta1 * x
X = [ones(m,1) X ./ 100];
% 参数theta，初值
theta = [-0.5 1];

% 梯度下降
i = 1;
J = [];
while i <= 10000,
  % 预测函数h
  h = 1 ./(exp(-(X * theta'))+1);
  tmp = (h - Y)';
  % 损失函数J
  J_tmp = - ones(1,m) * (Y .* log(h) + (1 - Y) .* log(1 - h)) / m;
  J = [J J_tmp];
  % 梯度下降
  theta = theta - tmp * X * alpha;
  i = i + 1;
end;

tSize = (0:0.002:1)';
tSize = [ones(length(tSize),1) tSize];
h_predict = 1 ./(exp(-(tSize * theta'))+1);

figure(1);
plot(X(:,2) .* 100 ,Y,'*');
hold on;
plot(tSize(:,2) .* 100,h_predict);
hold off;
figure(2);
train_index = 1:length(J);
plot(train_index,J);


