/*
ORACLE SQL SYNTAX
CREATE TABLE table_name (
    column_1 data_type column_constraint,
    column_2 data_type column_constraint,
    ...
    table_constraint
 );

CREATE TABLE child_table (
    ...
    CONSTRAINT fk_name
    FOREIGN KEY(col1, col2,...) REFERENCES parent_table(col1,col2) 
    ON DELETE [ CASCADE | SET NULL ]
);
 CONSTRAINT check_positive_evoluciona_de CHECK(evoluciona_de >= 0),
*/

CREATE TABLE pokemon (
    id INT PRIMARY KEY,
    nombre NVARCHAR2(4000) NOT NULL,
    hp INT,
    ataque INT,
    defensa INT,
    ataque_especial INT,
    defensa_especial INT,
    velocidad INT,
    evoluciona_de INT,
    metodo_evolucion NVARCHAR2(4000),
    CONSTRAINT check_positive_evoluciona_de CHECK(evoluciona_de >= 0),
    CONSTRAINT check_positive_velocidad CHECK(velocidad >= 0),
    CONSTRAINT check_positive_defensa_especial CHECK(defensa_especial >= 0),
    CONSTRAINT check_positive_ataque_especial CHECK(ataque_especial >= 0),
    CONSTRAINT check_positive_defensa CHECK(defensa >= 0),
    CONSTRAINT check_positive_ataque CHECK(ataque >= 0),
    CONSTRAINT check_positive_hp CHECK(hp >= 0),
    CONSTRAINT check_metodo_evolucion CHECK(metodo_evolucion IN ('nivel', 'item', 'intercambio')),
    CONSTRAINT fk_evoluciona_de FOREIGN KEY (evoluciona_de) REFERENCES pokemon(id)
);

CREATE TABLE tipo (
    id INT PRIMARY KEY,
    nombre NVARCHAR2(4000) NOT NULL,
    CONSTRAINT check_positive_id CHECK( id >= 0)
);

CREATE TABLE tipo_efectivo_tipo (
    id_tipo1 INT,
    id_tipo2 INT,
    efectividad FLOAT,
    CONSTRAINT ids_pk PRIMARY KEY (id_tipo1, id_tipo2)
);

CREATE TABLE Pokemon_Tipo (
    id_pokemon INT,
    id_tipo1 INT,
    id_tipo2 INT,
    CONSTRAINT pokemonTipo_pk PRIMARY KEY (id_pokemon, id_tipo1),
    CONSTRAINT fk_id_pokemon FOREIGN KEY (id_pokemon) REFERENCES pokemon(id),
    CONSTRAINT fk_id_tipo1 FOREIGN KEY (id_tipo1) REFERENCES tipo(id),
    CONSTRAINT fk_id_tipo2 FOREIGN KEY (id_tipo2) REFERENCES tipo(id)
);

CREATE TABLE Habilidad (
    id INT PRIMARY KEY,
    nombre NVARCHAR2(4000) NOT NULL,
    descripcion NVARCHAR2(4000) 
);

CREATE TABLE Pokedex(
    id INT PRIMARY KEY, 
    cantidad_vistos INT,
    cantidad_obtenidos INT,
    CONSTRAINT check_positive_vistos CHECK(cantidad_vistos>= 0),
    CONSTRAINT check_positive_obtenidos CHECK(cantidad_obtenidos >= 0)
);

CREATE TABLE Entrenador(
    id INT PRIMARY KEY, 
    nombre NVARCHAR2(4000) NOT NULL, 
    pueblo_origen NVARCHAR2(4000), 
    dinero FLOAT, 
    fecha_inicio DATE, 
    id_pokedex INT,
    CONSTRAINT fk_pokedex FOREIGN KEY (id_pokedex) REFERENCES Pokedex(id),
    CONSTRAINT check_positive_dinero CHECK(dinero>= 0)
);

