
%%  harmonyA.m
%
%   genrate a 440Hz tone


Fs = 8000; % sampling rate
sep = power(2, 1/12);
A = 440; %tone A frequency
Cs= A*power(sep, 4); % tone C#
E = Cs*power(sep, 3);  % tone E
t = (0:1/Fs:2); % from 0 to 2 second
  % we reduce the amplitude by 0.2 to avoid distotion.
  % add the three tones
y = 0.2*(sin(2*pi*(A)*t)+ sin(2*pi*(Cs)*t)+sin(2*pi*(E)*t));
%coef = input('input stretch=');
coef = 2.0;
y2 = stretch(y, coef, 8000);
sound(y2, 8000);

%plot(t(1:100), y2(1:100)); % we only draw firt 100 samples



function y2 = stretch(y, coef, Fs)
[L,~] = size(y); % total length of
% tilda skips the second return value
L = L -1; % usually involves zero
N = fix(0.05*Fs); % 50msec frame, fix can be replaced with floor
Hs = floor(N/2);    % fix size synthes hop
Ha = floor(Hs*coef); % define Ha with input coef
numFrame = floor((L-N)/Ha); % number of analytic frame
    % Hs* numFrame + N = L
y2 = zeros(floor(L/coef),1);
for i=1:numFrame-1
    xa = y(Ha*(i-1)+1:Ha*(i-1)+N); %original signal
    window = hanning(N);          % create Hann window
    xa = xa .* window;  % apply Hann window
    % reconstruct the synthesis frames
    y2(Hs*(i-1)+1:Hs*(i-1)+N) = y2(Hs*(i-1)+1:Hs*(i-1)+N) + xa(1:N);
end
end