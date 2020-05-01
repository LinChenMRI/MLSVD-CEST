close all;clear all;clc;
addpath('Data');
addpath('toolbox');
load Cr_Data.mat

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

imshow3dimage(Image_noisy); title('Noisy')
imshow3dimage(Image_MLSVD); title('MLSVD')
imshow3dimage(abs(Image_original-Image_MLSVD)/max(Image_original(:))*100);colorbar; caxis([0,2]); title('Original - MLSVD');
imshow3dimage(abs(Image_noisy-Image_MLSVD)/max(Image_noisy(:))*100);colorbar; caxis([0,5]); title('Noisy - MLSVD');