% color morphology
% 71708047
% êÖñÏéjã≈

Is = imread('dachshund.jpg');
Ig = rgb2gray(Is);
imshow(Ig);
 % the second argument is ÅferodeÅf for eroding.
P = morph(Is, 'erode');
% we can repeat the morphological transformation.

P = morph(P, 'dilate');
P = morph(P, 'dilate');

imshow(P);
%
% morphology transformation
%
function R = morph(Is, op)
  [r, c] = size(Is);
  R = uint8(zeros(r,c));
  for i=1:r
    for j=1:c
        mc = Is(i,j);
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
               if Is(cr,cc) < mc && strcmp(op, 'dilate')
                   mc = Is(cr,cc);
               elseif Is(cr,cc) > mc && strcmp(op, 'erode')
                   mc = Is(cr,cc);
               end
            end
        end
        R(i,j) = mc;
    end
  end
end