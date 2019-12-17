% example of voice record
recObj = audiorecorder(16000, 16, 1); % create a recorder object with sampling rate 16000 Hz
disp("Start speaking"); % print out a start message
recordblocking(recObj, 5); % record the voice for 5 seconds
disp("Stop recording"); % print out a stop message after 5 second
play(recObj); % play back the voice
% obtain the pressure sequence as y array
y = getaudiodata(recObj);
plot(y) % visualize the array
audiowrite('voice.wav', y, 16000); % save the audio data as a wave file. 

%%  modulate5k440.m
%    a 440 Hz tone is modulated
%    onto 5kHz carrier

Fs = 16000; % sampling rate
fx = 440; % baseband signal freq.
Fc = 5000; %carrier frequency
Len = 2; % 2 seconds duration
t = (0:1/Fs:Len-1/Fs); % from 0 to 2 second
x = (1+sin(2*pi*fx*t)); %baseband signal (positive)
f = (1/Len:1/Len:Fs); % frquency components
y = x .* cos(2*pi*Fc*t); %superpose (modulation)
sound(y, Fs);
plot(f, abs(fft(y)));
figure;
plot(t(1:100), y(1:100));
audiowrite('test.wav', y, Fs); %save the sound file