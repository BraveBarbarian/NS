%% Aufgabe 2ab
clc; clear;

%Testen mit f(x)=x^3
f = @(x) x.^3;

t = trapez(f, 1, 3, 4); % Funktion, Grenzen, N
s = simpson(f, 1, 3, 4); % Funktion, Grenzen, N

fprintf('Ergebnis Trapezregel: %.4f\n', t);
fprintf('Ergebnis Simpsonregel: %.4f\n', s);

%% Aufgabe 2c
clc; clear;


%Si = @(x) (x == 0) .* 1 + (x ~= 0) .* (sin(x) ./ x); %FuncHandle für Sinus 

fprintf('Ergebnis Trapezregel mit N = 4: %.4f\n', trapez(@si, 0, 2*pi, 4));
fprintf('Ergebnis Simpsonregel mit N = 4: %.4f\n\n\n', simpson(@si, 0, 2*pi, 4));

t = trapez(@si, 0, 2*pi, 100);
s = simpson(@si, 0, 2*pi, 100);
fprintf('Ergebnis Trapezregel mit N = 100: %.6f\n', t);
fprintf('Relativer Fehler: %.6f\n ', t-1.4181516);
fprintf('Abweichung: %.6f%% \n ', (1-(1.4181516/t))*100); %Abweichung ausrechnen und printen
fprintf('Ergebnis Simpsonregel mit N = 100: %.6f\n', s);
fprintf('Absoluter Fehler: %.6f\n ', s-1.4181516);
fprintf('Relativer Fehler: %.6f%% ', (1-(1.4181516/s))*100);


%% Aufgabe 2d 
clc; clear;


% Parameter definieren
a = 0.01;
b = 1;
f = @(x) 1 ./ x; % Wichtig: Elementweise Division!


% N-Werte von 500 bis 2000 (x-Achse)
N_vals = 500:50:2000;

% Arrays für den Fehler
err_t = zeros(size(N_vals));
err_s = zeros(size(N_vals));

% Analytische Werte berechnen
    I_a = log(b) - log(a);

for i = 1:length(N_vals) %Alle für alle N-Werte 
    N = N_vals(i); 
    %Simpson und Trapez für N berechnen
    I_t = trapez(f, a, b, N);
    I_s = simpson(f, a, b, N);
    %Absoluten Fehler ausrechnen und in den Vektor schreiben
    err_t(i)  = abs(I_a - I_t);
    err_s(i) = abs(I_a - I_s);
end

%% Grafik 1: Doppelt-lineare Darstellung
figure(1);
plot(N_vals, err_t, 'o-', 'LineWidth', 1.5); 
hold on;
plot(N_vals, err_s, 's-', 'LineWidth', 1.5); 
grid on;
xlabel('N');
ylabel('Absoluter Fehler');
title('Fehlerverlauf in linearer Darstellung');
legend('Trapezregel', 'Simpsonregel');
hold off;
%% Grafik 2: Doppelt-logarithmische Darstellung
figure(2);
loglog(N_vals, err_t, '-o', 'LineWidth', 1.5); 
hold on;
loglog(N_vals, err_s, '-s', 'LineWidth', 1.5); 
grid on;
xlabel('N');
ylabel('Absoluter Fehler');
title('Fehlerverlauf in logarithmischer Darstellung');
legend('Trapezregel', 'Simpsonregel');
hold off;