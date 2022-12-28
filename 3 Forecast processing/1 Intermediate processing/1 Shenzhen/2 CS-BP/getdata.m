function [data,label]=getdata(~)
 %[~,~]=getdata('shuju.xls');
% read height,weight and label from a xls file

%[~,label]=xlsread(xlsfile,1,'A2:A21');
[input,label]=xlsread('a.xls','A3:A63');
[output,~]=xlsread('a.xls','B3:B63');
[zhenshi,~]=xlsread('a.xls','C3:C63');


data=[input,output,zhenshi];



