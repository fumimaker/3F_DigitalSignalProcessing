Fs=8000;
L=8000*2;


f=zeros(L,1);
f(880)=L;
%440Hzの整数倍にしないといけないから
yt=ifft(f);
sound(imag(yt), Fs);