fs = 44100;
fb = 0.6;
frameLength = 300;
Delay = 0.04;
den = [1 zeros(1, floor(Delay*fs)) -fb];
num = 1.0;
iir = dsp.IIRFilter('Numerator', num,'Denominator', den);
[file,path]=uigetfile('*.wav');  %wavÉtÉ@ÉCÉãÇÃì«Ç›çûÇ›
fileReader = dsp.AudioFileReader(file,'SamplesPerFrame',frameLength);
deviceWriter = audioDeviceWriter('SampleRate',fileReader.SampleRate);
scope = dsp.SpectrumAnalyzer('SampleRate', fileReader.SampleRate);

while ~isDone(fileReader)
    signal = fileReader();
    yy = iir(signal);
    deviceWriter(yy);
    scope([signal,yy]);
end

release(fileReader);
release(deviceWriter);
release(scope);