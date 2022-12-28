%% 加载数据
clc
clear
close all
load real_value
load RF
load BP
load ELM
load SSARF
load CSBP
load WOAELM
load ICEEMDAN_SSARF
load ICEEMDAN_CSBP
load ICEEMDAN_WOAELM
load ICEEMDAN_MFE_EMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_EEMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_CEEMDAN_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_ICEEMDAN_SSARF_CSBP_WOAELM
load EMD_MFE_CEEMD_SSARF_CSBP_WOAELM
load EEMD_MFE_CEEMD_SSARF_CSBP_WOAELM
load CEEMD_MFE_CEEMD_SSARF_CSBP_WOAELM
load CEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_SSARF_CSBP_WOAELM
load ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM_EC
real_value=real_value';


%% 证明二次分解CEEMD的必要性
figure
plot(ICEEMDAN_MFE_EMD_SSARF_CSBP_WOAELM'-real_value,'g--')
hold on
plot(ICEEMDAN_MFE_EEMD_SSARF_CSBP_WOAELM'-real_value,'b.--')
hold on
plot(ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value,'c-')
hold on
plot(ICEEMDAN_MFE_CEEMDAN_SSARF_CSBP_WOAELM'-real_value,'m.-')
hold on
plot(ICEEMDAN_MFE_ICEEMDAN_SSARF_CSBP_WOAELM'-real_value,'y.:')
legend('ICEEMDAN-MFE-EMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-EEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMDAN-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-ICEEMDAN-SSARF-CSBP-WOAELM')%期望值 预测值
xlabel('Test sample')%测试样本
ylabel('Forecasting errors')%输出
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])

figure
plot(ICEEMDAN_MFE_SSARF_CSBP_WOAELM'-real_value,'r--')
hold on
plot(ICEEMDAN_MFE_CEEMD_SSARF_CSBP_WOAELM'-real_value,'b.--')
legend('ICEEMDAN-MFE-SSARF-CSBP-WOAELM','ICEEMDAN-MFE-CEEMD-SSARF-CSBP-WOAELM')%期望值 预测值
xlabel('Test sample')%测试样本
ylabel('Forecasting errors')%输出
set(gca,'fontsize',10);
set(gca,'fontname','times New Roman')
set(gca,'looseInset',[0 0 0 0])
