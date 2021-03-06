b = imread('dachshund_n.jpg');
[r,c,d] = size(b);
colormap(gray(256));
dv = double(zeros(r,c));
A = zeros(3,3);
for i=1:r-1
     for j=1:c-1
        if (i <= 2)
            imnus1 = i+1;
        else
            imnus1 = i-1;
        end
        if (j <= 2)
            jmnus1 = j+1;
        else
            jmnus1 = j-1;
        end
       
        A(1,1) = b(imnus1-1,jmnus1-1);
        A(1,2) = b(imnus1-1,jmnus1);
        A(1,3) = b(imnus1-1,jmnus1+1);
        A(2,1) = b(imnus1,jmnus1-1);
        A(2,2) = b(imnus1,jmnus1);
        A(2,3) = b(imnus1,jmnus1+1);
        A(3,1) = b(imnus1+1,jmnus1-1);
        A(3,2) = b(imnus1+1,jmnus1);
        A(3,3) = b(imnus1+1,jmnus1+1);
        
        dv(i,j) = median(A,'all');
     end
end
 subplot(1,2,1), image(dv);
 subplot(1,2,2), image(b);