frameLength = 4096;
N = 100; 
Fp = 10e3; 
Qp = 4e3; 
Rp = 0.00057565; 
Rst = 1e-4; 
Fs = 44100;
eqnuma = firceqrip(N,Fp/(Fs/2),[Rp Rst],'high');
eqnumb = firceqrip(N,Qp/(Fs/2),[Rp Rst],'high');
eqnumab = eqnuma - eqnumb;
lowpassFIR = dsp.FIRFilter('Numerator', eqnum12);
fvtool(lowpassFIR, 'Fs', Fs, 'Color', 'White');
fileReader = dsp.AudioFileReader('music.mp3','SamplesPerFrame',frameLength);
deviceWriter = audioDeviceWriter('SampleRate',fileReader.SampleRate);
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