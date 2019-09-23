--Insert 16 pokedex devices
INSERT INTO POKEDEX VALUES (0, 13, 8);
INSERT INTO POKEDEX VALUES (1, 12, 9);
INSERT INTO POKEDEX VALUES (2, 16, 2);
INSERT INTO POKEDEX VALUES (3, 15, 0);
INSERT INTO POKEDEX VALUES (4, 10, 3);
INSERT INTO POKEDEX VALUES (5, 14, 3);
INSERT INTO POKEDEX VALUES (6, 13, 6);
INSERT INTO POKEDEX VALUES (7, 16, 7);
INSERT INTO POKEDEX VALUES (8, 18, 9);
INSERT INTO POKEDEX VALUES (9, 15, 1);
INSERT INTO POKEDEX VALUES (10, 15, 3);
INSERT INTO POKEDEX VALUES (11, 11, 5);
INSERT INTO POKEDEX VALUES (12, 17, 0);
INSERT INTO POKEDEX VALUES (13, 10, 7);
INSERT INTO POKEDEX VALUES (14, 17, 1);
INSERT INTO POKEDEX VALUES (15, 10, 4);
INSERT INTO POKEDEX VALUES (16, 17, 0);
INSERT INTO POKEDEX VALUES (17, 11, 4);
INSERT INTO POKEDEX VALUES (18, 19, 4);
--Insert 16 trainers
INSERT INTO ENTRENADOR VALUES (0, 'Brendan', 'Acapulco', 9, TO_DATE('21/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 0);
INSERT INTO ENTRENADOR VALUES (1, 'May', 'Beach Rose', 21, TO_DATE('22/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 1);
INSERT INTO ENTRENADOR VALUES (2, 'Lucas', 'Calanthe', 48, TO_DATE('23/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 2);
INSERT INTO ENTRENADOR VALUES (3, 'Dawn', 'Daybreak', 85, TO_DATE('24/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 3);
INSERT INTO ENTRENADOR VALUES (4, 'Hilbert', 'Eggseter', 98, TO_DATE('25/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 4);
INSERT INTO ENTRENADOR VALUES (5, 'Hilda', 'Fallarbor', 57, TO_DATE('26/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 5);
INSERT INTO ENTRENADOR VALUES (6, 'Nate', 'Gardenia', 81, TO_DATE('27/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 6);
INSERT INTO ENTRENADOR VALUES (7, 'Rosa', 'HopHopHop', 65, TO_DATE('28/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 7);
INSERT INTO ENTRENADOR VALUES (8, 'Calem', 'Inakano', 35, TO_DATE('29/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 8);
INSERT INTO ENTRENADOR VALUES (9, 'Serena', 'Jacore Town', 20, TO_DATE('30/9/2019', 'dd/mm/yyyy hh24:mi:ss'), 9);
INSERT INTO ENTRENADOR VALUES (10, 'Elio', 'Lacunosa', 18, TO_DATE('1/10/2019', 'dd/mm/yyyy hh24:mi:ss'), 10);
INSERT INTO ENTRENADOR VALUES (11, 'Selene', 'Lavender', 76, TO_DATE('2/10/2019', 'dd/mm/yyyy hh24:mi:ss'), 11);
INSERT INTO ENTRENADOR VALUES (12, 'Chase', 'Mahogany Town', 35, TO_DATE('3/10/2019', 'dd/mm/yyyy hh24:mi:ss'), 12);
INSERT INTO ENTRENADOR VALUES (13, 'Elaine', 'Neighborly', 67, TO_DATE('4/10/2019', 'dd/mm/yyyy hh24:mi:ss'), 13);
INSERT INTO ENTRENADOR VALUES (14, 'Victor', 'O-Hina', 24, TO_DATE('5/10/2019', 'dd/mm/yyyy hh24:mi:ss'), 14);
INSERT INTO ENTRENADOR VALUES (15, 'Gloria', 'Pacifidlog', 90, TO_DATE('6/10/2019', 'dd/mm/yyyy hh24:mi:ss'), 15);
INSERT INTO ENTRENADOR VALUES (16, 'Lenora', 'Valencia', 43, TO_DATE('23/9/2015', 'dd/mm/yyyy hh24:mi:ss'), 16);
INSERT INTO ENTRENADOR VALUES (17, 'Looker', 'Valencia', 67, TO_DATE('23/9/2015', 'dd/mm/yyyy hh24:mi:ss'), 17);
INSERT INTO ENTRENADOR VALUES (18, 'Lorelei', 'Valencia', 33, TO_DATE('23/9/2015', 'dd/mm/yyyy hh24:mi:ss'), 18);
--Insert 20 abilities
INSERT INTO HABILIDAD VALUES (0, 'Air Lock', 'Eliminates the effects of weather');
INSERT INTO HABILIDAD VALUES (1, 'Arena Trap', 'Prevents non-Flying-type opposing Pokémon from fleeing');
INSERT INTO HABILIDAD VALUES (2, 'Battle Armor', 'Protects the Pokémon from critical hits');
INSERT INTO HABILIDAD VALUES (3, 'Blaze', 'Powers up Fire-type moves when the Pokémons HP is low');
INSERT INTO HABILIDAD VALUES (4, 'Cacophony', 'The Pokémon is immune to sound-based moves');
INSERT INTO HABILIDAD VALUES (5, 'Chlorophyll', 'Boosts the Pokémons Speed stat in harsh sunlight');
INSERT INTO HABILIDAD VALUES (6, 'Clear Body', 'Prevents other Pokémons moves or Abilities from lowering the Pokémons stats');
INSERT INTO HABILIDAD VALUES (7, 'Cloud Nine', 'Eliminates the effects of weather');
INSERT INTO HABILIDAD VALUES (8, 'Color Change', 'The Pokémons type becomes the type of the move used on it');
INSERT INTO HABILIDAD VALUES (9, 'Compound Eyes', 'Boosts the Pokémons Accuracy stat');
INSERT INTO HABILIDAD VALUES (10, 'Cute Charm', 'Contact with the Pokémon may cause infatuation');
INSERT INTO HABILIDAD VALUES (11, 'Damp', 'Prevents the use of Explosion and Self-Destruct');
INSERT INTO HABILIDAD VALUES (12, 'Drizzle', 'Activates rain when the Pokémon enters battle');
INSERT INTO HABILIDAD VALUES (13, 'Drought', 'Activates harsh sunlight when the Pokémon enters battle');
INSERT INTO HABILIDAD VALUES (14, 'Early Bird', 'The Pokémon awakens twice as fast from sleep');
INSERT INTO HABILIDAD VALUES (15, 'Effect Spore', 'Contact with the Pokémon may inflict poison, sleep, or paralysis on its attacker');
INSERT INTO HABILIDAD VALUES (16, 'Flame Body', 'Contact with the Pokémon may inflict burn the attacker');
INSERT INTO HABILIDAD VALUES (17, 'Flash Fire', 'Powers up the Pokémons Fire-type moves if hit by a Fire-type move');
INSERT INTO HABILIDAD VALUES (18, 'Forecast', 'The Pokémon transforms with the weather to change its type to Water, Fire, or Ice');
INSERT INTO HABILIDAD VALUES (19, 'Guts', 'Boosts the Pokémons Attack stat when it has a status condition');




