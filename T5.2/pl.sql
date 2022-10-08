set SERVEROUTPUT ON
declare
    var1 varchar(10);
begin
    var1 := 'Hola mundo';
    DBMS_OUTPUT.PUT_LINE('Hola mundo');
    DBMS_OUTPUT.PUT_LINE(var1);
    DBMS_OUTPUT.PUT_LINE(var1 || ' Estoy concatenando ');
    hola_mundo();
    multiplicar(5,6);
    
end;