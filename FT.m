clear 
close all
clc

t = 1:100;

x = 0.00001:0.025:100.5;


N=99;
y = zeros(length(1:N),length(x));

for i =1:N
y(i,:) = gaussmf(x,[0.05 i]);

end

f=sum(y,1);
% f=sin(5*x)+0.5*sin(10*x)+0.2*sin(8*x);

plot(x,f)
xlabel('x')

%% Here the periodicity in the functions is 1 so I am picking exponentials ranging within 0 to 2

d=0.1:0.1:10;
k=2*pi./d;

% k=linspace(min(k),max(k),10000);
% k=min(k):2*pi/20:max(k);
k=linspace(0.1,2*pi*10.1,1000);


F=zeros(length(k));


for i=1:length(k)
    
   F(i) = exp(1i*k(i)*x)*f';
    
end
figure;

plot(k,abs(F))

