// Función para calcular el coeficiente de rosamiento
    
// Variables de entrada
    // vector_rugosidad_relativa: rugosidad del material de la tuberia sobre el diametro de la misma 

// constantes:
    // vector_reynolds: vector con valores entre 10^4 y 10^8
    
function calcular_coeficiente_rosamiento(vector_rugosidad_relativa)
    // limpio la ventana grafica
    clf
    // genero un vector con 5000 valores entre 10^4 y 10^8
    vector_reynolds = logspace(4,8,5000);
    
    // recorro el vector "vector_rugosidad_relativa"
    for i=1:size(vector_rugosidad_relativa,'c')

        // calculo los coefisientes de rosamiento para el valor de rugosidad relativa actual
        vector_coeficiente_rosamiento = (1 ./ log (( vector_rugosidad_relativa(i) / 3.7 ) + (5.74 ./ ( vector_reynolds .^ 0.9))) .^ 1.7573) .^ 2

        // grafico los valores del vector de coeficientes de rosamiento en funcion de los valores del vector de numeros de reynolds
        plot2d(vector_reynolds, vector_coeficiente_rosamiento,style = i)
    end
endfunction
