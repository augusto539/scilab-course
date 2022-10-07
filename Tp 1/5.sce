// Función suamr valores hasta encontrar el -1
    
// Variables de entrada
    // vector: vector con el que trabajaremos
    
// Variables de salida
    // suma: numero de moles del gas, mol (mol)
    
function [suma]=calcular_suma(vector)
    suma = 0

    // creo un bucle que de tantas vuealtas como elementos hay en el vector "vector"
    for i=1:size(vector,'c')   

        if vector(i) == -1 then         // si el valor en la posision "i" del vector es igual a -1:
            break                       // detengo la ejecusion del bucle for
        else                            // si el valor en la posision "i" del vector NO es igual a -1:
            suma = suma + vector(i)     // sumo el valor en la posision "i" a la variable suma
        end
        
    end
endfunction

    
    
    
    
    
      
    
