frameLength = 4096;
N = 100; % filter tap数
Fp = 10e3; %10kHz passband
Qp = 4e3; %4kHz passband
Rp = 0.00057565; % パスバンドリップル
Rst = 1e-4; % stopバンド抑圧
Fs = 44100;
eqnum1 = firceqrip(N,Fp/(Fs/2),[Rp Rst],'high');%HPF
eqnum2 = firceqrip(N,Qp/(Fs/2),[Rp Rst],'high');%HPF
eqnum12 = eqnum1 - eqnum2;
lowpassFIR = dsp.FIRFilter('Numerator', eqnum12);
fvtool(lowpassFIR, 'Fs', Fs, 'Color', 'White');
fileReader = dsp.AudioFileReader('music.mp3','SamplesPerFrame',frameLength); deviceWriter = audioDeviceWriter('SampleRate',fileReader.SampleRate);
scope = dsp.SpectrumAnalyzer('SampleRate', fileReader.SampleRate);
while ~isDone(fileReader)
signal = fileReader();
yy = lowpassFIR(signal);
    deviceWriter(yy);
scope([signal,yy]);
end
release(fileReader);
release(deviceWriter);
release(scope);