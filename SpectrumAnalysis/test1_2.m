%%��ɢʱ�丵��Ҷ�任DTFT�ķ���
%����Ŀ�ɵ�x��t��=cos(2*pi*Fo*t)+cos(2*pi*F1*t)��Fo=330Hz,F1=331Hzȡ��Ƶ��Ϊ1024Hz,�õ�һ��1024���������У�

clf;
fs=1024; %����Ƶ��
Ndata=1024; %���ݳ���
N=1024; %FFT�����ݳ���
n=-Ndata/2:Ndata/2-1;t=n/fs;   %���ݶ�Ӧ��ʱ������
x=cos(2*pi*330*t)+cos(2*pi*331*t);   %ʱ�����ź�
y=fft(x,N)/2;   %�źŵ�Fourier�任
mag=abs(y);    %��ȡ���
pha=angle(y);  %��ȡ��λ
f=(0:N-1)*fs/N; %��ʵƵ��
figure(1);
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %���NyquistƵ��֮ǰ�����
xlabel('Ƶ��/Hz');ylabel('���');
title('Ndata=1024 Nfft=1024');grid on;
subplot(2,1,2),plot(f(1:N/2-1),pha(1:N/2-1)*2/N);
xlabel('Ƶ��/Hz');ylabel('��λ');
title('Ndata=1024 Nfft=1024');grid on;

Ndata=1024;   %���ݸ���
N=2048;     %FFT���õ����ݳ���
n=0:Ndata-1;t=n/fs;   %ʱ������
x=cos(2*pi*330*t)+cos(2*pi*331*t);
y=fft(x,N)/2;
mag=abs(y);
pha=angle(y);
f=(0:N-1)*fs/N; %��ʵƵ��
figure(2);
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %���NyquistƵ��֮ǰ�����
xlabel('Ƶ��/Hz');ylabel('���');
title('Ndata=1024 Nfft=2048');grid on;
subplot(2,1,2),plot(f(1:N/2),pha(1:N/2)*2/N); 
xlabel('Ƶ��/Hz');ylabel('��λ');
title('Ndata=1024 Nfft=2048');grid on;

Ndata=2048; %���ݳ���
N=4096; %FFT�����ݳ���
n=0:Ndata-1;t=n/fs;   %���ݶ�Ӧ��ʱ������
x=cos(2*pi*330*t)+cos(2*pi*331*t);   %ʱ�����ź�
y=fft(x,N)/2;   %�źŵ�Fourier�任
mag=abs(y);    %��ȡ���
pha=angle(y);  %��ȡ��λ
f=(0:N-1)*fs/N; %��ʵƵ��
figure(3);
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %���NyquistƵ��֮ǰ�����
xlabel('Ƶ��/Hz');ylabel('���');
title('Ndata=2048 Nfft=4096');grid on;
subplot(2,1,2),plot(f(1:N/2),pha(1:N/2)*2/N);
xlabel('Ƶ��/Hz');ylabel('��λ');
title('Ndata=1024 Nfft=4096');grid on;