clf;
f0=432.2;%����Ƶ��
fs=2048; %����Ƶ��
N=2048; %���ݳ���
n=0:N-1;%���ݶ�Ӧ��ʱ������
xn=3*sin(2*pi*431.1*n/fs)+4*sin(2*pi*432.2*n/fs)+5*sin(2*pi*433.3*n/fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ZFFT&&FFT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);
z1=fftshift(fft(xn))/N;
subplot(2,2,1),
plot((-N/2:N/2-1)/N*fs,(abs(z1)),'b'); 
 xlabel('Ƶ��/Hz');ylabel('���');
 title('FFT');grid on;

xo=xn.*exp((-1)*1i*2*pi*f0*n/fs);
z2=fftshift(fft(xo))/N;
%subplot(2,2,2),plot([-N/2:N/2-1]/N*fs,abs(z2));
% xlabel('Ƶ��/Hz');ylabel('���');
% title('�Ѿ�������ƽ��');grid on;


b=fir1(200,0.00214);
x1=filter(b,1,xo);
z3=fftshift(fft(x1))/N;
% % subplot(2,2,3),
% plot([-N/2:N/2-1]/N*fs,abs(z3),'r');hold on;
% xlabel('Ƶ��/Hz');ylabel('���');
% title('�˲�');grid on;


x2=resample(x1,11,2048);
z4=fftshift(fft(x2,2048))/N;
W=linspace(427.8,436.6,2048);
subplot(2,2,2),
plot(W,abs(z4),'r');hold on;
 xlabel('Ƶ��/Hz');ylabel('���');
 title('ZFFT');grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CZT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1=427.8;%ϸ��Ƶ�ʶ����
f2=436.6;%ϸ��Ƶ�ʶ��յ�
M=30; %ϸ������
w=exp((-1)*1i*2*pi*(f2-f1)/(fs*M));%ϸ��Ƶ�εĿ��(����)
a=exp(1i*2*pi*f1/fs);%ϸ��Ƶ�ε���ʼ��
x3=czt(xn,M,w,a);
z5=fftshift(fft(x3,2048))/N;

W=linspace(427.5,440,2048);
subplot(2,2,3);
plot(W,abs(z5),'m');hold on;
xlabel('Ƶ��/Hz');ylabel('���');
title('CZT');grid on;
