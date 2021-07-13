n = -1:3;
x = 1:5;
w= (0:1:500)*pi/500;                             
X= x* exp(-1i).^(n'*w);                                          %n'  £º¾ØÕónµÄ×ªÖÆ
realX = real(X);
imagX = imag(X);
angX = angle(X);
magX = abs(X);
subplot(2,2,1);plot(w/pi,magX);grid
xlabel('fequency in pi unit');
title('magnitude part');
subplot(2,2,2);plot(w/pi,realX);grid
xlabel('frequency in pi unit');
title('real part');
subplot(2,2,3);plot(w/pi,imagX);grid
xlabel('frequency in pi unit');
title( 'imaginary part');
subplot(2,2,4);plot(w/pi, angX);grid
xlabel('frequency in pi unit');
title('angle part');