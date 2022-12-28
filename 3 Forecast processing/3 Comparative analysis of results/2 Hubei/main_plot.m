%% 加载数据
clc
clear
close all
load real_value%真实数据
real_value=real_value';
load RF%以下数据简称则为模型结果
error1=RF-real_value;
load BP
error2=BP-real_value;
load ELM
error3=ELM-real_value;

load SSARF
error4=SSARF-real_value;

load CSBP
error5=CSBP-real_value;

load WOAELM
error6=WOAELM-real_value;

load ICEEMDAN_SSARF
error7=ICEEMDAN_SSARF-real_value;

load ICEEMDAN_CSBP
error8=ICEEMDAN_CSBP-real_value;

load ICEEMDAN_WOAELM
error9=ICEEMDAN_WOAELM-real_value;

load ICEEMDAN_MFE_EMD_SSARF_CSBP_WOAELM
error10=ICEEMDAN_MFE_EMD_SSARF_CSBP_WOAELM'-real_value;

load ICEEMDAN_MFE_EEMD_SSARF_CSBP_WOAELM
error11=ICEEMDAN_MFE_EEMD_SSARF_CSBP_WOAELM'-real_value;

load ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM
error12=ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value;

load ICEEMDAN_MFE_CEEMDAN_SSARF_CSBP_WOAELM
error13=ICEEMDAN_MFE_CEEMDAN_SSARF_CSBP_WOAELM'-real_value;

load ICEEMDAN_MFE_ICEEMDAN_SSARF_CSBP_WOAELM
error14=ICEEMDAN_MFE_ICEEMDAN_SSARF_CSBP_WOAELM'-real_value;

load EMD_MFE_CEEMD_SSARF_CSBP_WOAELM
error15=EMD_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value;

load EEMD_MFE_CEEMD_SSARF_CSBP_WOAELM
error16=EEMD_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value;

load CEEMD_MFE_CEEMD_SSARF_CSBP_WOAELM
error17=CEEMD_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value;

load CEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM
error18=CEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value;

load ICEEMDAN_MFE_SSARF_CSBP_WOAELM
error19=ICEEMDAN_MFE_SSARF_CSBP_WOAELM'-real_value;

load ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC
error20=ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC'-real_value;
%% 预测结果
figure
plot(real_value,'r-')
hold on
plot(RF,'g:')
hold on
plot(BP,'b:')
hold on
plot(ELM,'c:')
hold on
plot(SSARF,'m:')
hold on
plot(CSBP,'y:')
hold on
plot(WOAELM,'k:')
hold on
plot(ICEEMDAN_SSARF,'g:.')
hold on
plot(ICEEMDAN_CSBP,'b:.')
hold on
plot(ICEEMDAN_WOAELM,'c:.')
hold on
plot(ICEEMDAN_MFE_EMD_SSARF_CSBP_WOAELM','g--')
hold on
plot(ICEEMDAN_MFE_EEMD_SSARF_CSBP_WOAELM','b--')
hold on
plot(ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM','c--')
hold on
plot(ICEEMDAN_MFE_CEEMDAN_SSARF_CSBP_WOAELM','m--')
hold on
plot(ICEEMDAN_MFE_ICEEMDAN_SSARF_CSBP_WOAELM','y--')
hold on
plot(EMD_MFE_CEEMD_SSARF_CSBP_WOAELM','g+-')
hold on
plot(EEMD_MFE_CEEMD_SSARF_CSBP_WOAELM','b+-')
hold on
plot(CEEMD_MFE_CEEMD_SSARF_CSBP_WOAELM','c+-')
hold on
plot(CEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM','m+-')
hold on
plot(ICEEMDAN_MFE_SSARF_CSBP_WOAELM','y*-')
hold on
plot(ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC','m.-')
legend('Real value','RF','BP','ELM','SSARF','CSBP','WOAELM','ICEEMDAN-SSARF','ICEEMDAN-CSBP','ICEEMDAN-WOAELM','ICEEMDAN-MFE-EMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-EEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMDAN-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-ICEEMDAN-SSARF-CSBP-WOAELM','EMD-MFE-CEEMD-SSARF-CSBP-WOAELM','EEMD-MFE-CEEMD-SSARF-CSBP-WOAELM','CEEMD-MFE-CEEMD-SSARF-CSBP-WOAELM','CEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM-EC')%期望值 预测值
xlabel('Test sample')%测试样本
ylabel('Forecasting results')%输出
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])

%% 误差图
figure
plot(error1,'g:')
hold on
plot(error2,'b:')
hold on
plot(error3,'c:')
hold on
plot(error4,'m:')
hold on
plot(error5,'y:')
hold on
plot(error6,'k:')
hold on
plot(error7,'g:.')
hold on
plot(error8,'b:.')
hold on
plot(error9,'c:.')
hold on
plot(error10,'g--')
hold on
plot(error11,'b--')
hold on
plot(error12,'c--')
hold on
plot(error13,'m--')
hold on
plot(error14,'y--')
hold on
plot(error15,'g+-')
hold on
plot(error16,'b+-')
hold on
plot(error17,'c+-')
hold on
plot(error18,'m+-')
hold on
plot(error19,'y*-')
hold on
plot(error20,'k.-')
legend('RF','BP','ELM','SSARF','CSBP','WOAELM','ICEEMDAN-SSARF','ICEEMDAN-CSBP','ICEEMDAN-WOAELM','ICEEMDAN-MFE-EMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-EEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMDAN-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-ICEEMDAN-SSARF-CSBP-WOAELM','EMD-MFE-CEEMD-SSARF-CSBP-WOAELM','EEMD-MFE-CEEMD-SSARF-CSBP-WOAELM','CEEMD-MFE-CEEMD-SSARF-CSBP-WOAELM','CEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM-EC')%期望值 预测值
xlabel('Test sample')%测试样本
ylabel('Forecasting errors')%输出
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])
% 画误差箱线图   每一列为一种预测模型的预测误差序列
% MXDB_Result_WC=[error1',error4',error5',error7',error8',error9',error10',error11',error12',error13',error14',error15',error16',error17',error18',error19',error20'];
% MXDB_Result_WC1=[error2',error3',error6'];%数据不对等
%% 箱线图
load boxerror
figure
boxplot(boxerror,'Labels',{'RF','BP','ELM','SSARF','CSBP','WOAELM','ICEEMDAN-SSARF','ICEEMDAN-CSBP','ICEEMDAN-WOAELM','ICEEMDAN-MFE-EMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-EEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMDAN-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-ICEEMDAN-SSARF-CSBP-WOAELM','EMD-MFE-CEEMD-SSARF-CSBP-WOAELM','EEMD-MFE-CEEMD-SSARF-CSBP-WOAELM','CEEMD-MFE-CEEMD-SSARF-CSBP-WOAELM','CEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM-EC'})
set(gca,'XTickLabelRotation',30)
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0.005])
ylabel('Forecasting errors')%输出
%% 柱状图
load bardata
figure
c = categorical({'M1','M2','M3','M4','M5','M6','M7','M8','M9','M10','M11','M12','M13','M14','M15','M16','M17','M18','M19','M20'});
c = reordercats(c,{'M1','M2','M3','M4','M5','M6','M7','M8','M9','M10','M11','M12','M13','M14','M15','M16','M17','M18','M19','M20'});
bar(c,bardata,'stacked')
legend('MAE','RMSE','MAPE');
ylabel('Evaluation results')%输出
xlabel('Model Number')%输出
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0.005])

