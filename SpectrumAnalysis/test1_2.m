%%离散时间傅里叶变换DTFT的分析
%由题目可得x（t）=cos(2*pi*Fo*t)+cos(2*pi*F1*t)，Fo=330Hz,F1=331Hz取样频率为1024Hz,得到一个1024的有限序列；

clf;
fs=1024; %采样频率
Ndata=1024; %数据长度
N=1024; %FFT的数据长度
n=-Ndata/2:Ndata/2-1;t=n/fs;   %数据对应的时间序列
x=cos(2*pi*330*t)+cos(2*pi*331*t);   %时间域信号
y=fft(x,N)/2;   %信号的Fourier变换
mag=abs(y);    %求取振幅
pha=angle(y);  %求取相位
f=(0:N-1)*fs/N; %真实频率
figure(1);
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %绘出Nyquist频率之前的振幅
xlabel('频率/Hz');ylabel('振幅');
title('Ndata=1024 Nfft=1024');grid on;
subplot(2,1,2),plot(f(1:N/2-1),pha(1:N/2-1)*2/N);
xlabel('频率/Hz');ylabel('相位');
title('Ndata=1024 Nfft=1024');grid on;

Ndata=1024;   %数据个数
N=2048;     %FFT采用的数据长度
n=0:Ndata-1;t=n/fs;   %时间序列
x=cos(2*pi*330*t)+cos(2*pi*331*t);
y=fft(x,N)/2;
mag=abs(y);
pha=angle(y);
f=(0:N-1)*fs/N; %真实频率
figure(2);
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %绘出Nyquist频率之前的振幅
xlabel('频率/Hz');ylabel('振幅');
title('Ndata=1024 Nfft=2048');grid on;
subplot(2,1,2),plot(f(1:N/2),pha(1:N/2)*2/N); 
xlabel('频率/Hz');ylabel('相位');
title('Ndata=1024 Nfft=2048');grid on;

Ndata=2048; %数据长度
N=4096; %FFT的数据长度
n=0:Ndata-1;t=n/fs;   %数据对应的时间序列
x=cos(2*pi*330*t)+cos(2*pi*331*t);   %时间域信号
y=fft(x,N)/2;   %信号的Fourier变换
mag=abs(y);    %求取振幅
pha=angle(y);  %求取相位
f=(0:N-1)*fs/N; %真实频率
figure(3);
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %绘出Nyquist频率之前的振幅
xlabel('频率/Hz');ylabel('振幅');
title('Ndata=2048 Nfft=4096');grid on;
subplot(2,1,2),plot(f(1:N/2),pha(1:N/2)*2/N);
xlabel('频率/Hz');ylabel('相位');
title('Ndata=1024 Nfft=4096');grid on;