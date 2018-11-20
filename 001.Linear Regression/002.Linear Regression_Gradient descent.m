% Octave4.4.1
% 线性回归模型，使用矩阵化的梯度下降法

% 学习率
alpha = 0.00000001;
% 输入及输出，均为m维的向量
X = load('featureX.dat');
Y = load('priceY.dat');
m = length(X);
% 为输入添加全1列
X = [ones(m,1) X];
% 参数theta
theta = [1 1];
% 假设函数
h = X * theta';
% 损失函数
J = (h - Y)'.^2 * ones(m,1) /2 /m;

% 梯度下降，矩阵表示
i = 1;
J=[];
while i<= 300,
  tmp = (X * theta' - Y)';
  
  % 损失函数记录
  J_tmp = tmp.^2 * ones(m,1) /2 /m;
  J = [J J_tmp];
  
  % 梯度下降法，矩阵形式的公式
  theta = theta - tmp * X * alpha / m;
  
  i = i + 1;
end;

% 绘制拟合的曲线和训练集样本点
figure(1);
plot(X(:,2),Y,'*');
hold on;
plot(X(:,2),X * theta','r');
hold off;

% 绘制损失函数J随着训练次数的变化曲线
figure(2);
train_index = 1:length(J);
plot(train_index,J);
