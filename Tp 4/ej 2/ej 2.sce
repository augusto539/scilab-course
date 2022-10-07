function Dencidad()
    info = fscanfMat("G:\My Drive\UTN\Introduccion a la informatica\Tp 7\Tabla_4.txt");

    nueva_temp = [0:5:100]

    nueva_dencidad = interp1(info(:,1), info(:,2), nueva_temp,'spline');

    plot2d(nueva_temp, nueva_dencidad, style=3)

endfunction

Dencidad()
