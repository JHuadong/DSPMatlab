%%��ɢʱ�丵��Ҷ�任DTFT�ķ���
%����Ŀ�ɵ�x��t��=cos(2*pi*Fo*t),Fo=330.5Hz,ȡ��Ƶ��Ϊ128Hz,�õ�һ��1024���������У�

clf;
fs=128; %����Ƶ��
T=1/fs; %��������
Ndata=128; %���ݳ���
N=128; %FFT�����ݳ���
n=0:Ndata-1;

subplot(2,1,1);
xn=cos(2*pi*30*n/fs);
z=fftshift(fft(xn))/128;
zz=abs(z);
plot([-N/2:N/2-1]/N*fs,zz);

subplot(2,1,2);
n=0:99;
xn=cos(2*pi*30*n/fs);
z=fftshift(fft(xn))/100;
zz=abs(z);
N=100;
plot([-N/2:N/2-1]/N*fs,zz);



