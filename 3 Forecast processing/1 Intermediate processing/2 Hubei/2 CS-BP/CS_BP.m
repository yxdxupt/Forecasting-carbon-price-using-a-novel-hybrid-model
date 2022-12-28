%% 该代码为基于CS优化BP网络的预测
%% 清空环境
tic
clc
clear
close all 
load Datas
data = Datas_M';
input=data(1:end,:)';
output=data(1:end,:)';
%节点个数
[num,~]=size(input);
inputnum=num;%输入
hiddennum=10;%隐含层
outputnum=num;%输出

%训练数据和预测数据 4:1  
input_train=input(:,1:1266);
input_test=input(:,1267:end);
output_train=output(:,1:1266);
output_test=output(:,1267:end);

[inputn,inputps]=mapminmax(input_train);%归一化函数
[outputn,outputps]=mapminmax(output_train);
%构建网络
rand('seed',1)%相同的key下，第一次调用rand产生的结果是相同的

net=newff(inputn,outputn,hiddennum,{'tansig','purelin'},'trainlm');
netBP=newff(inputn,outputn,hiddennum,{'tansig','purelin'},'trainlm');

%% 参数初始化
parnum = inputnum * hiddennum + hiddennum * outputnum + hiddennum + outputnum; %51
SearchAgents_no=30; % Number of search agents

Function_name='F24'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj,fun1]=Get_Functions_details(Function_name);
dim=parnum;
[Best_score,Best_pos,CS_cg_curve]=CS(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,inputnum,hiddennum,outputnum,net,inputn,outputn);
%% 结果
x=Best_pos;
%% 把最优初始阀值权值赋予网络预测
% %用CS优化的BP网络进行值预测
w1=x(1:inputnum*hiddennum);
B1=x(inputnum*hiddennum+1:inputnum*hiddennum+hiddennum);
w2=x(inputnum*hiddennum+hiddennum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum);
B2=x(inputnum*hiddennum+hiddennum+hiddennum*outputnum+1:inputnum*hiddennum+hiddennum+hiddennum*outputnum+outputnum);
net.iw{1,1}=reshape(w1,hiddennum,inputnum);
net.lw{2,1}=reshape(w2,outputnum,hiddennum);
net.b{1}=reshape(B1,hiddennum,1);
net.b{2}=B2';

%% BP网络训练
t1=clock;
%网络进化参数
net.trainParam.epochs=10;
net.trainParam.lr=0.01;
net.trainParam.goal=0.00001;
net.trainParam.show=5;% 两次显示之间的训练次数
net.trainFcn = 'trainlm'; %traingdm是带动量的梯度下降法，trainlm是指L-M优化算法，trainscg是指量化共轭梯度法
net=train(net,inputn,outputn);%训练网络
net.divideParam.trainRatio = 40/100;
net.divideParam.valRatio = 30/100;
net.divideParam.testRatio = 30/100;

%网络训练
[net,per2]=train(net,inputn,outputn);

%% BP网络预测
%数据归一化
BPoutputT=sim(net,inputn);   %随机的
train_simu=mapminmax('reverse',BPoutputT,outputps); %把仿真得到的数据还原为原始的数量级
inputn_test=mapminmax('apply',input_test,inputps);
%BP神经网络预测
BPoutput=sim(net,inputn_test);   %随机的
test_simu=mapminmax('reverse',BPoutput,outputps); %把仿真得到的数据还原为原始的数量级
error=test_simu-output_test;      %预测值和真实值的误差
% save Datas_M test_simu  train_simu 
load Datas_M%加载保存好的数据







