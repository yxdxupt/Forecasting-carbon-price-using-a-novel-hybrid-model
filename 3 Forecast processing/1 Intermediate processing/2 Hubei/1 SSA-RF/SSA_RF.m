%% 该代码为基于SSA和RF网络的预测
%% 清空环境
clc
clear
close all
%创建训练样本输入集
load Datas
data = Datas_HH;
input=data(1:end,:)';
output=data(1:end,:)';

%训练数据和预测数据 4:1  
input_train=input(:,1:1266);%训练2874个数据，占0.8
input_test=input(:,1267:end);%测试数据719个，占0.2
output_train=output(:,1:1266);
output_test=output(:,1267:end);

train_data=input_train';
train_label=output_train';
%% 参数初始化
SearchAgents_no=30; % Number of search agents

Function_name='F24'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

Max_iteration=100; % Maximum numbef of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
[Best_score,Best_pos,SSA_cg_curve]=SSA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
x=Best_pos;
%% 把最优初始阀值权值赋予网络预测
ntree=round(x);
% test_data 测试数据
% predict_label 分类结果
% scores 概率分布
 for ii=1:size(Datas_HH,2)
      Model = TreeBagger(ntree,train_data(:,ii),train_label(:,ii),'Method','regression');%训练
      [Ys,~] = predict(Model,input_test(ii,:)');%测试
      [Yd,~] = predict(Model,train_data(:,ii));%测试
     % 反归一化
      test_simu1(ii,:) = Ys;
      train_simu1(ii,:) =Yd;
 end
 % 反归一化
test_simu2 = test_simu1;
train_simu2 = train_simu1;
%% 对高频分量 二次分解后的进行叠加
nn=cumsum(pl);%输入矩阵的每个元素对应的列向上（行向左）求和矩阵
test_simu(1,:)=sum(test_simu2(1:nn(1),:));
for j=2:length(pl)
      test_simu(j,:)=sum(test_simu2(nn(j-1):nn(j),:));
end
train_simu(1,:)=sum(train_simu2(1:nn(1),:));
for j=2:length(pl)
      train_simu(j,:)=sum(train_simu2(nn(j-1):nn(j),:));
end
output_test1(1,:)=sum(output_test(1:nn(1),:));
for j=2:length(pl)
      output_test1(j,:)=sum(output_test(nn(j-1):nn(j),:));
end
% save Datas_H test_simu  train_simu 
load Datas_H%加载保存好的数据







