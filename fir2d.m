%% fir2d
%  apply 6 tap FIR low pass filter to an image
b = imread('czp.bmp');
[r,c,d] = size(b);
% filter numerators
fir = [-0.1513 0.1926 0.5501 0.5501 0.1926 -0.1513];
dv = double(zeros(r,c,d));
dh = double(zeros(r,c,d));
for i=4:r-3
    for j=4:c-3
        for k=1:d
          dv(i,j,k) = 0.0;
          dh(i,j,k) = 0.0;
            % apply filter
          for r = -3:2
            dv(i,j,k) = dv(i,j,k)+fir(r+4)*double(b(i,j+r, k));
            dh(i,j,k) = dh(i,j,k)+fir(r+4)*double(b(i+r,j, k));
          end
        end
    end
end
% final image shall have unsigned int values
d = uint8((dv+dh)/2.0);
image(d);