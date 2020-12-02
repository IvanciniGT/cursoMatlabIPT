global numero;
numero=double(3);
doblarNumero();
fprintf("FUERA DE LA FUNCION EL NUMERO VALE: %d\n",numero);





function doblarNumero()
    global numero;
    numero=numero*2;
    fprintf("DENTRO DE LA FUNCION EL NUMERO VALE: %d\n",numero);

end
