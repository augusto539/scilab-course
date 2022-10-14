function F1_output = F1(t)
    F1_output = cos(t)
endfunction
function F2_output = F2(t)
    F2_output = t ^ 2
endfunction

function Y = func(X)
    Y = F1(X) - F2(X)
endfunction

exec('G:\My Drive\UTN\Introduccion a la informatica\Tp 8\RegulaFalsi.sci', -1)

function [r,er]= main()
    [r,er]=regulafalsi(0,2,1d-5)

    X = linspace(0,2,1000)

    plot2d(X,F1(X))

    plot2d(X,F2(X), style=5)

endfunction


[r,er]= main()