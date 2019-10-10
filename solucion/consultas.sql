/* a) Pokémon de tipo agua, ordenados por su ataque (el de mayor ataque primero). */

SELECT PT.*
FROM Pokemon_Tipo PT, tipo_efectivo_tipo TE, tipo T
WHERE T.nombre = 'agua' AND (PT.id_tipo1 = T.id OR PT.id_tipo2 = T.id) AND (TE.id_tipo1 = T.id OR TE.id_tipo2 = T.id)
ORDER BY TE.efectividad DESC;

/* b) información de los 5 primeros entrenadores con más cantidad de pokémon obtenidos. */

SELECT E.*
FROM Entrenador E, Pokedex P
WHERE E.id_pokedex = P.id 
ORDER BY P.cantidad_obtenidos DESC
FETCH FIRST 5 ROWS ONLY;

/* d) Imprima el equipo (nombres de entrenador y pokémon) del(los) entrenador(es) cuyo dinero sea mayor
al promedio. También imprima el dinero del entrenador y el promedio. */

--First calculate average trainer money
CREATE OR REPLACE VIEW Prome AS
    SELECT AVG(dinero) as Promedio
    FROM Entrenador;

SELECT E.nombre, E.dinero, Prom.Promedio
FROM Entrenador E, Equipo_Entrenador T, Pokemon P, Prome Prom
WHERE E.dinero > Prom.Promedio AND E.id = T.id_entrenador AND P.id = id.pokemon;

/* i) Imprima la información de las habilidades de los pokémon de los entrenadores de Valencia que
iniciaron su viaje hace 4 años. (Al menos tres registros) */

SELECT H.*
FROM Equipo_Entrenador T, Entrenador E, Habilidad H, (SELECT CURRENT_DATE FROM DUAL)  D;
WHERE T.id_entrenador = E.id AND E.pueblo_origen = 'Valencia' AND TO_DATE(D.CURRENT_DATE, 'dd/mm/yy') - TO_DATE(E.fecha_inicio, 'dd/mm/yy') >= 365*4;
