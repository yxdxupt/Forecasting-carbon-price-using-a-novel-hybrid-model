clc
clear
close all
%读取数据 复杂度 高 中 低 一组测试  一组训练
rng('default')%将 rand、randi 和 randn 使用的随机数生成函数的设置重置为其默认值
load  Datas_H
H1=test_simu;
H2=train_simu;
load  Datas_M
M1=test_simu;
M2=train_simu;
load  Datas_L
L1=test_simu;
L2=train_simu;
% 线性叠加
test_simu=sum([H1;M1;L1])';
train_simu=sum([H2;M2;L2])';
Datas=xlsread('data.xlsx','2');%读入真实数据
output_train=Datas(1:1266);
output_test=Datas(1267:end);
%% 训练样本 真实值与预测值误差比较
error1=train_simu-output_train;      %预测值和真实值的误差
%% 测试样本 真实值与预测值误差比较
error2=test_simu-output_test;      %预测值和真实值的误差

%% ELM 误差修正
% 2. 训练集
P_train = error1';
T_train = error1';
%%
% 3. 测试集
P_test = error2';
T_test = error2';
%% 归一化
% 训练集
[Pn_train,inputps] = mapminmax(P_train,-1,1);
Pn_test = mapminmax('apply',P_test,inputps);
% 测试集
[Tn_train,outputps] = mapminmax(T_train,-1,1);
Tn_test = mapminmax('apply',T_test,outputps);
%% ELM创建/训练
[IW,B,LW,TF,TYPE] = elmtrain(Pn_train,Tn_train,4,'sig',0);
%% ELM仿真测试
Tn_sim = elmpredict(Pn_test,IW,B,LW,TF,TYPE);
test_error = mapminmax('reverse',Tn_sim,outputps);
% 修正
test_simu=test_simu-test_error';
error=test_simu-output_test;      %预测值和真实值的误差
%%
figure
plot(output_test,'bo-')
hold on
plot(test_simu,'r*-')
legend('Real value','Forecasting value')%期望值 预测值
xlabel('Test sample')%测试样本
ylabel('Forecasting results')%修正输出
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])
[c,l]=size(output_test);
mape = mean(abs((output_test - test_simu)./output_test));
MAE=sum(abs(error),1)/l;
RMSE=sqrt(mean((test_simu-output_test).^2,1));
disp(['-----------------------修正后测试误差计算--------------------------'])
disp(['最终测试误差结果如下：'])
disp(['平均绝对误差MAE为：',num2str(MAE')])
disp(['均方根误差RMSE为：  ',num2str(RMSE')])
disp(['平均百分比误差MAPE为/%：  ',num2str(mape')])
% save ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC test_simu

