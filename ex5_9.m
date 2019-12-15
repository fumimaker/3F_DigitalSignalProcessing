% color morphology
% EX5.9ÇÇ‚ÇËÇ‹ÇµÇΩÅB
% 71708047
% êÖñÏéjã≈

Is = imread('dachshund.jpg');
Ig = rgb2gray(Is);
imshow(Ig);
 % the second argument is ÅferodeÅf for eroding.
P = morph(Is, 'dilate');
% we can repeat the morphological transformation.

P = morph(P, 'dilate');
P = morph(P, 'dilate');

imshow(P);
%
% morphology transformation
%
function R = morph(Is, op)
  [r, c, d] = size(Is);
  R = uint8(zeros(r,c,d));
  for a=1:d
    for i=1:r
        for j=1:c
            mc = Is(i,j,a);
            for k = -1:1
                for s = -1:1
                   cr = i+k;
                   cc = j+s;
                   if (i+k<1)
                       cr = abs(i+k)+1;
                   elseif (i+k>r)
                       cr = 2*r-i-k;
                   end
                   if (j+s<1)
                       cc = abs(j+s)+1;
                   elseif (j+s>c)
                       cc = 2*c - j-s;
                   end
                   if Is(cr,cc,a) < mc && strcmp(op, 'dilate')
                       mc = Is(cr,cc,a);
                   elseif Is(cr,cc,a) > mc && strcmp(op, 'erode')
                       mc = Is(cr,cc,a);
                   end
                end
            end
            R(i,j,a) = mc;
        end
    end
  end
end