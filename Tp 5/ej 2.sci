function Y = kk(X)
    Y = 3 * log10(sin(X) + 1) + 3
endfunction

// Método de la Regula Falsi
//
// Variables de entrada
// a,b: intervalo del dominio de la función donde hay una única raíz
// tol: precisión con la que se desea conocer el resultado
// function: funcion en la cual se ba a buscar la raiz
// Variables de salida
// r: valor de la raíz
// er: código de error
//      0: no hubieron errores
//    801: los valores de abscisa son iguales
//    802: la tolerancia es nula o negativa
//    803: la función en a y b tienen el mismo signo
//    804: se excedió la cantidad de iteraciones máximas sin hallar una raíz
function [r,er]=regulafalsi(a,b,tol,function_p)
    er=0
    r=0
    if a==b then
        er=801
        return
    end
    if tol<=0 then
        er=802
        return
    end
    ya=function_p(a)
    yb=function_p(b)

    if sign(ya)==sign(yb) then
        er=803
        return
    end
    
    yi=tol
    n=0
    while abs(yi)>=tol & n<100
        m=(yb-ya)/(b-a)
        xi=a-ya/m
        yi=function_p(xi)
        if sign(yi)==sign(ya) then
            a=xi
            ya=yi
        else
            b=xi
            yb=yi
        end
        n=n+1
    end
    if abs(yi)<tol then
        r=xi
    else
        er=804
    end
endfunction

// Método de la Regula Falsi
//
// Variables de entrada
    // Valor_inicial: valor por el cual se empieza a revisar la funcion
    // Valor_final: ultimo valor que se revisara de la funcion
    // Tolerancia_del_intervalo: numero de puntos que se revisaran
// Variables de salida
    // Vector_raices: valores de x donde y se hace 0

function [Vector_raices] = buscar_ceros(Valor_inicial, Valor_final, Tolerancia_del_intervalo)
    Vector_raices = []

    Vector_valores = linspace(Valor_inicial, Valor_final, Tolerancia_del_intervalo)

    for i=1:size(Vector_valores, "c")
        r = 0
        er = 0

        if modulo(i,2)==0 then          // reviso si el valor actual de i es un numero par:
            continue                    // si lo es salto esta buelta de bucle
        end
        if (i+1 > size(Vector_valores, "c")) then             // reviso si el valor de (i+1) es mayor al numero de columnas en el vector:
            break                                             // si lo es detengo la ejecucion del bucle for     
        end

        // ejecuto la funcion de regulafalsi
        [r,er]=regulafalsi(Vector_valores(i),Vector_valores(i+1),1d-5,kk)

        // si la variable "er" es igual a cero signifaca que se encontro una raiz, por lo tanto guardo su valor en "Vector_raices"
        if er == 0 then
            Vector_raices($+1) = r
        end

        // Vector_raices($+1) = r

    end
endfunction


[Vector_raices] = buscar_ceros(0, 20, 40)











