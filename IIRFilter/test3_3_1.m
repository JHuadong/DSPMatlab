clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%低通%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Fd=20e3;
Td=1/Fd;
FP=5e3;
FS=6e3;
WP=2*pi*FP;
WS=2*pi*FS;
WD=2*pi*Fd;
wp=WP*Td;
ws=WS*Td;
Rp=1;
As=15;

%切比雪夫一型原型滤波器
wc=[0:WD/2];
[a1,b1]=cheb1ord(WP,WS,Rp,As,'s');
[bb,aa]=cheby1(a1,Rp,b1,'s');
h1=freqs(bb,aa,wc);
% subplot(2,2,1);plot(wc/Fd,20*log10(abs(h1)),'b');
% title('低通切比雪夫一型原型幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%切比雪夫二型原型滤波器
wc=[0:WD/2];
[a2,b2]=cheb2ord(WP,WS,Rp,As,'s');
[bb2,aa2]=cheby2(a2,As,b2,'s');
h2=freqs(bb2,aa2,wc);
% subplot(2,2,2);plot(wc/Fd,20*log10(abs(h2)),'b');
% title('低通切比雪夫二型原型幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%椭圆原型滤波器
wc=[0:WD/2];
[a3,b3]=ellipord(WP,WS,Rp,As,'s');
[bb3,aa3]=ellip(a3,Rp,As,b3,'s');
h3=freqs(bb3,aa3,wc);
% subplot(2,2,3);plot(wc/Fd,20*log10(abs(h3)),'b');
% title('低通椭圆原型幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%双线性变换%%%%%%%%%%%%%%%
%切比雪夫一型
WPS=2/Td*tan(wp/2);
WSS=2/Td*tan(ws/2);
w=[0:1e-3*pi:pi];
[N1,WOW1]=cheb1ord(WPS,WSS,Rp,As,'s');
[B1,A1]=cheby1(N1,Rp,WOW1,'s');
[D1,C1]=bilinear(B1,A1,Fd);
hh1=freqz(D1,C1,w);
[gd1,wd1]=grpdelay(D1,C1);
figure(1);
subplot(2,2,1);plot(w,20*log10(abs(hh1)),'b');hold on;
title('低通双线性幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%切比雪夫二型
WPS=2/Td*tan(wp/2);
WSS=2/Td*tan(ws/2);
w=[0:1e-3*pi:pi];
[N2,WOW2]=cheb2ord(WPS,WSS,Rp,As,'s');
[B2,A2]=cheby2(N2,As,WOW2,'s');
[D2,C2]=bilinear(B1,A1,Fd);
hh2=freqz(D2,C2,w);
[gd2,wd2]=grpdelay(D2,C2);
subplot(2,2,1);plot(w,20*log10(abs(hh2)),'r');hold on;
% title('低通切比雪夫二型双线性幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%椭圆型
WPS=2/Td*tan(wp/2);
WSS=2/Td*tan(ws/2);
w=[0:1e-3*pi:pi];
[N3,WOW3]=ellipord(WPS,WSS,Rp,As,'s');
[B3,A3]=ellip(N3,Rp,As,WOW3,'s');
[D3,C3]=bilinear(B3,A3,Fd);
hh3=freqz(D3,C3,w);
[gd3,wd3]=grpdelay(D3,C3);
subplot(2,2,1);plot(w,20*log10(abs(hh3)),'m');hold on;
% title('低通椭圆型双线性幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ 0.5*pi 0.6*pi]);
% set(gca,'YTickMode','manual','YTick',[-50 -15 -1 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%不取对数%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);plot(w,(abs(hh1)),'b');hold on;
title('低通双线性幅频特性');ylabel('幅度 ');xlabel('w/rad');
subplot(2,2,2);plot(w,(abs(hh2)),'r');hold on;
% title('低通切比雪夫二型双线性幅频特性');ylabel('幅度 ');xlabel('w/rad');
subplot(2,2,2);plot(w,(abs(hh3)),'m');hold on;
% title('低通椭圆型双线性幅频特性');ylabel('幅度 ');xlabel('w/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%相位特性%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);plot(w,(angle(hh1)),'b');hold on;
title('低通双线性相位特性');ylabel('相位 ');xlabel('w/rad');
subplot(2,2,3);plot(w,(angle(hh2)),'r');hold on;
% title('低通切比雪夫二型双线性相位特性');ylabel('相位 ');xlabel('w/rad');
subplot(2,2,3);plot(w,(angle(hh3)),'m');hold on;
% title('低通椭圆型双线性相位特性');ylabel('相位 ');xlabel('w/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%群延时%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);plot(wd1,(gd1),'b');hold on;
title('低通双线性群延时');ylabel('时间 ');xlabel('w/rad');
subplot(2,2,4);plot(wd2,(gd2),'r');hold on;
% title('低通切比雪夫二型双线性相位特性');ylabel('时间 ');xlabel('w/rad');
subplot(2,2,4);plot(wd3,(gd3),'m');hold on;
% title('低通椭圆型双线性相位特性');ylabel('时间 ');xlabel('w/rad');