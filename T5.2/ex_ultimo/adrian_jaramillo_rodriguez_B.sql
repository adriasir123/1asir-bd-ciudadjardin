---------------
--ACTIVIDAD 1--
---------------

--Parte A
INSERT INTO JOBS_2
	SELECT *
        FROM JOBS;


--Parte B
UPDATE JOBS_2 jo
    SET total = (SELECT count(j.job_id)
                    FROM jobs j
                    LEFT JOIN employees e ON j.job_id = e.job_id
                    WHERE j.job_id = jo.job_id);


--Parte C
DELETE
  FROM JOBS_2;




---------------
--ACTIVIDAD 2--
---------------

--PARTE CODIGO
SET SERVEROUTPUT ON
BEGIN
    proc_act2(&acc, '&valor', '&clave');
END;

--PARTE PROCEDIMIENTO
CREATE OR REPLACE PROCEDURE PROC_ACT2 
(
  P_ACCION IN NUMBER 
, P_VALOR IN VARCHAR2 
, P_CLAVE IN VARCHAR2 
) AS 
BEGIN
  IF P_ACCION = 0 THEN
    UPDATE JOBS_2
        SET JOB_TITLE = P_VALOR
        WHERE JOB_ID = P_CLAVE;
  ELSIF P_ACCION = 1 THEN
    DELETE
      FROM JOBS_2
      WHERE JOB_ID = P_CLAVE;
  ELSE
    DBMS_OUTPUT.PUT_LINE('El parámentro introducido no es válido');
  END IF;

END PROC_ACT2;


---------------
--ACTIVIDAD 3--
---------------

--PARTE CODIGO
SET SERVEROUTPUT ON
BEGIN
    proc_act3();
END;


--PARTE PROCEDIMIENTO
CREATE OR REPLACE PROCEDURE PROC_ACT3 AS 

CURSOR cursor3 IS
    SELECT *
        FROM jobs;

v_reg_cursor cursor3%ROWTYPE;
v_reg_count number(10);

BEGIN
    OPEN cursor3;
    FETCH cursor3 INTO v_reg_cursor;
    
    
    WHILE cursor3%FOUND LOOP
    INSERT INTO JOBS_2
        VALUES (v_reg_cursor.job_id, v_reg_cursor.job_title, v_reg_cursor.min_salary, v_reg_cursor.max_salary, (SELECT count(e.employee_id)
                                                                                                                    FROM jobs j
                                                                                                                    LEFT JOIN employees e ON j.job_id = e.job_id
                                                                                                                    WHERE j.job_id = v_reg_cursor.job_id));
        FETCH cursor3 INTO v_reg_cursor;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Se han insertado ' || cursor3%ROWCOUNT || ' registros');
    
    CLOSE cursor3;
END PROC_ACT3;




---------------
--ACTIVIDAD 4--
---------------

--PARTE CODIGO
SET SERVEROUTPUT ON
BEGIN
    proc_act4();
END;



--PARTE PROCEDIMIENTO
CREATE OR REPLACE PROCEDURE PROC_ACT4 AS 

CURSOR cursor4 IS
    SELECT *
        FROM jobs_2
        ORDER BY JOB_ID DESC;

v_reg_cursor cursor4%ROWTYPE;

BEGIN
    OPEN cursor4;
    
    FOR v_reg_cursor IN cursor4 LOOP
    
        DBMS_OUTPUT ('Registro ' || v_reg_cursor.job_id || ' , cuya clave es '');
    
    END LOOP;
    

    
    CLOSE cursor4;
END PROC_ACT4;

