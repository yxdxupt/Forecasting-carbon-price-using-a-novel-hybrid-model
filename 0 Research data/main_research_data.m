clc
clear
close all
%% 绘制碳价格图-深圳
%读取数据
Datas1=xlsread('data.xlsx','1');
[m,n]=size(Datas1);
figure
plot(1:m,Datas1,'b*-')
ylabel('Carbon price')
xlabel('Time')
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])
%% 绘制碳价格图-湖北
%读取数据
Datas2=xlsread('data.xlsx','2');
[m,n]=size(Datas2);
figure
plot(1:m,Datas2,'b*-')
ylabel('Carbon price')
xlabel('Time')
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])