CREATE TABLE Ataque(
    id INT PRIMARY KEY,
    nombre NVARCHAR2(4000) NOT NULL,
    categoria NVARCHAR2(4000), 
    poder NVARCHAR2(4000), 
    precision INT, 
    cantidad_veces INT, 
    descripcion NVARCHAR2(4000), 
    id_tipo INT,
    CONSTRAINT check_categoria CHECK(categoria IN ('Ataque especial', 'Ataque físico')),
    CONSTRAINT fk_id_tipo FOREIGN KEY (id_tipo) REFERENCES tipo(id)
);
--Duda que es fase?
CREATE TABLE Resumen_Torneo(
    id_entrenador1 INT, 
    id_entrenador2 INT, 
    fase NVARCHAR2(4000),
    fecha_encuentro DATE, 
    ganador INT,
    CONSTRAINT resumen_pk PRIMARY KEY (id_entrenador1, id_entrenador2),
    CONSTRAINT fk_entrenador1 FOREIGN KEY (id_entrenador1) REFERENCES Entrenador(id),
    CONSTRAINT fk_entrenador2 FOREIGN KEY (id_entrenador2) REFERENCES Entrenador(id),
    CONSTRAINT fk_ganador FOREIGN KEY (ganador) REFERENCES Entrenador(id),
    CONSTRAINT check_fase CHECK(fase IN ('Octavos', 'Cuartos', 'Semifinal', 'Final'))
);

CREATE TABLE Equipo_Entrenador(
    id_entrenador INT, 
    id_pokemon INT, 
    genero NVARCHAR2(3), 
    nivel INT, 
    exp_actual FLOAT, 
    exp_necesaria FLOAT, 
    id_ataque1 INT,
    id_ataque2 INT, 
    id_ataque3 INT, 
    id_ataque4 INT, 
    id_habilidad INT,
    CONSTRAINT equipo_fk PRIMARY KEY (id_entrenador, id_pokemon),
    CONSTRAINT fk_ataque1 FOREIGN KEY (id_ataque1) REFERENCES Ataque(id),
    CONSTRAINT fk_ataque2 FOREIGN KEY (id_ataque2) REFERENCES Ataque(id),
    CONSTRAINT fk_ataque3 FOREIGN KEY (id_ataque3) REFERENCES Ataque(id),
    CONSTRAINT fk_ataque4 FOREIGN KEY (id_ataque4) REFERENCES Ataque(id),
    CONSTRAINT fk_habilidad FOREIGN KEY (id_habilidad) REFERENCES Habilidad(id),
    CONSTRAINT check_positive_nivel CHECK ( nivel >= 0),
    CONSTRAINT check_positive_expActual CHECK ( exp_actual >= 0),
    CONSTRAINT check_positive_expNecesaria CHECK ( exp_necesaria >= 0),
    CONSTRAINT check_genero CHECK(genero IN ('M', 'F', 'N/A'))
);

CREATE TABLE Batalla (
    id_batalla INT, 
    id_entrenador1 INT, 
    id_pokemon1 INT, 
    id_entrenador2 INT, 
    id_pokemon2 INT, 
    dinero_ganado FLOAT,
    exp_ganada FLOAT, 
    pokemon_ganador INT, 
    entrenador_ganador INT,
    CONSTRAINT batalla_pk PRIMARY KEY (id_batalla, id_entrenador1, id_pokemon1, id_entrenador2, id_pokemon2),
    CONSTRAINT fk_entrenadorb1 FOREIGN KEY (id_entrenador1) REFERENCES Entrenador(id),
    CONSTRAINT fk_entrenadorb2 FOREIGN KEY (id_entrenador2) REFERENCES Entrenador(id),
    CONSTRAINT fk_pokemon1 FOREIGN KEY (id_pokemon1) REFERENCES pokemon(id),
    CONSTRAINT fk_pokemon2 FOREIGN KEY (id_pokemon2) REFERENCES pokemon(id),
    CONSTRAINT fk_pokeGanador FOREIGN KEY (pokemon_ganador) REFERENCES pokemon(id),
    CONSTRAINT fk_entreGanador FOREIGN KEY (entrenador_ganador) REFERENCES Entrenador(id),
    CONSTRAINT check_positive_expGanada CHECK ( exp_ganada >= 0),
    CONSTRAINT check_positive_dineroGanado CHECK ( dinero_ganado >= 0)
);