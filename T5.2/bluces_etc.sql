DECLARE
    v_usuario VARCHAR2(10);
    v_fecha DATE;
    v_emp employees.first_name%type;
    v_f_emp employees%rowtype; --Con rowtype decimos que el tipo de una variable es una línea, registro entero. 
                               --Es decir, lo que haya aquí dentro será un registro entero, pero sólo uno
BEGIN
    SELECT user_id, fecha
    INTO v_usuario, v_fecha --Añadir en la variable lo que saquemos del select (tiene que tener un solo valor en este caso, sino podría dar error)
    FROM tabla;
    
    
    
    if (v_f_emp.salary < 3000) then
        DBMS_OUTPUT.PUT_LINE('Soy un tieso');
    elsif (v_f_emp.salary >= 3000 and v_f_emp.salary < 6000) then
        DBMS_OUTPUT.PUT_LINE('Puedo contratar HBO');
    else
        
END;


--%TYPE (Se intercambiaría por el tipo de dato que tenga el campo, ya que normalmente nosotros no podríamos ver
--el esquema físico para ver el tipo de dato

--Hay 3 tipos de bucles
--LOOP (infinito nunca sale) FOR (bucle contrador vueltas conocidas) WHILE (mientras que se cumpla una condición entrar)



/* EJERCICIO ENTREGAR
Desde el empleado 100 al 117
Mostrar nombre, apellido, sueldo

<3000 
Soy pobre

>=3000 y <5000
Estoy bien

>=5000
Soy rico

*/
SET SERVEROUTPUT ON --(habilitamos los outputs de texto)
DECLARE
    --v_emp_id employees.employee_id%TYPE; NO SIRVE LA LÍNEA
    v_f_emp employees%ROWTYPE;

BEGIN

    FOR i IN 100 .. 117 LOOP
        select *
            INTO v_f_emp
            from employees
            where employee_id = i;
        
        DBMS_OUTPUT.PUT_LINE('Soy el empleado llamado ' || v_f_emp.first_name || ', me apellido ' || v_f_emp.last_name || ', y...');
        
        if (v_f_emp.salary < 3000) then
            DBMS_OUTPUT.PUT_LINE('Soy pobre');
        elsif (v_f_emp.salary >= 3000 and v_f_emp.salary < 5000) then
            DBMS_OUTPUT.PUT_LINE('Estoy bien');
        else
            DBMS_OUTPUT.PUT_LINE('Soy rico');
        end if;
        
    END LOOP;

END;