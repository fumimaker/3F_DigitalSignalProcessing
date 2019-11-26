b = imread('dachshund.jpg');
bw = double(rgb2gray(b));
[r,c,d] = size(bw);
colormap(gray(8));
dv = double(zeros(r,c));
dh = double(zeros(r,c)); 
for i=1:r
     for j=1:c
        if (i == 1)
            imnus1 = i+1;
        else
            imnus1 = i-1;
        end
        if (j == 1)
            jmnus1 = j+1;
        else
            jmnus1 = j-1;
        end
        dv(i,j) = 9-abs(bw(i, j) - bw(imnus1, j));
        dh(i,j) = 9-abs(bw(i, j) - bw(i, jmnus1));
     end
end
 d = (dv+dh)/2.0;
 subplot(1,2,1), image(d);
 subplot(1,2,2), image(b);