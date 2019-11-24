I = imread('dachshund.jpg');
whos I;
[row, col, dep] = size(I);
row=uint32(row/4);
col=uint32(col/4);
dep=uint32(dep);

array=zeros(col, row, dep);

for d=0:dep-1
    for i=0:col-1
        for j=0:row-1
            array(i, j, d) = (I(j*2, i*2, d) + I(j*2+1, i*2, d) + I(j*2, i*2+1, d) + I(j*2+1, i*2+1, d))/4;
        end
    end
end

image(array);