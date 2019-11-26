%% add_noise
filename=uigetfile('./*.jpg');
I = imread(filename);
g = rgb2gray(I);
J = addnoise(g, 0.999);
subplot(1,2,1), imshow(I),title("oiginal");
subplot(1,2,2), imshow(J), title("noise");
% save the noise added image with _n
[filepath,name,ext] = fileparts(filename);
imwrite(J, strcat(name,'_n',ext));
function J =  addnoise(g, p)
    [row, col, c] = size(g);
    J = uint8(zeros(row,col,c));
    for i=1:row
        for j=1:col
            if rand > p
                n = 255;
            else
                n = 0;
            end
            for k=1:c
               J(i,j,k) = g(i,j) + n;
            end
        end
    end
end
