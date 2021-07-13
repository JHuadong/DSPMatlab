clf;
Ts=0.01;
Fs=1/Ts;
Wp=0.2*pi;
Ws=0.3*pi;
Rp=1;
As=30;

%%%%%%%%%%%%%%%%%%%%%%%%%%连续滤波器%%%%%%%%%%%%%%%
[n,Wn]=buttord(Wp,Ws,Rp,As,'s');
[b,a]=butter(n,Wn,'s');
w=[0:1e-3*pi:pi];
h=freqs(b,a,w);
[gd1,wd1]=grpdelay(b,1);
figure(1);subplot(2,2,1);
plot(w,20*log10(abs(h)),'b');hold on;
title('幅频特性(取对数)');xlabel('w/rad');ylabel('幅度/dB');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%冲激响应不变法%%%%%%%%%%%%%%
[n,Wn]=buttord(Wp/Ts,Ws/Ts,Rp,As,'s');
[b,a]=butter(n,Wn,'s');
w=[0:1e-3*pi:pi];
[b1,a1]=impinvar(b,a,Fs);
h1=freqz(b1,a1,w);
[gd2,wd2]=grpdelay(b1,a1);
subplot(2,2,1);
plot(w,20*log10(abs(h1)),'r');hold on;
% title('脉冲不变法幅频特性(取对数)');ylabel('幅度 dB');xlabel('w/rad');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%双线性变换%%%%%%%%%%
w=[0:1e-3*pi:pi];
WPS=2/Ts*tan(Wp/2);
WSS=2/Ts*tan(Ws/2);
[n,wc]=buttord(WPS,WSS,Rp,As,'s');
[bb,aa]=butter(n,wc,'s');
[b2,a2]=bilinear(bb,aa,Fs);
h2=freqz(b2,a2,w);
[gd3,wd3]=grpdelay(b2,a2);
subplot(2,2,1);plot(w,20*log10(abs(h2)),'m');hold on;
% title('双线性变换(取对数)');xlabel('w/rad');ylabel('幅度/dB');
% set(gca,'XTickMode','manual','XTick',[ pi*0.2 pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%FIR窗的设计%%%%%%%%%%
%w=[0:1e-3*pi:pi];
%wdelta=Ws-Wp;
%N=ceil(8*pi/wdelta);
%Wn=(0.2+0.3)*pi/2;
%[nfir,wcfir]=buttord(0.2,0.3,Rp,As);
%bfir=fir1(nfir,wcfir,hanning(nfir+1));
%bfir=fir1(N,Wn/pi,hanning(N+1));
%[hfir,f]=freqz(bfir,1,w);

b3=fir1(120,Wp/pi); %汉明窗
[h4,w4]=freqz(b3,1);
[gd4,wd4]=grpdelay(b3,1);
subplot(2,2,1);
plot(w4,20*log10(abs(h4)),'y');
% title('FIR窗(取对数)');xlabel('w/rad');ylabel('幅度/dB');
% set(gca,'XTickMode','manual','XTick',[ 0.2*pi pi*0.3 ]);
% set(gca,'YTickMode','manual','YTick',[-50 -30 -3 0]);
% grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%相频特性%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,2);
plot(w,(angle(h)),'b');hold on;
 title('相频特性');xlabel('w/rad');ylabel('相位/rad');
subplot(2,2,2);
plot(w,(angle(h1)),'r');hold on;
% title('脉冲不变法相频特性');xlabel('w/rad');ylabel('相位/rad');
subplot(2,2,2);
plot(w,(angle(h2)),'m');hold on;
% title('双线性相频特性');xlabel('w/rad');ylabel('相位/rad');
subplot(2,2,2);
plot(w4,(angle(h4)),'y');hold on;
% title('FIR窗相频特性');xlabel('w/rad');ylabel('相位/rad');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%幅频特性%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,3);
plot(w,(abs(h)),'b');hold on;
title('幅度频率特性');xlabel('w/rad');ylabel('幅度');
subplot(2,2,3);
plot(w,(abs(h1)),'r');hold on;
% title('脉冲不变法幅频特性');xlabel('w/rad');ylabel('幅度');
subplot(2,2,3);
plot(w,(abs(h2)),'m');hold on;
% title('双线性幅频特性');xlabel('w/rad');ylabel('幅度');
subplot(2,2,3);
plot(w4,(abs(h4)),'y');hold on;
% title('FIR窗幅频特性');xlabel('w/rad');ylabel('幅度');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%群延时%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,4);
plot(wd1,(gd1),'b');hold on;
title('群延时');xlabel('w/rad');ylabel('时间/s');
subplot(2,2,4);
plot(wd2,(gd2),'r');hold on;
% title('脉冲不变法幅频特性');xlabel('w/rad');ylabel('时间/s');
subplot(2,2,4);
plot(wd3,(gd3),'m');hold on;
% title('双线性幅频特性');xlabel('w/rad');ylabel('时间/s');
subplot(2,2,4);
plot(wd4,(gd4),'y');hold on;
% title('FIR窗幅频特性');xlabel('w/rad');ylabel('时间/s');
