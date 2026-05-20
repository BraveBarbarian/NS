clear; clc;

daten = load("A1Test.mat");
disp('Geladene Variablen:');
disp(fields(daten));

ergebnis1 = bitarray2Single(daten.bitarray1);
ergebnis2 = bitarray2Single(daten.bitarray2);
ergebnis3 = bitarray2Single(daten.bitarray3);
ergebnis4 = bitarray2Single(daten.bitarray4);
fprintf('Ergebnis für Vektor 1: %g\n', ergebnis1);
fprintf('Richtige Lösung für Vektor 1: %g\n', daten.singleWert1)
fprintf('Ergebnis für Vektor 2: %g\n', ergebnis2);
fprintf('Richtige Lösung für Vektor 2: %g\n', daten.singleWert2)
fprintf('Ergebnis für Vektor 3: %g\n', ergebnis3);
fprintf('Ergebnis für Vektor 4: %g\n', ergebnis4);
