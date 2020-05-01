function Image = FFT_MultiCoil(kspace,fftsize)

if nargin == 1
    fftsize = [64,64];
end

Image = zeros([fftsize,size(kspace,4)]);

for slicenum = 1:1:size(kspace,4)
    Image_temp = 0;
    for coilnum = 1:1:size(kspace,3)
        Image_temp = Image_temp + abs(myfft2(kspace(:,:,coilnum,slicenum),fftsize(1),fftsize(2))).^2;
    end
    Image(:,:,slicenum) = circshift(imrotate(sqrt(Image_temp),180),[1,3]);
end
end