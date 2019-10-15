
%%  fft of tone A.m
%
%   genrate a 440Hz tone
Fs = 8000; % sampling rate
A = 440; %tone frequency
t = (0:1/Fs:1-1/Fs);
  % we reduce the amplitude by 0.5 to avoid distotion.
y = 0.5*sin(2*pi*(A)*t+pi/4);
sound(y, Fs);
fy = fft(y);
plot(abs(fy)/8000);
xlabel('frequency (Hz)');
ylabel('gain');