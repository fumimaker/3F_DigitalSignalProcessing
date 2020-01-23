%   71708047
%   ��������w��3�N
%   ����j��
%
%   �g�p���̖���FM���W�I������Ȃ������ł��D
%   �O�����񂩂璸����FM�����̕����Ɖ����o�͂��s���܂����D

frameLength = 2000;
N   = 3000;        % FIR filter order
Fp  = 15000;       % 15 kHz passband-edge frequency
Rp  = 0.00057565; % Corresponds to 0.01 dB peak-to-peak ripple
Rst = 1e-4;       % Corresponds to 80 dB stopband attenuation
sample = 48000;
Fc = 0; % �L�����A���g��
Fs = 240000; % �T���v�����O���[�g�{����240khz�����Ǔ{����
dev = 7500*16; %adjust sigma
y = zeros(frameLength,2);
iqr = dsp.AudioFileReader('fameiq.wav', 'SamplesPerFrame', frameLength);
x = zeros(frameLength-1,1);
[n, d] = rat(sample/Fs); %�ߎ��L����
player = audioDeviceWriter('SampleRate', sample);

F0 = 19000;
notchspec = fdesign.notch('N,F0,Q',2,F0,10,sample);
notchfilt = design(notchspec,'SystemObject',true);

% specify an audio file
eqnum = firceqrip(N,Fp/(Fs/2),[Rp Rst],'passedge'); % eqnum = vec of coeffs
% passband edge is normalized with sampling frequency
% create a filter
lowpassFIR = dsp.FIRFilter('Numerator', eqnum);
% show the characteristics of the filter
fvtool(lowpassFIR, 'Fs', Fs, 'Color', 'White');
scope = dsp.SpectrumAnalyzer('SampleRate', iqr.SampleRate);
while ~isDone(iqr)
    audiodata = iqr();
    y(:,1) = audiodata(:,1);
    y(:,2) = audiodata(:,2);
    for i=1:frameLength-1
        %omega = acos( (y(i+1,1)*y(i,1)+y(i+1,2)*y(i,2)) / (sqrt(y(i+1,1)^2+y(i+1,2)^2) * sqrt(y(i,1)^2+y(i,2)^2)) );
        omega = angle(complex(y(i+1,1),y(i+1,2)) .* complex(y(i,1), -y(i,2)));
        x(i) = omega*Fs/2/pi/dev;
    end
    yy=resample(x,sample,Fs);
    yy=real(yy);
    %player(yy); 
    % apply LPF
    z = lowpassFIR(yy);
    zz = notchfilt(z);
    % write to speaker
    player(zz);
    % show
    scope([yy,z,zz]);
end
release(iqr);
release(player);
release(scope);
audiowrite('fameiqDemod.wav', zz, sample);



% 
% 
% fileReader = dsp.AudioFileReader('fameiqDemod.wav','SamplesPerFrame',frameLength);
% deviceWriter = audioDeviceWriter('SampleRate',fileReader.SampleRate);
% 
% 
% while  ~isDone(fileReader)
%     % acquire frame lenth audio stream
%     signal = fileReader();
%     % apply LPF
%     yy = lowpassFIR(signal);
%     % write to speaker
%     deviceWriter(yy);
%     % show
%     scope([signal,yy]);
% end
% release(fileReader);
% release(deviceWriter);
% release(scope);
