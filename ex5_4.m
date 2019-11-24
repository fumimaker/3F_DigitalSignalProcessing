I = imread('dachshund.jpg');
whos I;
[row, col, dep] = size(I);
row=uint32(row/4);
col=uint32(col/4);
dep=uint32(dep);

array=zeros(col, row, dep);

for d=0:1:dep-1
    for i=0:1:col-1
        for j=0:1:row-1
            array(i, j, d) = (I(row*2, col*2, d) + I(row*2+1, col*2, d) + I(row*2, col*2+1, d) + I(row*2+1, col*2+1, d))/4;
        end
    end
end

image(array);