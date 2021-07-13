clf;
f0=500.5;%中心频率
fs=2048; %采样频率
Ndata=1024; %数据长度
N=1024; %FFT的数据长度
n=0:Ndata-1;%数据对应的时间序列
D=10; %重采样频率

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xn=220*sin(2*pi*50*n/fs)+35*sin(2*pi*150*n/fs)+sin(2*pi*496*n/fs)+sin(2*pi*498*n/fs)+sin(2*pi*500*n/fs)+sin(2*pi*502*n/fs)+sin(2*pi*505*n/fs);
z1=fftshift(fft(xn))/N;
subplot(3,2,1),plot((-N/2:N/2-1)/N*fs,abs(z1)); 
xlabel('频率/Hz');ylabel('振幅');
title('未进行平移');grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xo=xn.*exp((-1)*1i*2*pi*f0*n/fs);
z2=fftshift(fft(xo))/N;
subplot(3,2,2),plot([-N/2:N/2-1]/N*fs,abs(z2));
xlabel('频率/Hz');ylabel('振幅');
title('已经进行了平移');grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b=fir1(200,0.0058);
x1=filter(b,1,xo);
z3=fftshift(fft(x1))/N;
subplot(3,2,3),plot([-N/2:N/2-1]/N*fs,abs(z3));
xlabel('频率/Hz');ylabel('振幅');
title('滤波');grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x2=resample(x1,34,2048);
z4=fftshift(fft(x2,2048))/N;
W=linspace(485,516,2048);
subplot(3,2,4),plot(W,abs(z4));
xlabel('频率/Hz');ylabel('振幅');
title('重采样');grid on;




