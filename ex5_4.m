I = imread('dachshund.jpg');
whos I;

[col, row, dep] = size(I);
row=uint32(row/2);
col=uint32(col/2);
dep=uint32(dep);
array=zeros(col, row, dep);

for d=1:dep
    for i=1:col
        for j=1:row
            upup = uint32(I(i*2, j*2, d));
            updown = uint32(I(i*2-1, j*2, d));
            downup = uint32(I(i*2, j*2-1, d));
            downdown = uint32(I(i*2-1, j*2-1, d));
            avg = uint8((upup+updown+downup+downdown)/4);
            array(i, j, d) = uint8(avg);
        end
    end
end
buff = uint8(array);

imshow(I);
