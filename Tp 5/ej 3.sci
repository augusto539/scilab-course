// Funcion para buscar raices en una funcion a partir de un data set
//
// Variables de entrada
    // valor_buscado: valor que se quiere buscar
    // tolerancia: cuantas sifras significativas se requieren en el resultado
// Variables de salida
    // Vector_raices: valores de x donde y vale el valor buscado

function [Vector_raices, er] = main(valor_buscado, tolerancia)
    // defino Variables
    er = "no se ha producido ningun error"                      // defino "er" como un string con el texto "no se ha producido ningun error"
    Vector_raices = []                                          // defino "Vector_raices" como un vector vacio
    limite_inferior =  valor_buscado - tolerancia               // defino "limite_inferior" como el valor buscado menos la tolerancia
    limite_superior = valor_buscado + tolerancia                // defino "limite_inferior" como el valor buscado mas la tolerancia
    direccion_datos = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 8\Reac01.txt'        // defino la variable "direccion_datos" con el string de la direccion del archivo con los datos originales
    
    // cargo los datos
    datos = fscanfMat(direccion_datos);

    // creo la variable "datos_interpolados" para almacenar la matris de datos
    datos_interpolados(:,1) = linspace(0,10,1000)                                                           // la primer columna de la matris almacena los minutos
    datos_interpolados(:,2) = interp1(datos(:,1), datos(:,2), datos_interpolados(:,1),'spline');            // la segunda columna almacena las concentraciones

    // grafico los dos sets de datos
    plot2d(datos(:,1), datos(:,2))
    plot2d(datos_interpolados(:,1),  datos_interpolados(:,2), style=5)

    // busco en la matris el valor buscado
    for i=1:size(datos_interpolados, "r")                       // hago un bucle que de tantas bueltas como filas hay en la matris

        // reviso si el valor actual de la segunda columna de la matris ests dentro del intervalo dado por los dos limites
        if datos_interpolados(i,2) > limite_inferior & datos_interpolados(i,2) < limite_superior then

            Vector_raices($+1) = datos_interpolados(i,1)        // gurado el valor de la primer columna en "Vector_raices"
        end
    end

    // reviso si hay valores dentro de "Vector_raices", si no los hay, le doy el valor "no se a encontrado el valor ingresado" a "er"
    if Vector_raices == [] then
        er = "no se a encontrado el valor ingresado"
    end

endfunction

[Vector_raices, er] = main(3, 1d-2)