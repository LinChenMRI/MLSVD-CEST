function amp=myfft2(f,N,M)
% 对矩阵做傅立叶变换
% amp=myfft2(f,N,M)   其中N是变换后行数  M是变换后列数
% 2014年6月23日 11:28:00 by 陈林

if nargin==1
    N=size(f,1);
    M=size(f,2);
end

temp=zeros(N,M);
[n,m]=size(f);
temp((N-n)/2+1:(N+n)/2,(M-m)/2+1:(M+m)/2)=f;
amp=fft2(fftshift(temp));
amp=fftshift(amp);
end