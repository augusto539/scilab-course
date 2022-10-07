
function Datos()
    // limpio la consola
    clc

    // defino la variable "direccion_datos" con el string de la direccion del archivo con los datos originales
    direccion_datos = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 6\info\Tabla_2.txt'

    // defino dos variable con la direccion de los archivos con los nuevos datos
    direccion_nuevos_datos_temperatura = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 6\info\ejercicio 1\datos de temperatura.txt'
    direccion_nuevos_datos_presion = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 6\info\ejercicio 1\datos de presión.txt'

    // cargo los datos
    datos = fscanfMat(direccion_datos);

    // divido la matris en vectores:
    presion = datos(:, 1)
    temperatura = datos(:, 2)
    volumen_especifico_liquido = datos(:, 3)
    volumen_especifico_vapor =  datos(:, 4)
    entalpia_liquido = datos(:, 5)
    entalpia_vapor = datos(:, 6)

    // convierto la presion de bars a kilo pascales 
    presion = presion .* 100           

    // calculo densidad de liquido
    densidad_liquido = volumen_especifico_liquido ^ -1

    // calvulo la densidad el vapor
    densidad_vapor = volumen_especifico_vapor ^ -1

    // guardo los nuevos datos
    fprintfMat(direccion_nuevos_datos_temperatura,[temperatura,densidad_liquido,densidad_vapor])
    fprintfMat(direccion_nuevos_datos_presion,[presion,densidad_liquido,densidad_vapor])

endfunction

Datos()