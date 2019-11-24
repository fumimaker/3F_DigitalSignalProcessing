I = imread('dachshund.jpg');
whos I;
image(I);
[col, row, dep] = size(I);
row=uint32(row/2);
col=uint32(col/2);
dep=uint32(dep);
array2=zeros(4,4,2)
array=zeros(col, row, dep);

for d=0:dep-1
    for i=0:col-1
        for j=0:row-1
            upup=I(j*2, i*2, d);
            updown=I(j*2-1, i*2, d);
            downup=I(j*2, i*2-1, d);
            downdown=I(j*2-1, i*2-1, d);
            array(i, j, d) = (upup+updown+downup+downdown)/4;
        end
    end
end

image(array);