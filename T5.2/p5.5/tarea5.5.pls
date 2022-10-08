-- 1. Utilizando los datos del tablespace HR:
    -- A) Hacer un procedimiento que muestre el nombre y el salario del empleado cuyo código es 117.
       

        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            datos_117();
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --

        create or replace PROCEDURE DATOS_117 AS 

        v_resultado employees%rowtype;

        BEGIN
        SELECT *
            INTO v_resultado
            FROM employees
            WHERE employee_id = 117;


        DBMS_OUTPUT.PUT_LINE('El empleado con ID 117, se llama ' || v_resultado.first_name || ', y tiene un salario de ' || v_resultado.salary);

        END DATOS_117;

    -- B) Hacer un procedimiento que, reciba por teclado un código de empleado y devuelva su nombre.
     

        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            mostrar_nombres(&id);
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --

        create or replace PROCEDURE MOSTRAR_NOMBRES
        (
            ID IN NUMBER
        ) AS

        v_nombre varchar2(30);

        BEGIN
        SELECT first_name
            INTO v_nombre
            FROM employees
            WHERE employee_id = ID;


        DBMS_OUTPUT.PUT_LINE('El empleado con código ' || ID || ', se llama ' || v_nombre);

        END MOSTRAR_NOMBRES;

    -- C) Crear un procedimiento que cuente el número de filas que hay en la tabla EMPLOYEES, deposite el resultado
    --    en una variable y visualiza su contenido.
     

        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            filas();
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --

        create or replace PROCEDURE FILAS
        AS

        v_resultado NUMBER(10);

        BEGIN
            SELECT count(*)
                INTO v_resultado
                FROM employees;

        DBMS_OUTPUT.PUT_LINE( 'La tabla EMPLOYEES tiene ' || v_resultado || ' filas');

        END FILAS;

    -- D) Codificar un procedimiento que permita borrar un empleado cuyo número se introducirá por teclado.
     

        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            borrar_emp(&id);
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --

        create or replace PROCEDURE BORRAR_EMP 
        (
            ID IN NUMBER 
        ) AS 
        BEGIN
            DELETE
            FROM
                employees
            WHERE
                employee_id = ID;
            
            DBMS_OUTPUT.PUT_LINE( 'Se ha borrado correctamente el empleado con número ' || ID);
        END BORRAR_EMP;

    -- E) Escribir un procedimiento que modifique la localidad de un departamento. El procedimiento recibirá como
    --    parámetros el número del departamento y la localidad nueva.
     

        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            MOD_LOCALI(&n_dep, '&nueva_local');
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --
        
        create or replace PROCEDURE MOD_LOCALI 
        (
            N_DEP IN NUMBER, 
            NUEVA_LOCAL IN VARCHAR2
        ) AS 
        BEGIN
            UPDATE departments d
            SET d.location_id = (SELECT l.location_id
                                    FROM locations l
                                    WHERE l.city = NUEVA_LOCAL
                                )
            WHERE d.department_id = N_DEP;

            DBMS_OUTPUT.PUT_LINE( 'El departmento con número ' || N_DEP || ', se ha mudado a ' || NUEVA_LOCAL);

        END MOD_LOCALI;


    -- F) Crear un procedimiento que en la tabla EMPLOYEES incremente el salario en un 10% a los empleados que tengan
    --    una comisión superior al 5% del salario.


        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            inc_salario();
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --

        CREATE OR REPLACE PROCEDURE INC_SALARIO AS 
        BEGIN
            UPDATE employees
            SET salary = salary*1.1
            WHERE commission_pct > 0.5;

        END INC_SALARIO;



    -- G) Crear un procedimiento que inserte un empleado en la tabla EMPLOYEES. Su número será superior a los existentes y la
    --    fecha de incorporación a la empresa será la actual.
    

        -- ############ --
        -- PARTE CÓDIGO --
        -- ############ --

        SET SERVEROUTPUT ON
        BEGIN
            insert_emp();
        END;

        -- ################### --
        -- PARTE PROCEDIMIENTO --
        -- ################### --

        CREATE OR REPLACE PROCEDURE INSERT_EMP AS 
        v_date date;
        v_ult_id number(10);
        v_nuevo_id number(10); 
        BEGIN

            SELECT SYSDATE
                INTO v_date
                FROM dual;
            
            v_date := TO_CHAR(v_date, 'DD-MON-YY');
            
            SELECT employee_id
                INTO v_ult_id
                FROM employees
                WHERE ROWNUM = 1
                ORDER BY employee_id DESC;

            v_nuevo_id := v_ult_id+1;

            INSERT INTO employees 
                (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) 
                VALUES 
                (v_nuevo_id, 'fn','ln','email','515.123.9191',v_date,'AC_ACCOUNT',8300, 0, 205, 110);

        END INSERT_EMP;


