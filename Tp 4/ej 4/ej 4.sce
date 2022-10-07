function [presion_vapor, viscosidad, er] = Interpolar(temperatura)
    er = "no se produjeron errores"
    if temperatura <= 0 | temperatura >=100 then
        er = "la temperatura deve estar dentro del rango (0,100)"
        return
    end

    info = fscanfMat("G:\Mi unidad\UTN\Introduccion a la informatica\Tp 7\Tabla_3.txt");

    // separo la info de la matris en vectores
    vector_temperatura = info(:,1)
    vector_presion_vapor = info(:,2)
    vector_viscosidad = info(:,3)

    // interpolo la presion y la viscosidad
    presion_vapor = interp1(vector_temperatura, vector_presion_vapor, temperatura,'spline');
    viscosidad = interp1(vector_viscosidad, vector_viscosidad, temperatura,'spline');

endfunction

// llamo a la funcion dandole una temperatura de 12 grados
[presion_vapor, viscosidad, er] = Interpolar(12)

// llamo a la funcion dandole una temperatura de 58 grados
[presion_vapor, viscosidad, er] = Interpolar(58)

// llamo a la funcion dandole una temperatura de 99 grados
[presion_vapor, viscosidad, er] = Interpolar(99)