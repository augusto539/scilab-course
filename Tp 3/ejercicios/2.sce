
function Datos()
    // defino la variable "direccion_datos" con el string de la direccion del archivo con los datos originales
    //direccion_datos = 'G:\My Drive\UTN\Introduccion a la informatica\Tp 6\info\Tabla_2.txt'
    direccion_datos = 'G:\Mi unidad\UTN\Introduccion a la informatica\Tp 6\info\Tabla_2.txt'

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

    // calculo la entalpia de vaporizacion
    entalpia_vaporizacion = entalpia_vapor - entalpia_liquido

    // genero el grafico de presion y entalpia
    plot2d(presion, entalpia_vaporizacion)
endfunction

Datos()