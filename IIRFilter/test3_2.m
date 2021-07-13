clf;
Ts=1;
Fs=1/Ts;
Wp=0.2*pi;
Ws=0.3*pi;
Rp=1;
As=15;

%%%%%%%%%%%%%%%%%%%%%%���������˲���%%%%%%%%%%%%%%%%%%%
w=[0:1e-3*pi:pi];
WPS=2/Ts*tan(Wp/2);
WSS=2/Ts*tan(Ws/2);
[n,wc]=buttord(WPS,WSS,Rp,As,'s');
[bb,aa]=butter(n,wc,'s');
[b2,a2]=bilinear(bb,aa,Fs);
h1=freqz(b2,a2,w);
[gd1,wd1]=grpdelay(b2,a2);
subplot(2,2,1);plot(w,20*log10(abs(h1)),'b');hold on;
title('��Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%%%%%%%%%%%%%%%%%%%�б�ѩ��һ���˲���%%%%%%%%%%%%
w=[0:1e-3*pi:pi];
WPS=2/Ts*tan(Wp/2);
WSS=2/Ts*tan(Ws/2);
[n,wc]=cheb1ord(WPS,WSS,Rp,As,'s');
[bb,aa]=cheby1(n,Rp,wc,'s');
[b2,a2]=bilinear(bb,aa,Fs);
h2=freqz(b2,a2,w);
[gd2,wd2]=grpdelay(b2,a2);
subplot(2,2,1);plot(w,20*log10(abs(h2)),'r');hold on;
% title('�б�ѩ��һ�ͷ�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%��Բ�˲���%%%%%%%%%%%%%%%%%%%%
w=[0:1e-3*pi:pi];
WPS=2/Ts*tan(Wp/2);
WSS=2/Ts*tan(Ws/2);
[n,wc]=ellipord(WPS,WSS,Rp,As,'s');
[bb,aa]=ellip(n,Rp,As,wc,'s');
[b2,a2]=bilinear(bb,aa,Fs);
h3=freqz(b2,a2,w);
[gd3,wd3]=grpdelay(b2,a2);
subplot(2,2,1);plot(w,20*log10(abs(h3)),'m');hold on;
% title('��Բ�ͷ�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ƶ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);plot(w,(abs(h1)),'b');hold on;
title('��Ƶ����');ylabel('���� ');xlabel('w/rad');
subplot(2,2,2);plot(w,(abs(h2)),'r');hold on;
% title('�б�ѩ��һ�ͷ�Ƶ����');ylabel('���� ');xlabel('w/rad');
subplot(2,2,2);plot(w,(abs(h3)),'m');hold on;
% title('���岻�䷨��Ƶ����');ylabel('���� ');xlabel('w/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��Ƶ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);plot(w,(angle(h1)),'b');hold on;
 title('��Ƶ����');ylabel('��λ');xlabel('w/rad');
subplot(2,2,3);plot(w,(angle(h2)),'r');hold on;
% title('�б�ѩ��һ����Ƶ����');ylabel('��λ');xlabel('w/rad');
subplot(2,2,3);plot(w,(angle(h3)),'m');hold on;
% title('��Բ����Ƶ����');ylabel('��λ');xlabel('w/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Ⱥ��ʱ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);plot(wd1,(gd1),'b');hold on;
title('Ⱥ��ʱ');ylabel('ʱ��/s');xlabel('w/rad');
subplot(2,2,4);plot(wd2,(gd2),'r');hold on;
% title('��Բ��Ⱥ��ʱ');ylabel('ʱ��/s');xlabel('w/rad');
subplot(2,2,4);plot(wd3,(gd3),'m');hold on;
% title('��Բ��Ⱥ��ʱ');ylabel('ʱ��/s');xlabel('w/rad');