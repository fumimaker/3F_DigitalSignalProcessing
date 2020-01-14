hpf = logical(true);
frameLength = 4096;
highN = 10000; % High pass band edge
lowN = 4000;   % Low pass band edge
Fs = 44100;
L=44100;
N=100;
f = zeros(L,1);
if hpf==0
    for i=1:highN
      f(i) =highN; 
    end
else
    for i=44100:-1:lowN
      f(i) = lowN; 
    end
end
yt = ifft(f,'symmetric')/N; % inverse FFT
eqnum1=real(yt);
lowpassFIR = dsp.FIRFilter('Numerator', eqnum1');
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