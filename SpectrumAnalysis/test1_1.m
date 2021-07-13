%%离散时间傅里叶变换DTFT的分析
%由题目可得x（t）=cos(2*pi*Fo*t)，Fo=330.5Hz,取样频率为1024Hz,得到一个256的有限序列；

clf;
fs=1024; %采样频率
Ndata=256; %数据长度
N=256; %FFT的数据长度
n=0:Ndata-1;%数据对应的时间序列

subplot(2,1,1);
xn=cos(2*pi*330.5*n/fs);
z=fftshift(fft(xn))/N;
plot([-N/2:N/2-1]/N*fs,abs(z));

subplot(2,1,2);
N=2048;
y=fftshift(fft(xn,N))/N;
plot([-N/2:N/2-1]/N*fs,abs(y));



