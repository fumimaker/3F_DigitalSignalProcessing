%%  amdemodulation
%
Fs = 20000; %audio out sampling
Fc = 5000;   %carrier freqency
[yy, Fss] = audioread(Åfvoice5k20k.wavÅf);
[n,d] = rat(Fss/Fs);
[r,c] = size(yy);
t = (0:1/Fss:r/Fss-1/Fss);
f = (Fss/r:Fss/r:Fss);
yc = cos(2*pi*Fc*t);
z2c = yyÅf .* yc; %demodulation
Rp  = 0.00057565; % Corresponds to 0.01 dB peak-to-peak ripple
Rst = 1e-6;       % Corresponds to 80 dB stopband attenuation
eqnum = firceqrip(20,Fc/(Fss/2),[Rp Rst],ÅfpassedgeÅf);
fvtool(eqnum,ÅfFsÅf,Fss,ÅfColorÅf,ÅfWhiteÅf) % Visualize filter
lowpassFIR = dsp.FIRFilter(ÅfNumeratorÅf, eqnum); %apply LPF