-- 2. Codificar un procedimiento que reciba una cadena y la visualice al revés.
 

    -- ############ --
    -- PARTE CÓDIGO --
    -- ############ --

    SET SERVEROUTPUT ON
    BEGIN
        AL_REVES('&cadena');
    END;

    -- ################### --
    -- PARTE PROCEDIMIENTO --
    -- ################### --

    create or replace PROCEDURE AL_REVES 
    (
        CADENA IN VARCHAR2
    ) AS 

    v_resultado varchar2(50);

    BEGIN
        FOR i IN REVERSE 1 .. length(CADENA) LOOP
            v_resultado := v_resultado || SUBSTR(cadena,i,1);
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE( 'Usted ha escrito la cadena ' || cadena || ', y al revés es = ' || v_resultado);
    END AL_REVES;


-- 3. Escribir un procedimiento que reciba una fecha y escriba el año, en número, correspondiente a esa fecha.
    

    -- ############ --
    -- PARTE CÓDIGO --
    -- ############ --

    SET SERVEROUTPUT ON
    BEGIN
        DECIR_ANYO('&cadena');
    END;

    -- ################### --
    -- PARTE PROCEDIMIENTO --
    -- ################### --

    create or replace PROCEDURE DECIR_ANYO 
    (
        F1 IN VARCHAR2 
    ) AS

    F2 DATE;
    v_resultado VARCHAR2(30);

    BEGIN
        F2 := TO_DATE(F1, 'DD-MON-YY');
        v_resultado := TO_CHAR(F2, 'YYYY');
        DBMS_OUTPUT.PUT_LINE( 'Usted ha escrito la fecha ' || F1 || ', y el año es = ' || v_resultado);
    END DECIR_ANYO;


-- 4. Realizar un procedimiento que reciba un número y muestre su tabla de multiplicar.
 

    -- ############ --
    -- PARTE CÓDIGO --
    -- ############ --

    SET SERVEROUTPUT ON
    BEGIN
        TABLA_MULTIPLICAR(&numero);
    END;

    -- ################### --
    -- PARTE PROCEDIMIENTO --
    -- ################### --

    CREATE OR REPLACE PROCEDURE TABLA_MULTIPLICAR
    (
        NUM IN NUMBER 
    ) AS

    v_resultado number(10);

    BEGIN
        FOR i IN 1 .. 10 LOOP
            v_resultado := NUM*i;
            DBMS_OUTPUT.PUT_LINE( NUM || ' X ' || i || '= ' || v_resultado);
        END LOOP;
    END TABLA_MULTIPLICAR;


-- 5. Realizar función factorial.


    -- ############ --
    -- PARTE CÓDIGO --
    -- ############ --

    SET SERVEROUTPUT ON
    BEGIN
        FACTORIAL();
    END;

    -- ################### --
    -- PARTE PROCEDIMIENTO --
    -- ################### --

    CREATE OR REPLACE PROCEDURE FACTORIAL AS 
    
    v_num number(10) := 7;
    v_res number(10) := 1;
    
    BEGIN
        WHILE v_num > 0 LOOP
            v_res:=v_num*v_res;
            v_num:=v_num-1;
        END LOOP;
        dbms_output.put_line(v_res);
    END FACTORIAL;

-- 6. Realizar función salarios pizarra.


    -- ############ --
    -- PARTE CÓDIGO --
    -- ############ --

    SET SERVEROUTPUT ON
    BEGIN
        SALARIOS_EMP();
    END;

    -- ################### --
    -- PARTE PROCEDIMIENTO --
    -- ################### --

    CREATE OR REPLACE PROCEDURE SALARIOS_EMP AS 
    
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
    END SALARIOS_EMP;

