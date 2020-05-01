function amp=myfft2(f,N,M)
% �Ծ���������Ҷ�任
% amp=myfft2(f,N,M)   ����N�Ǳ任������  M�Ǳ任������
% 2014��6��23�� 11:28:00 by ����

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