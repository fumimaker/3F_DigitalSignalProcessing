I = imread('dachshund.jpg');
whos I;
image(I);
[col, row, dep] = size(I);
row=uint32(row/2);
col=uint32(col/2);
dep=uint32(dep);
array=zeros(col, row, dep);

for d=1:dep
    for i=1:col
        for j=1:row
            upup=I(i*2, j*2, d);
            updown=I(i*2-1, j*2, d);
            downup=I(i*2, j*2-1, d);
            downdown=I(i*2-1, j*2-1, d);
            array(i, j, d) = (upup+updown+downup+downdown)/4;
        end
    end
end

image(array);