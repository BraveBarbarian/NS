function Ss = simpson(f, a, b, N)
    %noch unzufrieden mit Anzahl zu übergebener Elemente...
    
    h = (b - a) / N; %Abstände 
    x = linspace(a, b, N + 1); 
    y = f(x); %Funktion damit keine Schleife notwendig

    %Simpsonformel
    %Aufteilung in mehrere Zeilen für Übersichtlichkeit
    sum_gerade = sum(y(2:2:end-1)); %index slicing in der Summe
    sum_ungerade = sum(y(3:2:end-2)); 
    Ss = (h/3) * (y(1) + y(end) + 4*sum_gerade + 2*sum_ungerade);
end