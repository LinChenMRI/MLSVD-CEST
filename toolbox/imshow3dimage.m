function rearrange_data = imshow3dimage(data,ydim)
% Translate a 3-D image into 2-D image by rearrange the data
% ydim is the column number
% by Lin Chen 2015-10-13

data = squeeze(data);
if nargin==1
    ydim = ceil(sqrt(size(data,3)));
end
xdim = ceil(size(data,3)/ydim);
[xnum,ynum,znum]=size(data);
count = 1;
rearrange_data=[];
for n=1:1:xdim
    rearrange_data_temp=zeros(xnum,ynum*ydim);
    for m=1:1:ydim
        rearrange_data_temp(:,(ynum*(m-1)+1):ynum*m) = data(:,:,count);
        count = count+1;
        if count > znum
            break;
        end
    end
    rearrange_data = [rearrange_data;rearrange_data_temp];
end
% rearrange_data = abs(rearrange_data);
% rearrange_data = rearrange_data/max(rearrange_data(:));
figure;imshow(rearrange_data,[],'InitialMagnification','fit'); drawnow
% setsaveas(h,600, 600);
% figure;imagesc(rearrange_data);
if  nargout == 0
    rearrange_data = [];
end
end