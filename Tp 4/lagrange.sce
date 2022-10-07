function [y, er]=lagrange(xi, yi, x)
    er=0
    y=0
    if size(xi,'c')<>1 | size(yi,'c')<>1 then
        er=701
        return
    end
    n=size(xi,"r")
    if size(yi,'r')<>n then
        er=702
        return
    end
    if length(x)<>1 then
        er=703
        return
    end
    for k=1:n
        fact=1
        for j=1:n
            if j<>k then
                fact=fact*(x-xi(j))/(xi(k)-xi(j))
            end
        end
        y=y+yi(k)*fact
    end
endfunction
