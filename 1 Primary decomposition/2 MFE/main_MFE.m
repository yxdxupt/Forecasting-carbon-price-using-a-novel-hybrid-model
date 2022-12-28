clc
clear
close all
load fenjie1
modes=fenjie1;
%% 计算多尺度模糊熵
m=3;%分形维数
scale=3;%%尺度系数
for i=1:size(modes,1)
    r=std(modes(i,:));
    MFE(i)=sum(MultiscaleFuzzyEntropy(modes(i,:),m,r,scale));%多尺度模糊熵
end
figure%各个IMF的MFE值The value of ICEEMDAN-MFE
plot(1:i,MFE,'b*')
ylabel('The value of MFE')
xlabel('IMFs')
%对熵值进行归一化
MFE=mapminmax(MFE,0,1);
figure%归一化后的各个IMF的MFE值The normalized value of MFE
plot(1:i,MFE,'bo')
ylabel('The normalized value of MFE')
xlabel('IMFs')
% 高中低复杂度按照3：3：4分配
num=round(size(modes,1)*0.3);
[~,index]=sort(MFE,'descend');%对MFE进行降序排序
Datas_H=modes(index(1:num),:);%高复杂度分量
Datas_M=modes(index(num+1:2*num),:);%中复杂度分量
Datas_L=modes(index(2*num+1:end),:);%低复杂度分量
% save Datas_1 Datas_H Datas_M Datas_L%存储数据
clear
load fenjie2
modes=fenjie2;
%% 计算多尺度模糊熵
m=3;%分形维数
scale=3;%%尺度系数
for i=1:size(modes,1)
    r=std(modes(i,:));
    MFE(i)=sum(MultiscaleFuzzyEntropy(modes(i,:),m,r,scale));%多尺度模糊熵
end
figure%各个IMF的MFE值The value of ICEEMDAN-MFE
plot(1:i,MFE,'b*')
ylabel('The value of MFE')
xlabel('IMFs')
%对熵值进行归一化
MFE=mapminmax(MFE,0,1);
figure%归一化后的各个IMF的MFE值The normalized value of MFE
plot(1:i,MFE,'bo')
ylabel('The normalized value of MFE')
xlabel('IMFs')
% 高中低复杂度按照3：3：3分配
num=round(size(modes,1)*0.3);
[~,index]=sort(MFE,'descend');%对MFE进行降序排序
Datas_H=modes(index(1:num),:);%高复杂度分量
Datas_M=modes(index(num+1:2*num),:);%中复杂度分量
Datas_L=modes(index(2*num+1:end),:);%低复杂度分量
% save Datas_2 Datas_H Datas_M Datas_L%存储数据

