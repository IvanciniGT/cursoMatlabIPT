tablaColores=readtable("colores.csv") ;
global cuboColores;
listaColores=table2array(tablaColores(2:65,'color'));

listaColores=string(listaColores);
cuboColores=listaColores.reshape(4,4,4)

nombrarColor(0,0,0)
function color=nombrarColor(r,g,b)
    global cuboColores;
    color=cuboColores(enmarcarCanal(b),enmarcarCanal(g),enmarcarCanal(r));
end
function posicion=enmarcarCanal(canal)
    posicion=1+round(canal*3/255);
end