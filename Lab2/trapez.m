function Ts = trapez(f, a, b, N)
    %noch unzufrieden mit Anzahl zu übergebener Elemente...

    h = (b - a) / N; %Abstände 
    x = linspace(a, b, N + 1); 
    y = f(x); %Funktion damit keine Schleife notwendig

    %Trapezformel
    Ts = h/2 * (y(1) + y(end)) + h*sum(y(2:end-1));
end