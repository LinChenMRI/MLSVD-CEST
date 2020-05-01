function Image_denoise = MatricizationDenoise(Image_noisy,CutNumber)

MatrixSize = size(Image_noisy);

Matricization = zeros(MatrixSize(1)*MatrixSize(2),MatrixSize(3));
count = 1;
for n = 1:1:MatrixSize(1)
    for m = 1:1:MatrixSize(2)
        Matricization(count,:) = Image_noisy(n,m,:);
        count = count+1;
    end
end

[U,S,V] = svd(Matricization);

% CutNumber = 10;
figure; 
semilogy(diag(S),'-o','LineWidth',2,'MarkerSize',7);
ylabel('Multilinear singular value','FontName','Arial','FontSize',16,'Rotation',90);
xlabel('Number','FontName','Arial','FontSize',16);
set(gca,'FontName','Arial','FontSize',18,'fontweight','b','LineWidth',2,'GridLineStyle','--','TickDir','in');
xlim([0,length(diag(S))])
ylim([0,100]);


S(CutNumber:end,:) = 0;
% subplot(1,2,2); semilogy(diag(S),'-o');

Matricization_denoise = U*S*V';

Image_denoise = zeros(size(Image_noisy));

count = 1;
for n = 1:1:MatrixSize(1)
    for m = 1:1:MatrixSize(2)
        Image_denoise(n,m,:) = Matricization_denoise(count,:) ;
        count = count+1;
    end
end