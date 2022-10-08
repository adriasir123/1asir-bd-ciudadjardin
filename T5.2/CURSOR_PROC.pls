create or replace PROCEDURE CURSOR_PROC AS 

CURSOR cursorito IS
SELECT first_name, email
    FROM employees;

v_reg_cursor cursorito%ROWTYPE;
    
BEGIN

  OPEN cursorito;
  FETCH cursorito INTO v_reg_cursor;
  
  WHILE cursorito%FOUND LOOP
  
      DBMS_OUTPUT.PUT_LINE(v_reg_cursor.first_name || ' y ' || v_reg_cursor.email);
      FETCH cursorito INTO v_reg_cursor;
      
  END LOOP;
  
  
  CLOSE cursorito;
  
END CURSOR_PROC;