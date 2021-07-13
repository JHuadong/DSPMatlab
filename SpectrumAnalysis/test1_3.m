%%离散时间傅里叶变换DTFT的分析
%由题目可得x（t）=cos(2*pi*Fo*t),Fo=330.5Hz,取样频率为128Hz,得到一个1024的有限序列；

clf;
fs=128; %采样频率
T=1/fs; %采样周期
Ndata=128; %数据长度
N=128; %FFT的数据长度
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



