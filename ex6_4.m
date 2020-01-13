%%  71708047
%   水野史暁
%   わかりませんでした...atan使って角度出せばいけるかなと思いました..

Fs = 44100;
Fc = 5000; %carrier frequency
dev = 0.001;  %adjust sigma
[v, Fvs] = audioread('seyanaTrim.wav');
[n, d] = rat(Fvs/Fs); % 有理数近似(音源サンプリングレート/やりたいサンプリングレート)
vrr = resample(v, d, n); % リサンプリング（欲しいサンプリングレートでサンプルし直す的な？）
[r, c] = size(vrr); 
t = (0:1/Fs:r/Fs-1/Fs);
y = zeros(r,2); % IQ signal storage
for i=1:r
    y(i,1) = cos(2*pi()*(Fc+vrr(i)*dev)*t(i));
    y(i,2) = sin(2*pi()*(Fc+vrr(i)*dev)*t(i));
end
subplot(2,1,1)
plot(y(:,1));
title('modulated signal')
subplot(2,1,2)
plot(vrr)
title('baseband signal')
audiowrite('seyana5k20kfm.wav', y, Fs);


Fc = 5000;
Fs = 44100;
dev = 0.01; %adjust sigma
[y, Fss] = audioread('seyana5k20kfm.wav');
[r, c] = size(y);
[n, d] = rat(Fss/Fs);
x = zeros(r,1);
for i=1:r-1
    x(i+1)=x(i)+(acos((y(i+1,1)*y(i,1)+y(i+1,2)*y(i,2))/(sqrt(y(i+1,1)^2+y(i+1,2)^2)*sqrt(y(i,1)^2+y(i,2)^2)))-2*pi()*Fc/Fss)/dev;
end
yy=resample(x,d,n);
%sound(yy,Fs);
plot(yy);

audiowrite('seyanaTrimDemodulated.wav', yy, Fs);