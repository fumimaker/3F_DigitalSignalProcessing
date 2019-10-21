
%%  fft of tone A,Cs,E
%
%1週間色々調べたり考えてみましたが、サンプリング周波数が何か影響を及ぼしているのではないかと考えら
%れます。倍音などによる効果により一部の音が強く聞こえるためこうなとも考えられますが、
%そうであるかはわかりませんでした。他の音でも実験しましたが同様の結果となりました。
%現実の世界でも起こり得るんでしょうか。エネルギーの総和が正しければ現実でも起こりそうではあります...
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