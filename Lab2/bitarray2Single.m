function num = bitarray2Single(bitArray)
    %BITARRAY2SINGLE: rechne bit array der Laenge 32 in single Datentyp um
    
    % Check, dass der uebergebene Vektor die richtigen Eigenschaften hat
    assert(length(bitArray) == 32);
    assert(all(bitArray == 0 | bitArray == 1));

    % Specifikation IEEE single precision
    Ne = 8;
    Nm = 23; 
    Emin = -126;
    
    % TODO: Implementierung vervollstaendigen
    % 1. Bit Vorzeichen
    % 0 pos, 1 neg. 
    S = bitArray(1);
    vorzeichen = (-1)^S;

    % Bit 2 bis 9: Exponent;
    ExpBits = bitArray(2:1+Ne);
    
    % von Binär zu Dezimal
    ExpDez = 0;
    for i = 1:Ne
        ExpDez = ExpDez + ExpBits(i) * 2^(Ne - i);
    end

    % Bit 10 bis 23: Mantisse
    MantisseBits = bitArray(1 + Ne+1: end);
    M_wert = 0;
    for j = 1:Nm
        M_wert = M_wert + MantisseBits(j) * 2^(-j);
    end

    % Fallunterscheidung
   
    if ExpDez == 0 % Denormalisierte Zahl (inklusive der Zahl 0)
        num = vorzeichen * (0+M_wert) * 2^Emin;
    elseif ExpDez == 255 % Alle Exponenten 1
        % Sonderfälle: Inf oder NaN
        if M_wert == 0
            num = vorzeichen * Inf;
        else
            num = NaN;
        end

    else % Normalisierte Zahl
        % Verschiebung bei single-precision ist 127
        e = ExpDez -127;
        num = vorzeichen * (1+M_wert) * 2^e;
    end

    % Sicherstellen, dass die Ausgabe auch den Datentyp 'single' besitzt
    num = single(num);

end
