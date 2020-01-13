centerfreq = 81900000;
samplerate = 240000;
framesize = 3200;
Fc = 75000;
Fs = 150000;
dev = 50;
h = comm.SDRRTLReceiver('0','CenterFrequency', centerfreq, ...
    'SampleRate',samplerate, ...
    'SamplesPerFrame', framesize, ...
    'EnableTunerAGC', true, ...
    'OutputDataType', 'double');

%create audio player with the audio sampling rate (audiosr)
player = audioDeviceWriter('SampleRate',samplerate);
if  ~isempty(sdrinfo(h.RadioAddress)) % acquire frame until empty
    while(1)
        [audiodata,  ~] = step(h);  % fetch data and save in audio variable.
        demodData = fmdemod(real(audiodata), Fc, Fs, dev); % demodulation
       % apply lowpass filter
       % obtain 19k pilot tone to extract stereo signals
       % peak fequency required to decode stereo sounds
       % apply diemphasis filter
       % resample (->48kHz)
       % aggregates two channel
       aggch = horzcat(leftch,rightch); %left and right channels are merged
        player(aggch); %playback the audio stream as stereo
    end
end

d = fdesign.peak('N,F0,BW,Ast',20,2*19000/samplerate,.02,80);
peakf = design(d,'cheby2','SystemObject',true);
fvtool(peakf)
