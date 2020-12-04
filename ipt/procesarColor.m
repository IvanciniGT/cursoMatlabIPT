function color=procesarColor(r,g,b)
    global cuboColores;
    global cargado;
    if ~cargado
        cargarDatos()
    end
    color=cuboColores(enmarcarCanal(b),enmarcarCanal(g),enmarcarCanal(r));
end

function cargarDatos()
    global cuboColores;
    global cargado;
    tablaColores=readtable("colores.csv") ;
    listaColores=table2array(tablaColores(2:65,'color'));
    listaColores=string(listaColores);
    cuboColores=listaColores.reshape(4,4,4);
    cargado=1;
end

%nombrarColor(100,100,200)
function posicion=enmarcarCanal(canal)
    posicion=1+round(canal*3/255);
end