Fs=8000;
L=8000*2;


f=zeros(L,1);
f(880)=L;
%440Hz�̐����{�ɂ��Ȃ��Ƃ����Ȃ�����
yt=ifft(f);
sound(imag(yt), Fs);