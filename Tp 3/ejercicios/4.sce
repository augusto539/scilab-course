// ***************************************************************************
// *  Función de ordenamiento de tablas de propiedades en sentido ascendente *
// ***************************************************************************
//
// Esta función ordena una matriz en la cual los datos de las distintas
// columnas están relacionadas según una columna clave
// Esta función ordena los datos de la columna clave en sentido ascendente
// y reorganiza los datos del resto de las columnas según  la nueva ubicación 
// de los datos de la columna clave luego del ordenamiento
//
// Datos de entrada
// ----------------
// datos: matriz de n filas y m columnas conteniendo los datos a ordenar
// col: columna de la matriz datos utilizada como clave de ordenamiento
//
// Datos de salida
// ---------------
// mat: matriz del mismo tamaño que datos, ordenada según la columna col
// er: código de error
//     0: no hay errores
//     600: la variable col está fuera de rango respecto de la matriz datos
function [mat, er]=ordenar(datos, col)
    // defino las variables er y mat como 0
    er=0
    mat=0    
    // defino las variables n y m como la cantidad de filas y columnas que tiene la matris
    n=size(datos,"r")
    m=size(datos,"c")

    if col<1 | col>m then
        er=600
        return
    end

    mat=zeros(n,m)
    aux=datos(:,col)

    [ord,k]=gsort(aux,"r","i")

    
    
    for j=1:m
        if j<>col then
            for i=1:n
                mat(i,j)=datos(k(i),j)
            end
        else
            for i=1:n
                mat(i,j)=ord(i)
            end
        end
    end
endfunction


// codigos de error:
    // 0: no error
    // 600: el valor de viscosidad seleccionado no se encuentra dentro de la tercer columna de la matris de datos

    function [temperatura, er] = Buscar_datos_por_viscosidad(matris_datos, viscosidad)
        // declaro las variables er y temperatura con valor 0
        er = 0
        temperatura = 0
    
        // hago un bucle que de tantas bueltas como filas tiene la matris
        for i = 1:size(matris_datos,"r")
            // si el dato de temperatura en la fila actual de la matris es mayor o igual al dato de temperatura ingresado:        
            if matris_datos(i,3) >= viscosidad then
    
                // le doy el valor de la fila actual a la variable "temperatura"
                temperatura = matris_datos(i,1)
    
                // detengo la ejecusion del loop
                break
            end
        end
    
        // si la variable "vector_datos_por_temperatura" es igual a 0
        if temperatura == 0 then
            er = 600            // le doy el valor 600 a la variable "er"
        end
    
    endfunction




function [temperatura, er] = Datos()
    // defino la variable "direccion_datos" con el string de la direccion del archivo con los datos originales
    direccion_datos = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 6\info\Tabla_3.txt'
    //direccion_datos = 'G:\Mi unidad\UTN\Introduccion a la informatica\Tp 6\info\Tabla_3.txt'

    // cargo los datos
    datos = fscanfMat(direccion_datos);

    // ordeno la matris
    [mat, er] = ordenar(datos, 3)

    //disp(datos)
    //disp(mat)

    // separo la matris en vectores
    temperatura = mat(:, 1)
    presion_vapor = mat(:, 2)
    viscosidad = mat(:, 3)

    // busco el valor de la temperatura segun la viscosidad
    temperatura = Buscar_datos_por_viscosidad(mat, 1)
endfunction

[temperatura, er] = Datos()