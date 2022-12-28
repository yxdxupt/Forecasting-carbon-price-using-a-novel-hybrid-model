%% 该代码为基于WOA和ELM网络的预测
%% 清空环境
tic
clc
clear
close all 
rng('default')%将 rand、randi 和 randn 使用的随机数生成函数的设置重置为其默认值
load Datas
data = Datas_L';
input=data(1:end,:)';
output=data(1:end,:)';

%训练数据和预测数据 4:1  
input_train=input(:,1:1266);
input_test=input(:,1267:end);
output_train=output(:,1:1266);
output_test=output(:,1267:end);

[inputn,inputps]=mapminmax(input_train);
[outputn,outputps]=mapminmax(output_train);

%% 参数初始化
SearchAgents_no=30; % Number of search agents

Function_name='F24'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj,fun1]=Get_Functions_details(Function_name);
dim=1;
[Best_score,Best_pos,WOA_cg_curve]=WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
a=round(Best_pos);
%% 把最佳隐含层节点数赋予网络预测
%%
% 2. 训练集
P_train = input_train;
T_train = output_train;

%%
% 3. 测试集
P_test = input_test;
T_test = output_test;

%% 归一化
% 训练集
[Pn_train,inputps] = mapminmax(P_train,-1,1);
Pn_test = mapminmax('apply',P_test,inputps);
% 测试集
[Tn_train,outputps] = mapminmax(T_train,-1,1);
Tn_test = mapminmax('apply',T_test,outputps);

tic
%% ELM创建/训练
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,a,'sig',0);

%% ELM仿真测试
Tr_sim = elmpredict(Pn_train,IW,B,LW,TF,TYPE);
% 反归一化
train_simu = mapminmax('reverse',Tr_sim,outputps);
Tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
% 反归一化
test_simu = mapminmax('reverse',Tn_sim,outputps);
output_test=T_test;
% save Datas_L test_simu  train_simu 
load Datas_L%加载保存好的数据





