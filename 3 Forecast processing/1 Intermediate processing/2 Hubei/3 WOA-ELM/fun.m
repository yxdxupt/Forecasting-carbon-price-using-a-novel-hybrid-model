function rmse=fun(a)
%% 极限学习机在回归拟合问题中的应用研究
load Datas
data = Datas_L';
input=data(1:end,:)';
output=data(1:end,:)';
%节点个数
[num,~]=size(input);

%训练数据和预测数据 4:1  
input_train=input(:,1:1266);
input_test=input(:,1267:end);
output_train=output(:,1:1266);
output_test=output(:,1267:end);

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
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,round(a),'sig',0);

%% ELM仿真测试
Tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
% 反归一化
test_simu = mapminmax('reverse',Tn_sim,outputps);
output_test=T_test;
%% 结果对比
rmse=sum(sqrt(mean((test_simu-output_test).^2,2)));








