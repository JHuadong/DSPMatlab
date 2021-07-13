clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fd=20e3;
Td=1/Fd;
FP1=4e3;
FP2=7e3;
FS2=8e3;
FS1=2.5e3;
WP1=2*pi*FP1;
WP2=2*pi*FP2;
WS1=2*pi*FS1;
WS2=2*pi*FS2;
WD=2*pi*Fd;
wp1=WP1*Td;wp2=WP2*Td;
ws1=WS1*Td;ws2=WS2*Td;
Rp=1;
As=40;

%�б�ѩ��һ��ԭ���˲���
wc=[0:WD/2];
[a1,b1]=cheb1ord([WP1,WP2],[WS1,WS2],Rp,As,'s');
[bb,aa]=cheby1(a1,Rp,b1,'stop','s');
h1=freqs(bb,aa,wc);
% subplot(2,2,1);plot(wc/Fd,20*log10(abs(h1)),'b');
% title('��ͨ�б�ѩ��һ��ԭ�ͷ�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.4*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%�б�ѩ�����ԭ���˲���
wc=[0:WD/2];
[a2,b2]=cheb2ord([WP1,WP2],[WS1,WS2],Rp,As,'s');
[bb2,aa2]=cheby2(a2,As,b2,'stop','s');
h2=freqs(bb2,aa2,wc);
% subplot(2,2,2);plot(wc/Fd,20*log10(abs(h2)),'b');
% title('��ͨ�б�ѩ�����ԭ�ͷ�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%��Բԭ���˲���
wc=[0:WD/2];
[a3,b3]=ellipord([WP1,WP2],[WS1,WS2],Rp,As,'s');
[bb3,aa3]=ellip(a3,Rp,As,b3,'stop','s');
h3=freqs(bb3,aa3,wc);
% subplot(2,2,3);plot(wc/Fd,20*log10(abs(h3)),'b');
% title('��ͨ��Բԭ�ͷ�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%˫���Ա任%%%%%%%%%%%%%%%
%�б�ѩ��һ��
WPS1=(2/Td)*tan(wp1/2);WPS2=2/Td*tan(wp2/2);
WSS1=(2/Td)*tan(ws1/2);WSS2=2/Td*tan(ws2/2);
w=[0:1e-3*pi:pi];
[N1,WOW1]=cheb1ord([WPS1,WPS2],[WSS1,WSS2],Rp,As,'s');
[B1,A1]=cheby1(N1,Rp,WOW1,'stop','s');
[D1,C1]=bilinear(B1,A1,Fd);
hh1=freqz(D1,C1,w);
[gd1,wd1]=grpdelay(D1,C1,w,'whole');
figure(1);
subplot(2,2,1);plot(w,20*log10(abs(hh1)),'b');hold on;
 title('�����Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;
hold on;

%�б�ѩ�����

w=[0:1e-3*pi:pi];
[N2,WOW2]=cheb2ord([WPS1,WPS2],[WSS1,WSS2],Rp,As,'s');
[B2,A2]=cheby2(N2,As,WOW2,'stop','s');
[D2,C2]=bilinear(B1,A1,Fd);
hh2=freqz(D2,C2,w);
[gd2,wd2]=grpdelay(D2,C2,w,'whole');
subplot(2,2,1);plot(w,20*log10(abs(hh2)),'r'); hold on;
% title('��ͨ�б�ѩ�����˫���Է�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid; 
hold on;

%��Բ��

w=[0:1e-3*pi:pi];
[N3,WOW3]=ellipord([WPS1,WPS2],[WSS1,WSS2],Rp,As,'s');
[B3,A3]=ellip(N3,Rp,As,WOW3,'stop','s');
[D3,C3]=bilinear(B3,A3,Fd);
hh3=freqz(D3,C3,w);
[gd3,wd3]=grpdelay(D3,C3,w,'whole');
subplot(2,2,1);plot(w,20*log10(abs(hh3)),'m'); hold on;
% title('��ͨ��Բ��˫���Է�Ƶ����(ȡ����)');ylabel('���� dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ȡ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);plot(w,(abs(hh1)),'b');hold on;

subplot(2,2,2);plot(w,(abs(hh2)),'r');hold on;
% title('��ͨ�б�ѩ�����˫���Է�Ƶ����');ylabel('���� ');xlabel('w/rad');
subplot(2,2,2);plot(w,(abs(hh3)),'m');hold on;
% title('��ͨ��Բ��˫���Է�Ƶ����');ylabel('���� ');xlabel('w/rad');
title('�����Ƶ����');ylabel('���� ');xlabel('w/rad');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%��λ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);plot(w,(angle(hh1)),'b');hold on;
title('�����λ����');ylabel('��λ ');xlabel('w/rad');
subplot(2,2,3);plot(w,(angle(hh2)),'r');hold on;
% title('��ͨ�б�ѩ�����˫������λ����');ylabel('��λ ');xlabel('w/rad');
subplot(2,2,3);plot(w,(angle(hh3)),'m');hold on;
% title('��ͨ��Բ��˫������λ����');ylabel('��λ ');xlabel('w/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%Ⱥ��ʱ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);plot(wd1,(gd1),'b');hold on;
title('���Ⱥ��ʱ');ylabel('ʱ�� ');xlabel('w/rad');
subplot(2,2,4);plot(wd2,(gd2),'r');hold on;
% title('��ͨ�б�ѩ�����˫����Ⱥ��ʱ');ylabel('ʱ�� ');xlabel('w/rad');
subplot(2,2,4);plot(wd3,(gd3),'m');hold on;
% title('��ͨ��Բ��˫����Ⱥ��ʱ');ylabel('ʱ�� ');xlabel('w/rad');