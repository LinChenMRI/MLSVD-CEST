function mymkdir(datadir)
% ���������ļ�·�����ų��Ѿ����ɵ����
% by ���� 2015-2-2 18:53:54

if exist(datadir,'file')==0
    mkdir(datadir);
end
end