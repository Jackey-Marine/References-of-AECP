clc
clear
[num,txt,raw]=xlsread('C:\Users\86138\Desktop\高阶工程认知实践\地震测试\实验三代码和数据\trail3_2kg.xlsx') ;
t_y = num(:,4);
f_y = abs(fft(t_y));
N = length(f_y);
fs = 51;                 %sample frequency
f_x =(0:N-1)*(fs/N);     %frequency range
n_2 = ceil(N/2);

[f_y0,f_y0_index] = max(f_y); %y0
w0 = f_x(f_y0_index);         %w0

%图二方法
% [f_y1,f_y1_index] = max(f_y(1:f_y0_index-1));  %y1
% f_x_w1 = f_x(f_y1_index);                      %x1
% 
% 
% [f_y2,f_y2_index] = max(f_y(f_y0_index+1:n_2));  %y2
% f_y2_index = f_y2_index+f_y0_index;
% f_x_w2 = f_x(f_y2_index);                        %x2

%图一方法
f_y1 = f_y(f_y0_index-1);
f_x_w1 = f_x(f_y0_index-1);

f_y2 = f_y(f_y0_index+1);
f_x_w2 = f_x(f_y0_index+1);


x1_x0 = @(y) (w0-f_x_w1)/(f_y0-f_y1)*(y-f_y1)+f_x_w1;
w1 = x1_x0(0.707*f_y0);
x0_x2 = @(y) (w0-f_x_w2)/(f_y0-f_y2)*(y-f_y2)+f_x_w2;
w2 = x0_x2(0.707*f_y0);

xi = vpa((w2-w1)/(2*w0),8)

plot(f_x(1:n_2),f_y(1:n_2));


