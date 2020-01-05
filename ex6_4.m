%%  71708047
%   水野史暁
%   わかりませんでした...atan使って角度出せばいけるかなと思いました..

Fs = 20000;
Fc = 5000; %carrier frequency
dev = 0.2;  %adjust sigma
[v, Fvs] = audioread('seyanaTrim.wav');
[n, d] = rat(Fvs/Fs);
vrr = resample(v, d, n);
[r, c] = size(vrr);
t = (0:1/Fs:r/Fs-1/Fs);
y = zeros(r,1); % IQ signal storage
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

maru = zeros(r,1);
for i=1:r
    maru(i,1) = atan(y(i,2)/y(i,1));
end

audiowrite('seyanaTrimDemodulated.wav', maru, Fs);