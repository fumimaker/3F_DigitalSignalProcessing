%%  71708047
%   êÖñÏéjã≈

Fc = 75000;
Fs = 200000;
dev = 1; %adjust sigma
[y, Fss] = audioread('fameiq.wav');
y = real(y);
[r, c] = size(y);
[n, d] = rat(Fss/Fs);
x = zeros(r,1);
for i=1:r-1
    x(i+1)=x(i)+(acos((y(i+1,1)*y(i,1)+y(i+1,2)*y(i,2))...
        /(sqrt(y(i+1,1)^2+y(i+1,2)^2)*sqrt(y(i,1)^2+y(i,2)^2)))-2*pi()*Fc/Fss)/dev;
end
yy=resample(x,d,n);
yy=real(yy);
%sound(yy,Fs);
plot(yy);

audiowrite('fmradioDemod.wav', yy, Fs);