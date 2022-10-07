// codigos de error:
    // 0: no error
    // 600: el valor de temperatura seleccionado no se encuentra dentro de la primer columna de la matris de datos

function [vector_datos_por_temperatura, er] = Buscar_datos_por_temperatura(matris_datos, temperatura)
    // declaro las variables er y vector_datos_por_temperatura con valor 0
    er = 0
    vector_datos_por_temperatura = 0

    // hago un bucle que de tantas bueltas como filas tiene la matris
    for i = 1:size(matris_datos,"r")

        // si el dato de temperatura en la fila actual de la matris es mayor o igual al dato de temperatura ingresado:        
        if matris_datos(i,1) >= temperatura then

            // le doy el valor de la fila actual a la variable "vector_datos_por_temperatura"
            vector_datos_por_temperatura = matris_datos(i,:)

            // detengo la ejecusion del loop
            break
        end
    end

    // si la variable "vector_datos_por_temperatura" es igual a 0
    if vector_datos_por_temperatura == 0 then
        er = 600            // le doy el valor 600 a la variable "er"
    end

endfunction

function [vector_datos_por_temperatura_1, vector_datos_por_temperatura_2, vector_datos_por_temperatura_3, er] = Datos()
    // defino la variable "direccion_datos" con el string de la direccion del archivo con los datos originales
    direccion_datos = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 6\info\Tabla_3.txt'
    //direccion_datos = 'G:\Mi unidad\UTN\Introduccion a la informatica\Tp 6\info\Tabla_3.txt'

    // cargo los datos
    datos = fscanfMat(direccion_datos);

    // divido la matris en vectores:
    temperatura = datos(:, 1)
    presion_vapor = datos(:, 2)
    viscosidad = datos(:, 3)

    // busco valores en la matris
    [vector_datos_por_temperatura_1, er] = Buscar_datos_por_temperatura(datos, 20)         // busco los datos asosiados a una temperatura de 20
    [vector_datos_por_temperatura_2, er] = Buscar_datos_por_temperatura(datos, 61)         // busco los datos asosiados a una temperatura de 61
    [vector_datos_por_temperatura_3, er] = Buscar_datos_por_temperatura(datos, 89)         // busco los datos asosiados a una temperatura de 89

endfunction

[vector_datos_por_temperatura_1, vector_datos_por_temperatura_2, vector_datos_por_temperatura_3, er] = Datos()