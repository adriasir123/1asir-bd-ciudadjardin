DECLARE 
    v_cad1 varchar(50) := 'Jaime Caraver';
    v_cad2 varchar2(50);
    v_long number;
BEGIN
    v_cad2 :=  substr(v_cad1, 7);
    v_cad2 :=  substr(v_cad1, 7,10); --COGE A PARTIR DE LA POSICIÓN DONDE ESTEMOS, LA CANTIDAD QUE DIGAMOS DE CARACTERES. EN ESTE CASO,  
                                     --DARÍA UN ERROR DE OVERFLOW O PARECIDO PORQUE NOS QUEREMOS DESPLAZAR A UNA POSICIÓN QUE NO EXISTE
    dbms_output.put_line(v_cad2);

    v_long := lenght(v_cad1); --DEVUELVE LA CANTIDAD DE CARACTERES QUE TIENE UNA VARIABLE
END;

-- substr('Jaimer Caraver', 7) DEVOLVERÁ, Caraver, YA QUE SE DESPLAZA A LA POSICIÓN 7