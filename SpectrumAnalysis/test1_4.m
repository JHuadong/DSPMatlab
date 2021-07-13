%%��ɢʱ�丵��Ҷ�任DTFT�ķ���
%����Ŀ�ɵ�x��t��=cos(2*pi*Fo*t)+cos(2*pi*F1*t),Fo=330Hz,F1=331Hz,ȡ��Ƶ��Ϊ1024Hz,�õ�һ��1024���������У�

k=0:1023;
N=1024;
L=1024;
x=cos(2*pi*300*k/N)+cos((2*pi*331/N)*k);
window=(rectwin(1024))';
x=x.*window;
X=fftshift(fft(x,L))/N;
fs=1024;ws=2*pi*fs;
m=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(3,2,1);plot(m,abs(X));
grid on;

window=(hamming(N))';
x=x.*window;
X=(fftshift(fft(x,L)))/N;
fs=1024;ws=2*pi*fs;
m=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(3,2,2);plot(m,abs(X));
grid on;

window=(hann(N))';
x=x.*window;
X=(fftshift(fft(x,L)))/N;
fs=1024;ws=2*pi*fs;
m=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(3,2,3);plot(m,abs(X));
grid on;

window=(blackman(N))';
x=x.*window;
X=(fftshift(fft(x,L)))/N;
fs=1024;ws=2*pi*fs;
m=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(3,2,4);plot(m,abs(X));
grid on;

window=(kaiser(N,2.5))';
x=x.*window;
X=(fftshift(fft(x,L)))/N;
fs=1024;ws=2*pi*fs;
m=(-ws/2+(0:L-1)*ws/L)/(2*pi);
subplot(3,2,5);plot(m,abs(X));
grid on;
