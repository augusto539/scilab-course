// Funcion para nombrar errores

// Variables de entrada
    // er: código de error

// Variables de salida
    // er_msg: mensaje de error

function [er_msg]=Nombro_errores(er)
    if er == 0 then                                                                         // si el codigo de error es igual a 0:
        er_msg = "no ha ocurrido ningun error durante la ejecusion"                         // cambio el valor de "er_msg" por el nombre del error ocurrido
        return                                                                              // detengo la ejecusion de la funsion
    end
    if er == 1 then
        er_msg = "La viscosidad debe ser un valor mayor a 0"
        return
    end
    if er == 2 then
        er_msg = "El diametro debe ser un valor mayor a 0"
        return
    end
    if er == 3 then
        er_msg = "Numero de raynolds fuera del alcanse del programa"
        return
    end
endfunction

// Funcion para comprovar el positivo

// Variables de entrada
    // viscodidad: viscodidad del fluido,  kg/m.s (kilogramos sobre metros por segundo) 
    // diametro: diametro de la tuberia,  m (metros)

// Variables de salida
    // er: código de error

function [er]=Comporvar_positivos(viscodidad,diametro)
    er = 0                          // inisializo la variable "er" con valor igual a 0
    if viscodidad <= 0 then         // si la viscosidad es menor o igual a 0:
        er = 1                      // le doy el valor 1 a la variable "er"
        return                      // detengo la ejecusion de la funsion
    end
    if diametro <= 0 then
        er = 2
        return
    end
endfunction


// Funcion para calcular el numero de raynolds

// Variables de entrada
    // densidad: dencidad del fluido,  kg/m3 (kilogramos por metro cubico)
    // velocidad: velocidad del fluido,  m/s (metros por segundo)
    // viscodidad: viscodidad del fluido,  kg/m.s (kilogramos sobre metros por segundo) 
    // diametro: diametro de la tuberia,  m (metros)

// Variables de salida
    // reynolds: numero de raynolds, adimencional

function [reynolds]=Numero_Reynolds(densidad,velocidad,viscodidad,diametro)
    reynolds = (diametro * velocidad * densidad) / viscodidad
endfunction


// Funcion para calcular el factor de rosamiento

// Variables de entrada
    // reynolds: numero de reynolds, adimencional 

// Variables de salida
    // rosamiento: factor de rosamiento, adimencional
    // er: código de error

// Codigos de error
    // 1: numero de reynolds no aceptado
    function [er,rosamiento]=Factor_rosamiento(reynolds)
        if ~(reynolds > 10000 & reynolds < 3000000) then        // reviso si el numero de reynolds NO: es mayor a 10000 y menor a 3000000
            er = 3                                              // le doy el valor 3 a la variable "er"
            return
        end
    
        rosamiento = 0.0014 + 0.125 * reynolds ^ -0.32
    
    endfunction


// Funcion para calcular la caide de precion por metro de tuberia

// Variables de entrada
    // diametro: diametro de la tuberia, m (metros)
    // velocidad: velocidad del fluido, m/s (metros por segundo)
    // rosamiento: factor de rosamiento, adimencional
    // dencidad: dencidad del fluido, Kg/m^3 (kilogramos por metros cubicos)

// Variables de salida
    // caida_precion: caida de presion por metro de tuberia, pa/m (pascal por metro )

function [caida_precion]=Caida_precion(diametro,velocidad,rosamiento,dencidad)
    caida_precion = 2 * rosamiento * (dencidad/diametro) * (velocidad ^ 2)
endfunction
 


// Funcion general para calcular la caida de presion por unidad de longuitud

// Variables de entrada
    // diametro: diametro de la tuberia, m (metros)
    // velocidad: velocidad del fluido, m/s (metros por segundo)
    // viscodidad: viscodidad del fluido,  kg/m.s (kilogramos sobre metros por segundo) 
    // dencidad: dencidad del fluido, Kg/m^3 (kilogramos por metros cubicos)

// Variables de salida
    // caida_precion: caida de presion por metro de tuberia, pa/m (pascal por metro )

function [er_msg, caida_precion_final]=Caida_precion_general(diametro,velocidad,viscodidad,dencidad)
    er_msg = "no ha ocurrido ningun error durante la ejecusion"  
    // reviso positivos
    [er]=Comporvar_positivos(viscodidad,diametro)
    // reviso si surgui algun error
    if er <> 0 then
        // tomo el codigo de error y devuelvo la variable "er_msg" con el nombre del error ocurrido
        [er_msg]=Nombro_errores(er)
        // detengo la ejecusion de la funcion
        return
    end
    // calculo el numero de reynolds
    [reynolds]=Numero_Reynolds(dencidad,velocidad,viscodidad,diametro)
    // calculo el factor de rosamiento
    [er,rosamiento]=Factor_rosamiento(reynolds)
    // reviso si hubo algun error en el calculo del factor de rosamiento
    if er <> 0 then
        // tomo el codigo de error y devuelvo la variable "er_msg" con el nombre del error ocurrido
        [er_msg]=Nombro_errores(er)
        // detengo la ejecusion de la funcion
        return
    end
    // calulo la caida de presion
    [caida_precion_final]=Caida_precion(diametro,velocidad,rosamiento,dencidad)
    // si la ejecusion del codigo lleguo a este punto significa que no hubo errores, por lo tanto hago que el mensaje de error muestre esto   

endfunction





[er_msg, caida_precion_final]=Caida_precion_general(0.0254,2,0.0012,982)
[er_msg, caida_precion_final]=Caida_precion_general(0.1016,2.5,0.00096,1012)

