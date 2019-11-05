Fs=8000;
L=8000;
N=1000;

f=zeros(L,1);
for i=1:N
    f(i)=L;
end
yt=ifft(f);
plot(real(yt));
sound(real(yt), Fs);