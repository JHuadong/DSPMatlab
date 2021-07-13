clf;
Ts=0.01;
Fs=1/Ts;
Wp=0.2*pi;
Ws=0.3*pi;
Rp=1;
As=30;

%%%%%%%%%%%%%%%%%%%%%%%%%%�����˲���%%%%%%%%%%%%%%%
[n,Wn]=buttord(Wp,Ws,Rp,As,'s');
[b,a]=butter(n,Wn,'s');
w=[0:1e-3*pi:pi];
h=freqs(b,a,w);
[gd1,wd1]=grpdelay(b,1);
figure(1);subplot(2,2,1);
plot(w,20*log10(abs(h)),'b');hold on;
title('��Ƶ����(ȡ����)');xlabel('w/rad');ylabel('����/dB');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%�弤��Ӧ���䷨%%%%%%%%%%%%%%
[n,Wn]=buttord(Wp/Ts,Ws/Ts,Rp,As,'s');
[b,a]=butter(n,Wn,'s');
w=[0:1e-3*pi:pi];
[b1,a1]=impinvar(b,a,Fs);
h1=freqz(b1,a1,w);
[gd2,wd2]=grpdelay(b1,a1);
subplot(2,2,1);
plot(w,20*log10(abs(h1)),'r');hold on;
% title('���岻�䷨��Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%˫���Ա任%%%%%%%%%%
w=[0:1e-3*pi:pi];
WPS=2/Ts*tan(Wp/2);
WSS=2/Ts*tan(Ws/2);
[n,wc]=buttord(WPS,WSS,Rp,As,'s');
[bb,aa]=butter(n,wc,'s');
[b2,a2]=bilinear(bb,aa,Fs);
h2=freqz(b2,a2,w);
[gd3,wd3]=grpdelay(b2,a2);
subplot(2,2,1);plot(w,20*log10(abs(h2)),'m');hold on;
% title('˫���Ա任(ȡ����)');xlabel('w/rad');ylabel('����/dB');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%FIR�������%%%%%%%%%%
%w=[0:1e-3*pi:pi];
%wdelta=Ws-Wp;
%N=ceil(8*pi/wdelta);
%Wn=(0.2+0.3)*pi/2;
%[nfir,wcfir]=buttord(0.2,0.3,Rp,As);
%bfir=fir1(nfir,wcfir,hanning(nfir+1));
%bfir=fir1(N,Wn/pi,hanning(N+1));
%[hfir,f]=freqz(bfir,1,w);

b3=fir1(120,Wp/pi); %������
[h4,w4]=freqz(b3,1);
[gd4,wd4]=grpdelay(b3,1);
subplot(2,2,1);
plot(w4,20*log10(abs(h4)),'y');
% title('FIR��(ȡ����)');xlabel('w/rad');ylabel('����/dB');
% set(gca,'XTickMode','manual','XTick',[ 0.2*pi pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ƶ����%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);
plot(w,(angle(h)),'b');hold on;
 title('��Ƶ����');xlabel('w/rad');ylabel('��λ/rad');
subplot(2,2,2);
plot(w,(angle(h1)),'r');hold on;
% title('���岻�䷨��Ƶ����');xlabel('w/rad');ylabel('��λ/rad');
subplot(2,2,2);
plot(w,(angle(h2)),'m');hold on;
% title('˫������Ƶ����');xlabel('w/rad');ylabel('��λ/rad');
subplot(2,2,2);
plot(w4,(angle(h4)),'y');hold on;
% title('FIR����Ƶ����');xlabel('w/rad');ylabel('��λ/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ƶ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);
plot(w,(abs(h)),'b');hold on;
title('����Ƶ������');xlabel('w/rad');ylabel('����');
subplot(2,2,3);
plot(w,(abs(h1)),'r');hold on;
% title('���岻�䷨��Ƶ����');xlabel('w/rad');ylabel('����');
subplot(2,2,3);
plot(w,(abs(h2)),'m');hold on;
% title('˫���Է�Ƶ����');xlabel('w/rad');ylabel('����');
subplot(2,2,3);
plot(w4,(abs(h4)),'y');hold on;
% title('FIR����Ƶ����');xlabel('w/rad');ylabel('����');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Ⱥ��ʱ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);
plot(wd1,(gd1),'b');hold on;
title('Ⱥ��ʱ');xlabel('w/rad');ylabel('ʱ��/s');
subplot(2,2,4);
plot(wd2,(gd2),'r');hold on;
% title('���岻�䷨��Ƶ����');xlabel('w/rad');ylabel('ʱ��/s');
subplot(2,2,4);
plot(wd3,(gd3),'m');hold on;
% title('˫���Է�Ƶ����');xlabel('w/rad');ylabel('ʱ��/s');
subplot(2,2,4);
plot(wd4,(gd4),'y');hold on;
% title('FIR����Ƶ����');xlabel('w/rad');ylabel('ʱ��/s');
