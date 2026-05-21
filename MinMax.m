clear; clc;

allOnesVec = ones(1, 32);

ergebnisOnes = bitarray2Single(allOnesVec);

% Vergleichswert abfragen
matlabRealMax = realmax('single');

fprintf('Min: \n')
fprintf('Ergebnis der eigenen Funktion: %f (Datentyp: %s)\n', ergebnisOnes, class(ergebnisOnes));
fprintf('Wert von realmax(''single''): %e\n', matlabRealMax);

allZerosVec = zeros(1, 32);

ergebnisZeros = bitarray2Single(allZerosVec);

matlabRealMin = realmin('single');

fprintf('Max: \n');
fprintf('Ergebnis der eigenen Funktion: %f (Datentyp: %s)\n', ergebnisZeros, class(ergebnisZeros));
fprintf('Wert von realmin(''single''): %e\n', matlabRealMin);