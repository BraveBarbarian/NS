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

end