% Octave4.4.1
% ʹ��Logistics Regression�������������
% ������һ������������С���ж����ԺͶ�������

alpha = 0.05;
% ѵ����
X = load('tumorSize.dat');
Y = load('tumorResult.dat');
m = length(X);
% ���봦��theta0 + theta1 * x
X = [ones(m,1) X ./ 100];
% ����theta����ֵ
theta = [-0.5 1];

% �ݶ��½�
i = 1;
J = [];
while i <= 10000,
  % Ԥ�⺯��h
  h = 1 ./(exp(-(X * theta'))+1);
  tmp = (h - Y)';
  % ��ʧ����J
  J_tmp = - ones(1,m) * (Y .* log(h) + (1 - Y) .* log(1 - h)) / m;
  J = [J J_tmp];
  % �ݶ��½�
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


