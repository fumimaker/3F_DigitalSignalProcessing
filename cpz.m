% create cpz
%
row=600;
col=600;
alpha = 1;
nmap = 64;
colormap(gray(nmap));
czp = zeros(row,col);
for i=1:row
    for j=1:row
       dep = nmap/2*sin(pi()*(i-row/2)*(i-row/2)/alpha/row ...
           +pi()*(j-col/2)*(j-col/2)/alpha/col) + nmap/2;
       czp(i,j) =dep;
    end
end
image(czp);
imwrite(czp, 'czp.bmp');
