// Funcion para calcular la masa total de la mescla

// Variables de entrada
    // vector_masas: vector con las masas de los gases de la mescla, g (gramos)

// Variables de salida
    // masa_total: masa total de la mescla, g (gramos)
    // er: codigo de error

// Codigos de error:
    // 5: El vector masas no puede tener mas de una fila
    // 6: Los valores de "vector_masas" deven ser positivos 

function [er, masa_total]=Calcular_masa_total(vector_masas)
    er = 0
    masa_total = 0

    // se verifica la cantidad de filas ('rows') del vector "vector_masas"
    if size(vector_masas,'r') <> 1 then
        er = 5
        return
    end

    // reviso que los valores ingresados sean positivos y si lo son los sumo a "masa_total"
    for i=1:length(vector_masas)            // recorro el vector "vector_masas"
        if vector_masas(i) < 0 then         // si el valor de la posision "i" de "vector_masas" es menor a 0:
            er = 6                          // le doy el valor 6 a la variable er
            break                           // detengo la ejecusion del bucle for
        end

        // calculo el total de masas
        // "masa_total" es igual al valor anterior de "masa_total" mas el valor de la posision "i" de "vector_masas"
        masa_total = masa_total + vector_masas(i)
    end

endfunction


// Funcion para calcular el volumen de una mescal de gases

// Variables de entrada
    // matris_gases: matris donde las filas representan a un gas, la primer columna representa la masa molar del gas y la segunda columna representa la masa del gas
    // ejemplo de matris de gases: matris_gases = [28.0134 2213.0586; 31.9988 639.976; 39.9480 39.948]
    // presion: presion del gas,  atm (atmosferas) 
    // temperatura: temperatura del gas, K (kelvins)

// Constantes:
    // R: constante universal de los gases, 0.08206, atm L / k mol (atmosfera litro por kelvin mol)

// Variables de salida
    // vector_volumen_parcial: vulumenes de los gases, L (litros)
    // volumen_total: vulumen de la mescla de gases, L (litros)
    // er: codigo de error

// Codigos de error:
    // 1: la presion dever ser un numero estrictamente positivo
    // 2: la temperatura dever ser un numero estrictamente positivo
    // 3: la masa molar dever ser un numero estrictamente positivo
    // 4: la masa dever ser un numero estrictamente positivo
  

    function [er, volumen_total]=Calcular_vulumen_gas(matris_gases,presion,temperatura)
        R = 0.08206
        er = 0
        volumen_parcial = 0
        volumen_total = 0

        if presion <= 0 then             // si la presion es menor o igual a 0:
            er = 1                       // le doy el valor 1 a la variable "er"
        end
        if temperatura <= 0 then
            er = 2
        end
    
        if er <> 0 then         // si la variable "er" es distinta de 0:
            return              // detengo la ejecusion de la funsion
        end

        // hago un bucle que de tantas vueltas como filas tenga mi matris de gases
        for i=1:size(matris_gases,'r')
            // reviso que la masa molar y la masa sean positivas
            if matris_gases(i,1) <= 0  then     // si el valor de la columna 1 fila i es menor o igual a 0:
                er = 3                          // le doy el valor 3 a la variable "er"
                break                           // detengo la ejecusion del bucle for
            end
            if matris_gases(i,2) <= 0  then
                er = 4
                break
            end

            // calculo el volumen parcial del gas
            volumen_parcial = (matris_gases(i,2) / matris_gases(i,1)) * ((R * temperatura) / presion)

            // sumo el volumen parcial antes calculado al volumen total
            volumen_total = volumen_total + volumen_parcial
        end

    endfunction



// Funcion para calcular la masa total de la mescla

// Variables de entrada
    // vector_masas: vector con las masas de los gases de la mescla, g (gramos)

// Variables de salida
    // densidad_mescla: densidad de la mescla de gases, g/l (gramos por litro)
    // er: codigo de error

// Codigos de error:
    // 5: El vector masas no puede tener mas de una fila
    // 6: Los valores de "vector_masas" deven ser positivos 

function [er, densidad_mescla]=Calcular_densidad_mescla(matris_gases,presion,temperatura)
    er = 0

    // calculor el volumen total de los gases
    [er, volumen_total]=Calcular_vulumen_gas(matris_gases,presion,temperatura)

    // reviso si hubo errores en la ejecusion de la funcion "Calcular_vulumen_gas"
    if er <> 0 then         // si la variable "er" es distinta de 0:
        return              // detengo la ejecusion de la funsion
    end

    // declaro la variable "vector_masas" como la matris transpuesta de la segunda columna de "matris_gases"
    vector_masas = matris_gases(:,2)'

    // calculo la masa total de los gases
    [er, masa_total]=Calcular_masa_total(vector_masas)

    // reviso si hubo errores en la ejecusion de la funcion "Calcular_masa_total"
    if er <> 0 then         // si la variable "er" es distinta de 0:
        return              // detengo la ejecusion de la funsion
    end

    // calculo la densidad de la mescla de gases
    densidad_mescla = masa_total / volumen_total
    
endfunction
