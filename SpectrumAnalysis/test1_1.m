%%��ɢʱ�丵��Ҷ�任DTFT�ķ���
%����Ŀ�ɵ�x��t��=cos(2*pi*Fo*t)��Fo=330.5Hz,ȡ��Ƶ��Ϊ1024Hz,�õ�һ��256���������У�

clf;
fs=1024; %����Ƶ��
Ndata=256; %���ݳ���
N=256; %FFT�����ݳ���
n=0:Ndata-1;%���ݶ�Ӧ��ʱ������

subplot(2,1,1);
xn=cos(2*pi*330.5*n/fs);
z=fftshift(fft(xn))/N;
plot([-N/2:N/2-1]/N*fs,abs(z));

subplot(2,1,2);
N=2048;
y=fftshift(fft(xn,N))/N;
plot([-N/2:N/2-1]/N*fs,abs(y));



