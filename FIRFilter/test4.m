  clear;
%  
%   %4.1
%   M=20;
%   N=10;
%   
%   %%%%%%%%%%%%%%%%%%%%%序初始化%%%%%%%%%%%%%%%%%%%%%%%%
%   A=zeros(1,21);
%   B=zeros(1,11);
%   
%   %%%%%%%%%%%%%%%%%%%%序列赋值%%%%%%%%%%%%%%%%%%%%%%%%%%
%   for i=1:(M+1)
%          A(i)=0.8^(i-1);
%    end
%   for j=1:(N-1)
%        B(j)=1;
%   end
%   %%%%%%%%%%%%%%%%%%%%对序列进行卷积%%%%%%%%%%%%%%%%%%%
%   C=conv(A,B);
%   
%   %%%%%%%%%%%%%%%%%画出要求的图像%%%%%%%%%%%%%%%%%%%%%%%
%    subplot(2,2,3),stem(C),title('卷积后的信号');
%   subplot(2,2,1),stem(A),title('指数信号');
%    subplot(2,2,2),stem(B),title('线性信号');

%     %4.2
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%加入音频%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     [Y1,Fs1]=audioread('D:\文档\DSP\实验四的数据和系数\第一场雪加噪声.wav');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%加入滤波器%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     load('D:\文档\DSP\实验四的数据和系数\h50.mat');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%做出h50滤波器的图像%%%%%%%%%%%%%%%%%%%%%%%%%
%     hn1=h50;
%     stem(hn1);
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%对数据进行转置，截取%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Z1=Y1';
%    X1=Z1(1,1:end);
%     Out=conv(X1,hn1);
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%会出要求的图形%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     subplot(2,1,2),plot(Out),title('滤波后音频');
%     subplot(2,1,1),plot(Y1),title('原始音频');%绘制音频信号波形
%     audiowrite('D:\文档\DSP\实验四的数据和系数\第一场雪 50.wav',Out,Fs1);

%     %4.3
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%加入音频%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     [Y2,Fs2]=audioread('D:\文档\DSP\实验四的数据和系数\第一场雪加噪声.wav');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%加入滤波器%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     load('D:\文档\DSP\实验四的数据和系数\h471.mat');
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%做出h50滤波器的图像%%%%%%%%%%%%%%%%%%%%%%%%%
%     hn2=h471;   
%    stem(hn2);
%    
%    %%%%%%%%%%%%%%%%%%%%%%%%%%%对数据进行转置，截取%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Z2=Y2';
%     X2=Z2(1,1:end);
%     Out2=conv(X2,hn2);
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%会出要求的图形%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     subplot(2,1,2),plot(Out2),title('滤波后音频');
%     subplot(2,1,1),plot(Y2),title('原始音频');%绘制音频信号波形
%     audiowrite('D:\文档\DSP\实验四的数据和系数\第一场雪 471.wav',Out2,Fs2);

%   %4.4
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%凯泽窗各项数据的数值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Fs3=16000;
%    fl_A=[100 200 3200 3300];
%    fl_B=[0 1 0];
%    fl_C=[0.05 10^-2.5 0.05];
%   [fl_n_kaiser,fl_wn,fl_beta,fl_ftype]=kaiserord(fl_A,fl_B,fl_C,Fs3);
%   
%   
%   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%生成滤波器并画出其频率相应图像%%%%%%%%%%%%%%%%%
%    figure(1);
%    h=fir1(50,fl_wn,fl_ftype,kaiser(50+1,fl_beta));
%    freqz(h,1);
%    
%    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%加入音频%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    [Y3,Fs3]=audioread('D:\文档\DSP\实验四的数据和系数\第一场雪加噪声.wav');
%    
%    %%%%%%%%%%%%%%%%%%%%%%%%%%%对数据进行转置，截取，卷积%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Z3=Y3';
%    X3=Z3(1,1:end);
%    Ou1=filter(h,1,X3);
%    Ou2=conv(h,X3);
%    
%    %%%%%%%%%%%%%%%%%%%%%%%%%%会出要求的图形%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    figure(2);
%    subplot(2,1,2),plot(Ou1),title('滤波音频');
%    subplot(2,1,1),plot(Ou2),title('卷积音频');
%    audiowrite('D:\文档\DSP\实验四的数据和系数\第一场雪filter滤波50.wav',Ou1,Fs3);
%    audiowrite('D:\文档\DSP\实验四的数据和系数\第一场雪conv滤波50.wav',Ou2,Fs3);


  %4.5
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%凯泽窗各项数据的数值%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   Fs4=16000;
   fl_A1=[100 200 3200 3300];
   fl_B1=[0 1 0];
   fl_C1=[0.05 10^-2.5 0.05];
   [fl_n_kaiser,fl_wn,fl_beta,fl_ftype]=kaiserord(fl_A1,fl_B1,fl_C1,Fs4);
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%生成滤波器及其图像%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   h1=fir1(fl_n_kaiser,fl_wn,fl_ftype,kaiser(fl_n_kaiser+1,fl_beta));
   figure(1);
   freqz(h1,1);
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%加入音频%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   [Y4,Fs4]=audioread('D:\文档\DSP\实验四的数据和系数\第一场雪加噪声.wav');
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%%对数据进行转置，截取，卷积%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   Z4=Y4';
   X4=Z4(1,1:end);
   Ou3=filter(h1,1,X4);
   Ou4=conv(h1,X4);
   
   %%%%%%%%%%%%%%%%%%%%%%%%%%会出要求的图形%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   figure(2);
   subplot(2,1,2),plot(Ou3),title('滤波音频');
   subplot(2,1,1),plot(Ou4),title('卷积音频');
   audiowrite('D:\文档\DSP\实验四的数据和系数\第一场雪filter滤波(M).wav',Ou3,Fs4);
   audiowrite('D:\文档\DSP\实验四的数据和系数\第一场雪conv滤波(M).wav',Ou4,Fs4);
