close all;clear all;clc;
addpath('Data');
addpath('toolbox');
load Cr_Data.mat
load ROI.mat

load_kspace = 1;
kspace_original = Data.kspace;

if load_kspace == 1
    load('kspace.mat');
else
    kspace_noisy = kspace_original  +  0.0015* max(abs(kspace_original(:)))*(randn(size(kspace_original)) + 1i* randn(size(kspace_original)));
    [Ue, Se] = lmlra(kspace_noisy,[30,30,4,10]);
    kspace_MLSVD =lmlragen(Ue, Se);
    save('kspace.mat','kspace_noisy','kspace_MLSVD');
end

Image_original = FFT_MultiCoil(kspace_original);
Image_noisy = FFT_MultiCoil(kspace_noisy);
Image_MLSVD = FFT_MultiCoil(kspace_MLSVD);

FitParam.paramdir = [cd ,filesep,'FittingResult']; % save directory
FitParam.satpwr = 2;
FitParam.tsat =1; %s
FitParam.Magfield = 42.58*11.7;
FitParam.ifshowimage = 1;
FitParam.R1 = 1/1.9;
FitParam.PeakOffset = 2; % Cr
FitParam.WholeRange = [-1,1]+FitParam.PeakOffset;    
FitParam.PeakRange = [-0.4,0.4] + FitParam.PeakOffset ;

Freq = Data.Method.MT_Offsets_NoM0/(Data.Acqp.SFO1);

Flag = 'Original';
PLOFCruveFitting(Image_original,Freq,Flag,FitParam,Mask); title(Flag)

Flag = 'Noisy';
PLOFCruveFitting(Image_noisy,Freq,Flag,FitParam,Mask); title(Flag)

Flag = 'MLSVD';
PLOFCruveFitting(Image_MLSVD,Freq,Flag,FitParam,Mask); title(Flag)
