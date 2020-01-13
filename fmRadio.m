%%  71708047
%   êÖñÏéjã≈

Fs = 44100;
Fc = 5000; %carrier frequency
dev = 500;  %adjust sigma
[v, Fvs] = audioread('seyanaTrim.wav');

y = fmmod(v, Fc, Fs, dev);

subplot(2,1,1)
plot(y(:,1));
title('modulated signal')
subplot(2,1,2)
plot(vrr)
title('baseband signal')
audiowrite('seyana5k20kfm.wav', y, Fs);

z = fmdemod(y, Fc, Fs, dev); 

audiowrite('seyanaTrimDemodulated2.wav', z, Fs);