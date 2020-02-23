%PA 7 
% Miranda Heredia

global G C b;

% initialize empty matrix
G = zeros(5,5);
C = zeros(5,5);
b = zeros(5,1);

%--------------------------------------------------------------------------
% List of the components (netlist):
%---------------------------------------------------------------------


vol(1,0,1);
res(1,2,1);
cap(1,2,0.25);
res(2,0,2);
ind(2,3,0.2);
res(3,0,10);
vcvs(4,0,3,0,(100/10));
res(4,5,0.1);
res(5,0,1000);

% Part B - DC Case Sweep

Vin = linspace(-10, 10, 50);
steps = 50;
for n = 1:steps
    b(6) = Vin(n);
    X = G\b;
    V3(n) = X(3);
    VO(n) = X(5);
    gain(n) = VO(n)/Vin(n);
end
figure(1)
plot(Vin, V3, Vin, VO);
legend('Voltage @ Node 3', 'Voltage @ Output');
xlabel('Vin')



% Part C - AC Case Sweep
% - Frequency Response
F = logspace(0, 9, 5000);
OutputNode = 5;   
for n=1:length(F)
    w = 2*pi*F(n);
    s = 1i*F(n);
    A = G + (s*C);   

    X = A\b;
    Vout(n) = abs(X(OutputNode));
    gain(n) = 20*log(abs(X(OutputNode)));
end
figure(2);
semilogx(F, Vout);
xlabel('Frequency (Hz)');
ylabel('Vout (V)');
title('Frequncy Response')

%Gain Plot

figure(3);
semilogx(F, gain);
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
title('Gain Response');

% Part D - Perturbations

Cs = 0.25 + 0.05*randn(1,1000);
for n = 1:1000
    s = 1i*pi;
    
    C(1,1) = Cs(n);
    C(2,2) = Cs(n);
    C(1,2) = Cs(n)*-1;
    C(2,1) = Cs(n)*-1;
    
    A = G +(s*C);
    X = A\b;
    gainP(n) = 20*log10(abs(X(OutputNode)));
end
figure(4)
histogram(gainP)





