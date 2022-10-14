// Método de la Regula Falsi
//
// Variables de entrada
// a,b: intervalo del dominio de la función donde hay una única raíz
// tol: precisión con la que se desea conocer el resultado
// Variables de salida
// r: valor de la raíz
// er: código de error
//      0: no hubieron errores
//    801: los valores de abscisa son iguales
//    802: la tolerancia es nula o negativa
//    803: la función en a y b tienen el mismo signo
//    804: se excedió la cantidad de iteraciones máximas sin hallar una raíz
function [r,er]=regulafalsi(a,b,tol)
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
    ya=func(a)
    yb=func(b)
    if sign(ya)==sign(yb) then
        er=803
        return
    end
    yi=tol
    n=0
    while abs(yi)>=tol & n<100
        m=(yb-ya)/(b-a)
        xi=a-ya/m
        yi=func(xi)
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
