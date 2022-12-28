function rmse=fun(a)
rng('default')
load Datas
data = Datas_HH;
input=data(1:end,:)';
output=data(1:end,:)';

%训练数据和预测数据 4:1  
input_train=input(:,1:2874);
input_test=input(:,2875:end);
output_train=output(:,1:2874);
output_test=output(:,2875:end);

train_data=input_train';
train_label=output_train';
%% 随机森林预测
ntree=round(a);
Model = TreeBagger(ntree,train_data(:,1),train_label(:,1),'Method','regression');%训练
% test_data 测试数据
% predict_label 分类结果
% scores 概率分布
[test_simu,scores] = predict(Model,input_test(1,:)');%测试
% 反归一化
rmse=sum(sqrt(mean((test_simu-output_test(1,:)').^2,2)));