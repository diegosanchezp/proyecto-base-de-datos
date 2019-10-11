/* Debe crear un procedimiento almacenado que reciba un id_ataque y un id_pokemon e imprimir en
pantalla qué tan efectivo fue ese ataque en lenguaje natural */

CREATE OR REPLACE FUNCTION efectividad(id_ataque int, idPokemon int)
    RETURN FLOAT
IS
    pokemonTipo1 pokemon_tipo.id_tipo1%TYPE;
    pokemonTipo2 pokemon_tipo.id_tipo2%TYPE;
    effectiveness tipo_efectivo_tipo.efectividad%TYPE;
BEGIN
    --Get composite primary key given pokemon id
    SELECT PT.id_tipo1, PT.id_tipo2
    INTO pokemonTipo1, pokemonTipo2
    FROM Pokemon_tipo PT
    WHERE PT.id_pokemon = idPokemon;
    
    SELECT efectividad INTO effectiveness
    FROM TIPO_EFECTIVO_TIPO
    WHERE id_tipo1 =  pokemonTipo1 AND id_tipo2 = pokemonTipo2;
    
    RETURN effectiveness;
END;
/

CREATE OR REPLACE PROCEDURE print_efectivo (id_ataque int, id_pokemon int)     
IS
    efect FLOAT;
BEGIN
   --Obtener efectividad 
    efect := efectividad(id_ataque, id_pokemon);
    CASE efect
    WHEN 0 THEN
        DBMS_OUTPUT.PUT_LINE('Sin daños');
    WHEN 0.25 THEN
        DBMS_OUTPUT.PUT_LINE('No efectivo');
    WHEN 0.5 THEN
        DBMS_OUTPUT.PUT_LINE('No muy efectivo');
    WHEN 1 THEN
        DBMS_OUTPUT.PUT_LINE('Normal');
    WHEN 2 THEN
        DBMS_OUTPUT.PUT_LINE('Súper efectivo');
    WHEN 4 THEN
        DBMS_OUTPUT.PUT_LINE('Máxima efectividad');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Undefined');
    END CASE;
END print_efectivo;
/

/* Test procedure this way 
exec print_efectivo(0,43);
 */

/* Realice un trigger para actualizar de forma automática la información del torneo al terminar cada batalla.
Éste debe actualizar el resumen del torneo con los resultados y el dinero del entrenador ganador. */
CREATE OR REPLACE TRIGGER batalla_trigger
AFTER  INSERT ON Batalla
FOR EACH ROW
WHEN (New.dinero_ganado != null AND New.entrenador_ganador != null)
DECLARE
    pokemon_num Equipo_Entrenador.id_pokemon%TYPE;
    phase VARCHAR(600);
    current_date DATE;
BEGIN
    SELECT CURRENT_DATE INTO current_date FROM DUAL;
    -- Determine number of pokemon from winner trainer 
    SELECT COUNT(EE.id_pokemon) INTO pokemon_num
    FROM Equipo_Entrenador EE
    WHERE EE.id_entrenador = :NEW.entrenador_ganador;

	--Determine battle phase
    CASE pokemon_num
    WHEN 3 THEN
        phase := 'Octavos';
    WHEN 4 THEN
        phase := 'Cuartos';
    WHEN 5 THEN
        phase := 'Semifinal';
    WHEN 6 THEN
        phase := 'Final';
    ELSE
        DBMS_OUTPUT.PUT_LINE('Undefined');
    END CASE;
    DBMS_OUTPUT.PUT_LINE(phase);
    --Insert battle summary
    INSERT INTO Resumen_Torneo VALUES (:NEW.id_entrenador1,:NEW.id_entrenador2,phase, TO_DATE(current_date, 'dd/mm/yyyy'), :NEW.entrenador_ganador);
END;
/