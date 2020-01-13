%%  71708047
%   …–ìj‹Å

Fs = 44100;
Fc = 5000; %carrier frequency
dev = 500;  %adjust sigma
[v, Fvs] = audioread('seyanaTrim.wav');

y = fmmod(v, Fc, Fs, dev);

audiowrite('seyana5k20kfm2.wav', y, Fs);

z = fmdemod(y, Fc, Fs, dev); 

audiowrite('seyanaTrimDemodulated2.wav', z, Fs);

