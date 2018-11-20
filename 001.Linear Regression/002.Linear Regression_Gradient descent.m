% Octave4.4.1
% ���Իع�ģ�ͣ�ʹ�þ��󻯵��ݶ��½���

% ѧϰ��
alpha = 0.00000001;
% ���뼰�������Ϊmά������
X = load('featureX.dat');
Y = load('priceY.dat');
m = length(X);
% Ϊ�������ȫ1��
X = [ones(m,1) X];
% ����theta
theta = [1 1];
% ���躯��
h = X * theta';
% ��ʧ����
J = (h - Y)'.^2 * ones(m,1) /2 /m;

% �ݶ��½��������ʾ
i = 1;
J=[];
while i<= 300,
  tmp = (X * theta' - Y)';
  
  % ��ʧ������¼
  J_tmp = tmp.^2 * ones(m,1) /2 /m;
  J = [J J_tmp];
  
  % �ݶ��½�����������ʽ�Ĺ�ʽ
  theta = theta - tmp * X * alpha / m;
  
  i = i + 1;
end;

% ������ϵ����ߺ�ѵ����������
figure(1);
plot(X(:,2),Y,'*');
hold on;
plot(X(:,2),X * theta','r');
hold off;

% ������ʧ����J����ѵ�������ı仯����
figure(2);
train_index = 1:length(J);
plot(train_index,J);
