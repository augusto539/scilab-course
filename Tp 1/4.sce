// Función para hacer operaciones con un vector

// Variables de entrada
    // vector: vector con el que vamos a trabajar

// Variables de salida
    // N_moles: numero de moles del gas, mol (mol)
    // er: código de error

// Codigos de error
    // 1: el vector no es un vector fila
    // 2: el vector tiene menos de dos elementos

function [Sp, Sn, er]=Opero_con_vector(vector)
    er = 0
    n = 0
    Sp = 0
    Sn = 0

    // reviso que el vector sea un vector fila
    if size(vector,'r') <> 1 then         // si el numero de filas del vector es distinto de 1:
        er = 1                            // le doy el valor 1 a la variable "er"
        return                            // detengo la ejecusion de la funcion
    end

    // reviso que el vector tenga almenos 2 elementos
    if size(vector,'c') < 2 then          // si el numero de columnas del vector es menor a 2:
        er = 2                            // le doy el valor 2 a la variable "er"
        return                            // detengo la ejecusion de la funcion
    end

    // asigno la cantidad de elementos del vector a la variable "n"
    n = size(vector,'c')

    // sumo los elementos positivos en Sp y los negativos en Sn
    for i=1:size(vector,'c')                      // recorro el vector "vector"

        // reviso si el valor en la posision "i" del vector es positivo
        if vector(i) > 0 then           // si el valor en la posision "i" del vector es mayor a 0:
            Sp = Sp + vector(i)         // le doy el valor: Sp mas el valor en la posision "i" del vector a Sp
            continue                    // paso a la siguiente vuelte del loop
        end

        // reviso si el valor en la posision "i" del vector es negativo
        if vector(i) < 0 then           // si el valor en la posision "i" del vector es menor a 0:
            Sn = Sn + vector(i)         // le doy el valor: Sn mas el valor en la posision "i" del vector a Sn
            continue                    // paso a la siguiente vuelta del loop
        end
        
    end
    
endfunction
