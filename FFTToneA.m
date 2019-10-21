
%%  fft of tone A,Cs,E
%
%1�T�ԐF�X���ׂ���l���Ă݂܂������A�T���v�����O���g���������e�����y�ڂ��Ă���̂ł͂Ȃ����ƍl����
%��܂��B�{���Ȃǂɂ����ʂɂ��ꕔ�̉��������������邽�߂����ȂƂ��l�����܂����A
%�����ł��邩�͂킩��܂���ł����B���̉��ł��������܂��������l�̌��ʂƂȂ�܂����B
%�����̐��E�ł��N���蓾���ł��傤���B�G�l���M�[�̑��a����������Ό����ł��N���肻���ł͂���܂�...
Fs = 8000; % sampling rate
A = 440; %tone frequency
sep = power(2, 1/12);
Cs= A*power(sep, 4); % tone C#
E = Cs*power(sep, 3);  % tone E
t = (0:1/Fs:1-1/Fs);
y = 0.5*sin(2*pi*(A)*t+pi/4) + 0.5*sin(2*pi*(Cs)*t+pi/4) + 0.5*sin(2*pi*(E)*t+pi/4);
sound(y, Fs);
fy = fft(y);
plot(abs(fy)/8000);
xlabel('frequency (Hz)');
ylabel('gain');
disp(A);
disp(Cs);
disp(E);