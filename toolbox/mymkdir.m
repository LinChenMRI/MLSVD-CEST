function mymkdir(datadir)
% 自用生成文件路径，排除已经生成的情况
% by 陈林 2015-2-2 18:53:54

if exist(datadir,'file')==0
    mkdir(datadir);
end
end